/*
 * NPC 迪西德拉·风暴荣耀 (Entry 50000) - 个人进度设置
 * 从 Lua (IndividualProgression.lua) 移植到 C++
 *
 * 核心差异说明（Lua vs C++ 模块）：
 * - Lua 使用 character_settings 表存储 tier (0-15)，C++ 使用隐藏任务 (66000+) 追踪 ProgressionState
 * - Lua 的 Tier 10 (祖阿曼) 在 C++ 中已被移除 (ProgressionState 11 被注释)
 * - C++ 有额外的中间状态 AQ_WAR=5，NPC 选项中跳过
 * - Lua 需要注销踢人来保存，C++ 的 ForceUpdateProgressionState 即时生效
 * - Lua 的 RestrictBeyondVanilla/TBC 对应 C++ 的 progressionLimit 配置
 */

#include "IndividualProgression.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "Player.h"
#include "Chat.h"

// NPC Entry
static constexpr uint32 NPC_INDIVIDUAL_PROGRESSION = 50000;

// Gossip Action IDs
enum IndividualProgressionGossipActions
{
    IP_ACTION_MAIN_MENU       = GOSSIP_ACTION_INFO_DEF + 1,
    IP_ACTION_BACK            = GOSSIP_ACTION_INFO_DEF + 2,
    IP_ACTION_EXPLANATION     = GOSSIP_ACTION_INFO_DEF + 3,
    IP_ACTION_TIER_BASE       = GOSSIP_ACTION_INFO_DEF + 10  // Tier 选项从 +10 开始
};

// 进度 Tier 选项：将用户可选项映射到 C++ ProgressionState
// 注意：跳过 PROGRESSION_AQ_WAR(5) 中间状态和已注释的 PROGRESSION_TBC_TIER_3(11, 祖阿曼)
struct ProgressionTierInfo
{
    ProgressionState state;
    const char* icon;
    const char* text;
};

static const ProgressionTierInfo tierOptions[] =
{
    { PROGRESSION_START,         "|TInterface\\icons\\inv_helmet_74:45:45:-40|t|cff8b0000",       "起始阶段 - 无任何进度（60级）|r" },
    { PROGRESSION_MOLTEN_CORE,   "|TInterface\\icons\\achievement_boss_ragnaros:45:45:-40|t|cff8b0000",    "Tier 1 - 熔火之心已完成（60级）|r" },
    { PROGRESSION_ONYXIA,        "|TInterface\\icons\\achievement_boss_onyxia:45:45:-40|t|cff8b0000",      "Tier 2 - 奥妮克希亚已完成（60级）|r" },
    { PROGRESSION_BLACKWING_LAIR,"|TInterface\\icons\\achievement_boss_nefarion:45:45:-40|t|cff8b0000",    "Tier 3 - 黑翼之巢已完成（60级）|r" },
    { PROGRESSION_PRE_AQ,        "|TInterface\\icons\\achievement_zone_silithus_01:45:45:-40|t|cff8b0000", "Tier 4 - 安其拉废墟已完成（60级）|r" },
    { PROGRESSION_AQ,            "|TInterface\\icons\\achievement_boss_cthun:45:45:-40|t|cff8b0000",       "Tier 5 - 安其拉神殿已完成（60级）|r" },
    { PROGRESSION_NAXX40,        "|TInterface\\icons\\achievement_boss_kelthuzad_01:45:45:-40|t|cff8b0000","Tier 6 - 纳克萨玛斯40人已完成（60级）|r" },
    { PROGRESSION_PRE_TBC,       "|TInterface\\icons\\achievement_boss_princemalchezaar_02:45:45:-40|t|cff006400", "Tier 7 - 卡拉赞、格鲁尔、玛瑟里顿已完成（70级）|r" },
    { PROGRESSION_TBC_TIER_1,    "|TInterface\\icons\\achievement_character_bloodelf_male:45:45:-40|t|cff006400", "Tier 8 - 毒蛇神殿、风暴要塞已完成（70级）|r" },
    { PROGRESSION_TBC_TIER_2,    "|TInterface\\icons\\achievement_boss_illidan:45:45:-40|t|cff006400",     "Tier 9 - 海加尔山之战、黑暗神殿已完成（70级）|r" },
    { PROGRESSION_TBC_TIER_4,    "|TInterface\\icons\\achievement_boss_kiljaedan:45:45:-40|t|cff006400",   "Tier 10 - 太阳之井高地已完成（70级）|r" },
    { PROGRESSION_TBC_TIER_5,    "|TInterface\\icons\\achievement_boss_kelthuzad_01:45:45:-40|t|cff00008b","Tier 11 - 纳克萨玛斯WotLK、永恒之眼、黑曜石圣殿已完成（80级）|r" },
    { PROGRESSION_WOTLK_TIER_1,  "|TInterface\\icons\\achievement_boss_algalon_01:45:45:-40|t|cff00008b",  "Tier 12 - 奥杜尔已完成（80级）|r" },
    { PROGRESSION_WOTLK_TIER_2,  "|TInterface\\icons\\achievement_reputation_argentcrusader:45:45:-40|t|cff00008b", "Tier 13 - 十字军的试炼已完成（80级）|r" },
    { PROGRESSION_WOTLK_TIER_3,  "|TInterface\\icons\\achievement_boss_lichking:45:45:-40|t|cff00008b",   "Tier 14 - 冰冠堡垒已完成（80级）|r" },
    { PROGRESSION_WOTLK_TIER_4,  "|TInterface\\icons\\spell_shadow_twilight:45:45:-40|t|cff00008b",       "Tier 15 - 红玉圣殿已完成（80级）|r" },
};

