DELETE FROM `gameobject` WHERE `id` IN (176146, 176147, 176148);
REPLACE INTO `gameobject` (`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(176146, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1), -- Gate of Ahn'Qiraj
(176147, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1), -- Ahn'Qiraj Gate Roots
(176148, 1, -8133.34, 1525.13, 17.1904, 6.28103, 0.00107995, -0.999999, 600, 100, 1); -- Ahn'Qiraj Gate Runes

-- Ghost Gate - should not be placed, remove it if it is present
DELETE FROM `gameobject` WHERE `id` = 180322;

-- Ahn'Qiraj Gate, Roots and Runes
UPDATE `gameobject_template_addon` SET `flags` = 4 WHERE `entry` IN (176146, 176147, 176148);
UPDATE `gameobject_template` SET `ScriptName` = 'aq_gate' WHERE `entry` IN (176146, 176147, 176148);

-- fix tiny red crystal quest not completing
UPDATE `gameobject_template` SET `ScriptName` = 'gobject_crystalline_tear' WHERE `entry` = 180633; -- was go_crystalline_tear

-- add unused crystal to avoid worldserver error due to 'go_crystalline_tear' scrypt no longer being used.
DELETE FROM `gameobject_template` WHERE `entry` = 280633;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `Data1`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(280633, 2, 5746, '水晶之泪', 1, 7062, '', 'go_crystalline_tear', 12340);

-- Scarab Gong
-- See related AC PR: https://github.com/azerothcore/azerothcore-wotlk/pull/12879/files
UPDATE `gameobject_template` SET `type` = 2, `ScriptName` = "gobject_scarab_gong" WHERE `entry` = 180717;
UPDATE `gameobject` SET `id` = 180717 WHERE `guid` = 49451;
DELETE FROM `gameobject_questender` WHERE `quest`=8743;
REPLACE INTO `gameobject_questender` (`id`, `quest`) VALUES (180717, 8743);
DELETE FROM `gameobject_queststarter` WHERE `quest`=8743;
REPLACE INTO `gameobject_queststarter` (`id`, `quest`) VALUES (180717, 8743);

SET @STRING_ENTRY := 41100;
DELETE FROM `acore_string` WHERE `entry` IN  (@STRING_ENTRY);
REPLACE INTO `acore_string` (`entry`, `content_default`) VALUES
(@STRING_ENTRY, '青铜龙的勇士%s已经敲响甲虫之墙上的铜锣。古老的安其拉之门打开了，那场被遗忘的战争的恐怖气息再一次弥漫了希利苏斯……');

-- Fix drop rate for Nightmare_corruption
UPDATE `creature_loot_template` SET `Chance` = 5 WHERE `Item` = 21146;
UPDATE `creature_loot_template` SET `Chance` = 5 WHERE `Item` = 21147;
UPDATE `creature_loot_template` SET `Chance` = 5 WHERE `Item` = 21148;

-- Fix drop rate for Narain's Scrying Goggles
UPDATE `creature_loot_template` SET `Chance` = 2 WHERE `Item` = 20951;

-- Fix missing quest details for The Charge of the Dragonflights
UPDATE `quest_template` SET `QuestDescription` = '伊兰尼库斯、瓦拉斯塔兹和艾索雷葛斯……凡人，你一定知道这些巨龙。他们作为这个世界的守护者发挥了如此重要的影响，这绝非巧合。但不幸的是，无论是由于上古之神的爪牙的作祟，还是那些自称是他们朋友的人的背叛，每一位守护者都遭遇了悲剧。正是这些悲剧，加深了我对你们这个种族的不信任。去找他们吧……做好最坏的打算。', `LogDescription` = '与阿纳克洛斯交谈。',  `QuestCompletionLog` = '与阿纳克洛斯交谈。' WHERE `ID` = 8555;
UPDATE `quest_template_locale` SET `Details` = 'Eranikus, Vaelastrasz, et Azuregos... Vous avez certainement entendu parler de ces dragons, mortel. Ce n''est pas une simple coïncidence si chacun d''eux a joué un grand rôle comme gardien de ce monde. Malheureusement, et ma propre naïveté en est en partie responsable, ces gardiens ont tous succombé à de terribles tragédies, si terribles qu''elles ont alimenté ma méfiance à l''égard de votre espèce. Cherchez-les… Et préparez-vous au pire.', `Objectives` = 'Parlez à Anachronos.',  `CompletedText` = 'Parlez à Anachronos.' WHERE `ID` = 8555 AND `locale` = 'frFR';

-- Fix missing quest details for Translating the Ledger
UPDATE `quest_template` SET `QuestDescription` = '首先！我们需要弄清楚艾索雷葛斯在这本账册里写了什么。你说他让你做一个奥金鱼漂，而且这就是图纸？真奇怪他会用龙语来写这个。那老山羊知道我看不懂这些鬼画符。如果这事要成，我需要我的占卜眼镜，一只五百磅的鸡，还有《龙语傻瓜教程》第二卷。顺序不一定。', `LogDescription` = '我们需要弄清楚艾索雷葛斯在这本账册里写了什么。',  `QuestCompletionLog` = '我们需要弄清楚艾索雷葛斯在这本账册里写了什么。' WHERE `ID` = 8576;
UPDATE `quest_template_locale` SET `Details` = 'Commençons par le commencement ! Il faut comprendre ce que Azuregos a écrit dans ce registre. Vous dites qu''il vous a demandé de fabriquer une bouée en arcanite avec le schéma ? Étrange qu''il ait écrit ça en draconique. Ce vieux bouc sait que je ne peux pas déchiffrer ces absurdités. Pour que ça marche, il me faut mes lunettes de divination, un poulet de deux cents kilos et le tome II de Draconique pour les Nuls.', `Objectives` = 'Nous devons découvrir ce que Azuregos a écrit dans ce registre.',  `CompletedText` = 'Nous devons découvrir ce que Azuregos a écrit dans ce registre.' WHERE `ID` = 8576 AND `locale` = 'frFR';

-- New 'Bang a Gong!' quest. No rewards for completing this version. No mount, no title. Currently the Mallet of Zul'Farrak is required to bang the gong.
-- New 'Chaos and Destruction' quest. Kill Colossus of Zora(15740), Regal(15741) and Ashi(15742)
DELETE FROM `quest_template` WHERE `ID` IN (108743, 108744, 108745, 108746, 108747);
REPLACE INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, 
`StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, 
`RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, 
`POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, 
`TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, 
`RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES 

(108743, 0, 60, 60, 1377, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '敲响铜锣！', '', '', NULL, '回到希利苏斯的甲虫之锣处。', 0, 0, 0, 0, 0, 0, 0, 0, 9240, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, '', '', '', '', 12340),
(108744, 2, 60, 60, 1377, 82, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 910, 7, 0, 609, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '混乱与毁灭', '杀死诺克霍尔中将、3个巨型阿努比萨斯战争使者和12个超级阿努比萨斯战争使者。', '', '', '回到甲虫之锣旁的天启者乔纳森处。', 15818, 15743, 15758, 0, 1, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', NULL),
(108745, 2, 60, 60, 1377, 82, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 910, 7, 0, 609, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '佐拉巨甲虫', '杀死佐拉巨甲虫。', '', '', '回到甲虫之锣旁的天启者乔纳森处。', 15740, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', NULL),
(108746, 2, 60, 60, 1377, 82, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 910, 7, 0, 609, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '雷戈巨甲虫', '杀死雷戈巨甲虫。', '', '', '回到甲虫之锣旁的天启者乔纳森处。', 15741, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', NULL),
(108747, 2, 60, 60, 1377, 82, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 910, 7, 0, 609, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '亚什巨甲虫', '杀死亚什巨甲虫。', '', '', '回到甲虫之锣旁的天启者乔纳森处。', 15742, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', NULL);

-- don't count quests for the loremaster achievement
DELETE FROM `quest_template_addon` WHERE `ID` IN (108743, 108744, 108745, 108746, 108747);
REPLACE INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, 
`RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES 
(108743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256),
(108744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 256),
(108745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 258),
(108746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 258),
(108747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 258);

UPDATE `quest_template` SET `RewardNextQuest` = 0 WHERE `ID` = 8743; -- can be removed later

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `ConditionTypeOrReference` = 8 AND `SourceEntry` IN (8286, 8857, 8858, 8859, 108743, 108744, 108745, 108746, 108747);
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, 
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
--
(19, 0, 8286, 0, 0, 8, 0, 108850, 0, 0, 0, 0, 0, '',   'Quest \'What Tomorrow Brings\' requires the \'Complete the War Effort\' quest to be completed'),
(19, 0, 8286, 0, 1, 8, 0, 108855, 0, 0, 0, 0, 0, '',   'Quest \'What Tomorrow Brings\' requires the \'Complete the War Effort\' quest to be completed'),
(19, 0, 8857, 0, 1, 8, 0, 108747, 0, 0, 0, 0, 0, '',   'Quest \'Secrets of the Colossus - Ashi\' requires the \'Colossus of Ashi\' quest to be completed'),
(19, 0, 8858, 0, 1, 8, 0, 108746, 0, 0, 0, 0, 0, '',   'Quest \'Secrets of the Colossus - Regal\' requires the \'Colossus of Regal\' quest to be completed'),
(19, 0, 8859, 0, 1, 8, 0, 108745, 0, 0, 0, 0, 0, '',   'Quest \'Secrets of the Colossus - Zora\' requires the \'Colossus of Zora\' quest to be completed'),
(19, 0, 108743, 0, 0, 8, 0, 8743, 0, 0, 1, 0, 0, '',   'Quest \'Simply Bang a Gong!\' requires the \'Bang a Gong!\' quest to NOT be completed'),
(19, 0, 108743, 0, 0, 8, 0, 108850, 0, 0, 0, 0, 0, '', 'Quest \'Simply Bang a Gong!\' requires the \'Complete the War Effort\' quest to be completed'),
(19, 0, 108743, 0, 1, 8, 0, 8743, 0, 0, 1, 0, 0, '',   'Quest \'Simply Bang a Gong!\' requires the \'Bang a Gong!\' quest to NOT be completed'),
(19, 0, 108743, 0, 1, 8, 0, 108855, 0, 0, 0, 0, 0, '', 'Quest \'Simply Bang a Gong!\' requires the \'Complete the War Effort\' quest to be completed'),
(19, 0, 108744, 0, 0, 8, 0, 108745, 0, 0, 0, 0, 0, '', 'Quest \'Chaos and Destruction\' requires the \'Colossus of Zora\' quest to be completed'),
(19, 0, 108744, 0, 0, 8, 0, 108746, 0, 0, 0, 0, 0, '', 'Quest \'Chaos and Destruction\' requires the \'Colossus of Regal\' quest to be completed'),
(19, 0, 108744, 0, 0, 8, 0, 108747, 0, 0, 0, 0, 0, '', 'Quest \'Chaos and Destruction\' requires the \'Colossus of Ashi\' quest to be completed'),
(19, 0, 108745, 0, 0, 8, 0, 8743, 0, 0, 0, 0, 0, '',   'Quest \'Colossus of Zora\' requires either quest 8743 or 108743 to be completed'),
(19, 0, 108745, 0, 1, 8, 0, 108743, 0, 0, 0, 0, 0, '', 'Quest \'Colossus of Zora\' requires either quest 8743 or 108743 to be completed'),
(19, 0, 108746, 0, 0, 8, 0, 8743, 0, 0, 0, 0, 0, '',   'Quest \'Colossus of Regal\' requires either quest 8743 or 108743 to be completed'),
(19, 0, 108746, 0, 1, 8, 0, 108743, 0, 0, 0, 0, 0, '', 'Quest \'Colossus of Regal\' requires either quest 8743 or 108743 to be completed'),
(19, 0, 108747, 0, 0, 8, 0, 8743, 0, 0, 0, 0, 0, '',   'Quest \'Colossus of Ashi\' requires either quest 8743 or 108743 to be completed'),
(19, 0, 108747, 0, 1, 8, 0, 108743, 0, 0, 0, 0, 0, '', 'Quest \'Colossus of Ashi\' requires either quest 8743 or 108743 to be completed');

-- update quest texts for the new 'Simply Bang a Gong!' quest
DELETE FROM `quest_request_items` WHERE `ID` IN (108743, 108744);
REPLACE INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES 
(108743, 1, 0, '甲虫之锣在你面前不祥地矗立着。坚强起来，$N；一旦甲虫之锣被敲响，安其拉的大门就将被打开。$B$B然而，诺兹多姆的子民和塞纳里奥议会不会奖励你，除非你帮助他们。', 12340),
(108744, 1, 0, '', NULL);

DELETE FROM `quest_offer_reward` WHERE `ID` IN (108743, 108744);
REPLACE INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES 
(108743, 0, 0, 0, 0, 0, 0, 0, 0, '甲虫之锣附近的地面上升起一颗特别的水晶。也许是诺兹多姆子民的恩赐。', 12340),
(108744, 0, 0, 0, 0, 0, 0, 0, 0, '', NULL);
    
DELETE FROM `quest_template_addon` WHERE `ID` IN (8743);
REPLACE INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, 
`RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES 
(8743, 0, 0, 0, 8742, 0, 0, 0, 0, 0, 0, 910, 0, 0, 0, 0, 0);

UPDATE `quest_template` SET `QuestDescription` = '' WHERE `ID` = 108743;    
    
-- Connect new 'Bang a Gong!' quest to the Scarab Gong in Silithus
DELETE FROM `gameobject_queststarter` WHERE `id` = 180717 AND `quest` IN (8743, 108743, 108744);
REPLACE INTO `gameobject_queststarter` (`id`, `quest`) VALUES (180717, 8743), (180717, 108743);

DELETE FROM `gameobject_questender` WHERE `id` = 180717 AND `quest` IN (8743, 108743);
REPLACE INTO `gameobject_questender` (`id`, `quest`) VALUES (180717, 8743), (180717, 108743);

DELETE FROM `creature_queststarter` WHERE `id` = 15693 AND `quest` IN (108744, 108745, 108746, 108747);
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (15693, 108744), (15693, 108745), (15693, 108746), (15693, 108747);

DELETE FROM `creature_questender` WHERE `id` = 15693 AND `quest` IN (8745, 108744, 108745, 108746, 108747);
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES (15693, 8745), (15693, 108744), (15693, 108745), (15693, 108746), (15693, 108747);

-- quest: The Nightmare Manifests, solve issue in Nighthaven (Moonglade)
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1549101 AND `source_type` = 9 AND `id` IN (17, 18, 19);
REPLACE INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
--
(1549101, 9, 17, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Eranikus, Tyrant of the Dream - On Script - Set Faction 14'),
(1549101, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,        'Eranikus, Tyrant of the Dream - On Script - Set Reactstate Aggressive'),
(1549101, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,     'Eranikus, Tyrant of the Dream - On Script - Remove Unattackable Flags');