static constexpr uint8 tierOptionCount = sizeof(tierOptions) / sizeof(tierOptions[0]);

// 获取进度状态的中文描述
static const char* GetProgressionStateText(uint8 state)
{
    for (uint8 i = 0; i < tierOptionCount; ++i)
    {
        if (tierOptions[i].state == state)
            return tierOptions[i].text;
    }
    return "未知";
}

class npc_individual_progression : public CreatureScript
{
public:
    npc_individual_progression() : CreatureScript("npc_individual_progression") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (!player || !creature)
            return false;

        ClearGossipMenuFor(player);

        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_helmet_74:45:45:-40|t|cff00008b设置个人进度|r", GOSSIP_SENDER_MAIN, IP_ACTION_MAIN_MENU);
        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_scroll_03:45:45:-40|t|cff00008b什么是个人进度?|r", GOSSIP_SENDER_MAIN, IP_ACTION_EXPLANATION);

        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());

        // NPC 说话
        creature->Say("与我交谈将允许您人为地设置您想要进入的游戏阶段，从而绕过任何正常的进程。", LANG_UNIVERSAL);

        // 显示当前进度
        uint8 currentProgression = sIndividualProgression->GetPlayerProgressionFromQuests(player);
        if (currentProgression > 0)
        {
            std::string sayText = "您当前的进度级别是: " + std::string(GetProgressionStateText(currentProgression));
            creature->Say(sayText.c_str(), LANG_UNIVERSAL);
        }
        else
        {
            creature->Whisper("您尚未设置任何个人进度。联系 GM 寻求帮助。", LANG_UNIVERSAL, player);
        }

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        if (!player || !creature)
            return false;

        // 主菜单 - 显示 Tier 选择列表
        if (action == IP_ACTION_MAIN_MENU)
        {
            ClearGossipMenuFor(player);

            for (uint8 i = 0; i < tierOptionCount; ++i)
            {
                std::string optionText = std::string(tierOptions[i].icon) + tierOptions[i].text;
                AddGossipItemFor(player, GOSSIP_ICON_CHAT, optionText, GOSSIP_SENDER_MAIN, IP_ACTION_TIER_BASE + i);
            }

            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\achievement_guildperk_massresurrection:45:45:-40|t 后退", GOSSIP_SENDER_MAIN, IP_ACTION_BACK);
            SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
        }

        // 后退 - 回到主菜单
        if (action == IP_ACTION_BACK)
        {
            ClearGossipMenuFor(player);

            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_helmet_74:45:45:-40|t|cff00008b设置个人进度|r", GOSSIP_SENDER_MAIN, IP_ACTION_MAIN_MENU);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\inv_scroll_03:45:45:-40|t|cff00008b什么是个人进度?|r", GOSSIP_SENDER_MAIN, IP_ACTION_EXPLANATION);
            SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
        }

        // 说明
        if (action == IP_ACTION_EXPLANATION)
        {
            ClearGossipMenuFor(player);

            AddGossipItemFor(player, GOSSIP_ICON_CHAT,
                "个人进度旨在模拟个人玩家的\"通过扩展和扩展层取得的进步\"。玩家必须完成每一层才能访问下一层的内容。\n\n"
                "每一层都旨在模拟在该层和扩展中的体验，以适应 WotLK 客户端。这意味着原版内容就像原版魔兽世界，TBC 就像 TBC，等等。\n\n"
                "此功能的目标是专注于玩家的旅程。所有追赶机制均已被删除。\n\n"
                "不需要\"新\"服务器，因为每个新角色都是一个新服务器。请注意，此功能要么需要许多玩家在每个层的服务器上一起工作，"
                "要么调整较小的团队规模以允许各个组进步（或更多机器人）。请参阅 world.conf 中的自动平衡模块和 NPC 机器人设置，"
                "了解一些可在人口较少的服务器上改进此过程的调整。",
                GOSSIP_SENDER_MAIN, IP_ACTION_BACK);

            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "|TInterface\\icons\\achievement_guildperk_massresurrection:45:45:-40|t 后退", GOSSIP_SENDER_MAIN, IP_ACTION_BACK);
            SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
        }

        // Tier 选择
        if (action >= IP_ACTION_TIER_BASE)
        {
            uint8 tierIndex = action - IP_ACTION_TIER_BASE;
            if (tierIndex >= tierOptionCount)
            {
                CloseGossipMenuFor(player);
                return false;
            }

            ProgressionState newState = tierOptions[tierIndex].state;

            // 检查进度上限（非 GM 玩家）
            if (!player->IsGameMaster())
            {
                if (sIndividualProgression->progressionLimit && newState > sIndividualProgression->progressionLimit)
                {
                    ChatHandler(player->GetSession()).SendSysMessage("根据服务器配置，您无法设置到该进度级别。");
                    CloseGossipMenuFor(player);
                    return false;
                }
            }

            // 设置进度
            if (newState == PROGRESSION_START)
            {
                // ForceUpdateProgressionState 对 state=0 直接返回，需要手动清除所有进度任务
                for (uint8 i = PROGRESSION_MOLTEN_CORE; i <= PROGRESSION_WOTLK_TIER_5; ++i)
                {
                    uint32 progressionQuest = 66000 + i;
                    if (player->GetQuestStatus(progressionQuest) == QUEST_STATUS_REWARDED)
                        player->RemoveRewardedQuest(progressionQuest);
                }
            }
            else
            {
                uint8 currentState = sIndividualProgression->GetPlayerProgressionFromQuests(player);

                // 如果降级，清除可能残留的成就（与 .ip set 命令行为一致）
                if (newState < currentState)
                {
                    CheckProgressionAchievements(player, currentState, newState);
                }

                sIndividualProgression->ForceUpdateProgressionState(player, newState);
            }

            // 更新相位
            uint32 currentArea = player->GetAreaId();
            sIndividualProgression->checkIPPhasing(player, currentArea);

            CloseGossipMenuFor(player);

            std::string broadcastMsg = "您的个人进度已设置为: " + std::string(tierOptions[tierIndex].text);
            ChatHandler(player->GetSession()).SendSysMessage(broadcastMsg.c_str());

            return true;
        }

        return false;
    }

private:
    // 成就清理逻辑（从 cs_individualProgression.cpp 的 CheckProgressionAchievements 移植）
    static void CheckProgressionAchievements(Player* target, uint8 currentState, uint8 progressionLevel)
    {
        if (!currentState || !target || !target->IsInWorld())
            return;

        static const std::unordered_map<uint8, uint32> bossMap =
        {
            { 0,  RAGNAROS_KILL     },
            { 1,  ONYXIA_KILL       },
            { 2,  NEFARIAN_KILL     },
            { 5,  C_THUN_KILL       },
            { 8,  MALCHEZAAR_KILL   },
            { 9,  KAEL_THAS_KILL    },
            { 10, ILLIDAN_KILL      },
            { 12, KIL_JAEDEN_KILL   },
            { 13, KEL_THUZAD_KILL   },
            { 15, ANUB_ARAK_KILL    },
            { 16, LICH_KING_KILL    },
            { 17, HALION_KILL       },
        };

        uint16 playerGUID = target->GetGUID().GetCounter();

        for (auto const& [progressionId, achievementId] : bossMap)
        {
            if (progressionId < progressionLevel || progressionId >= currentState)
                continue;

            if (target->HasAchieved(achievementId))
                sIndividualProgression->RemovePlayerAchievement(playerGUID, achievementId);
        }
    }
};

void AddSC_npc_individual_progression()
{
    new npc_individual_progression();
}
