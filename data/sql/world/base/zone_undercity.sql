-- By leewheel 2026-07-07 翻译NPC副标题为中文
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级制皮师'     WHERE `entry` = 223;   -- 丹·戈萨斯 <初级制皮师> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 83, `subname` = '初级技师'         WHERE `entry` = 4586;  -- 格拉哈姆·范·塔伦 <初级技师>  -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级铁匠'        WHERE `entry` = 4605;  -- 巴兹尔·弗莱伊 <初级铁匠> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级炼金师'             WHERE `entry` = 4609;  -- 马尔什医生 <初级炼金师> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级炼金师' WHERE `entry` = 11044; -- 马丁·费尔本 <初级炼金师> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级裁缝'            WHERE `entry` = 11048; -- 维克多·瓦德 <初级裁缝> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级裁缝'                WHERE `entry` = 11049; -- 雷安诺·戴维斯 <初级裁缝> -- `trainer_type` = 2
UPDATE `creature_template` SET `npcflag` = 81, `subname` = '初级附魔师'         WHERE `entry` = 11067; -- 玛考布·维恩 <初级附魔师> -- `trainer_type` = 2
-- End By leewheel

UPDATE `creature_template` SET `type_flags` = 134217728 WHERE `entry` IN (4609, 11049);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceEntry`=0 AND `ConditionTypeOrReference`=7 AND `SourceGroup` IN (1022, 4130, 4132, 4166, 4210, 4352, 4354);
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES
(15, 4130, 0, 7, 171, 50,  '炼金术达到50及以上时显示菜单'),        -- 马尔什医生 <专家级炼金师>
(15, 4132, 0, 7, 171, 125, '炼金术达到125及以上时显示菜单'),       -- 赫伯特·哈尔西医生 <大师级炼金师>
(15, 1022, 0, 7, 164, 50,  '锻造达到50及以上时显示菜单'),  -- 詹姆斯·范·布鲁特 <专家级铁匠>
(15, 4166, 0, 7, 333, 50,  '附魔达到50及以上时显示菜单'),     -- 拉维尼亚·克劳 <专家级附魔师>
(15, 4210, 0, 7, 165, 50,  '制皮达到50及以上时显示菜单'), -- 亚瑟·摩尔 <专家级制皮师>
(15, 4352, 0, 7, 197, 50,  '裁缝达到50及以上时显示菜单'),      -- 瑞安娜·戴维斯 <专家级裁缝>
(15, 4354, 0, 7, 197, 125, '裁缝达到125及以上时显示菜单');     -- 约瑟夫·格雷戈里安 <大师级裁缝>

DELETE FROM `gossip_menu_option` WHERE (`MenuID`) IN (2847, 2848, 2849);
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, 
            `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(2847, 0, 0, '炼金术', 3460, 1, 1, 2834, 336, 0, 0, NULL, 0, 0),
(2847, 1, 0, '锻造', 3461, 1, 1, 2835, 337, 0, 0, NULL, 0, 0),
(2847, 2, 0, '烹饪', 3462, 1, 1, 2836, 338, 0, 0, NULL, 0, 0),
(2847, 3, 0, '附魔', 3463, 1, 1, 2837, 339, 0, 0, NULL, 0, 0),
(2847, 4, 0, '工程学', 4976, 1, 1, 2838, 340, 0, 0, NULL, 0, 0),
(2847, 5, 0, '急救', 3464, 1, 1, 2839, 341, 0, 0, NULL, 0, 0),
(2847, 6, 0, '钓鱼', 3465, 1, 1, 2840, 342, 0, 0, NULL, 0, 0),
(2847, 7, 0, '草药学', 3466, 1, 1, 2841, 343, 0, 0, NULL, 0, 0),
(2847, 8, 0, '铭文', 48811, 1, 1, 10019, 344, 0, 0, NULL, 0, 0),
(2847, 9, 0, '制皮', 3467, 1, 1, 2842, 345, 0, 0, NULL, 0, 0),
(2847, 10, 0, '采矿', 3468, 1, 1, 2843, 347, 0, 0, NULL, 0, 0),
(2847, 11, 0, '剥皮', 3471, 1, 1, 2844, 346, 0, 0, NULL, 0, 0),
(2847, 12, 0, '裁缝', 3469, 1, 1, 2845, 348, 0, 0, NULL, 0, 0),
(2848, 0, 0, '法师', 3448, 1, 1, 2821, 331, 0, 0, NULL, 0, 0),
(2848, 2, 0, '牧师', 3449, 1, 1, 2829, 332, 0, 0, NULL, 0, 0),
(2848, 3, 0, '潜行者', 4885, 1, 1, 2830, 333, 0, 0, NULL, 0, 0),
(2848, 4, 0, '术士', 4886, 1, 1, 2832, 334, 0, 0, NULL, 0, 0),
(2848, 5, 0, '战士', 2910, 1, 1, 2833, 335, 0, 0, NULL, 0, 0),
(2849, 0, 0, '银行', 4888, 1, 1, 2822, 319, 0, 0, NULL, 0, 0),
(2849, 1, 0, '蝙蝠管理员', 6790, 1, 1, 2823, 321, 0, 0, NULL, 0, 0),
(2849, 2, 0, '公会管理员', 3428, 1, 1, 2824, 323, 0, 0, NULL, 0, 0),
(2849, 3, 0, '旅店', 5090, 1, 1, 2825, 324, 0, 0, NULL, 0, 0),
(2849, 4, 0, '邮箱', 5514, 1, 1, 2826, 326, 0, 0, NULL, 0, 0),
(2849, 5, 0, '拍卖行', 5515, 1, 1, 2827, 318, 0, 0, NULL, 0, 0),
(2849, 6, 0, '飞艇管理员', 5518, 1, 1, 2828, 451, 0, 0, NULL, 0, 0),
(2849, 7, 0, '武器大师', 7253, 1, 1, 3726, 328, 0, 0, NULL, 0, 0),
(2849, 8, 0, '兽栏管理员', 8508, 1, 1, 4906, 327, 0, 0, NULL, 0, 0),
(2849, 9, 0, '战场军官', 10359, 1, 1, 6334, 322, 0, 0, NULL, 0, 0),
(2849, 10, 0, '职业训练师', 5338, 1, 1, 2848, 0, 0, 0, NULL, 0, 0),
(2849, 11, 0, '专业训练师', 6635, 1, 1, 2847, 0, 0, 0, NULL, 0, 0);

-- 战场军官
DELETE FROM `creature` WHERE `id` IN (347, 2804, 15007, 20386);
REPLACE INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(600347, 347, 0, 1331.94, 334.713, -63.6249, 3.40339, 900),
(602804, 2804, 0, 1262.97, 353.389, -63.6165, 5.46288, 900),
(615007, 15007, 0, 1282.43, 284.592, -63.6281, 1.27409, 900),
(620386, 20386, 0, 1252.89, 314.549, -63.6294, 0.31416, 900);

-- 从游戏事件中移除AC放置的经典战场军官
DELETE FROM `game_event_creature` WHERE `guid` IN (208429, 208451, 208473, 208484);

/* 幽暗城之战 - 怒门事件NPC  */

SET @IPPPHASE       := 65536;
SET @IPPPHASE_II    := 131072;
SET @IPPPHASE_III   := 262144;

SET @Faranell_entry := 102055;
SET @Faranell_guid  := 602055;
SET @Varimathras    := 602425;

SET @CGUID          := 658000;
SET @WPID           := 6580000;

DELETE FROM `creature_template` WHERE `entry` IN (@Faranell_entry);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, 
`minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `rank`, `dmgschool`, `DamageModifier`, 
`BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, 
`PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, 
`RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
--
(@Faranell_entry,0,0,0,0,0,'大药剂师法拉尼尔','皇家药剂师协会',NULL,10775,50,50,0,68,3,1,1.14286,1,1,18,0,0,1.1,2000,2000,1,1,2,37376,2048,0,0,7,0,0,0,0,0,0,0,0,'',0,1,1.25,1,1,1,0,0,1,0,2,'',0);

DELETE FROM `creature_template_locale` WHERE `entry` IN (@Faranell_entry);
REPLACE INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES 
(@Faranell_entry, 'deDE', 'Apothekermeister Faranell', 'Königliche Apothekervereinigung', 18019),
(@Faranell_entry, 'esES', 'Maestro boticario Faranell', 'Sociedad Real de Boticarios', 18019),
(@Faranell_entry, 'esMX', 'Maestro boticario Faranell', 'Sociedad Real de Boticarios', 18019),
(@Faranell_entry, 'frFR', 'Maître apothicaire Faranell', 'Société royale des apothicaires', 18019),
(@Faranell_entry, 'koKR', '수석 연금술사 파라넬', '왕립 연금술 학회', 18019),
(@Faranell_entry, 'ruRU', 'Опытный аптекарь Фаранелл', 'Королевское фармацевтическое общество', 18019),
(@Faranell_entry, 'zhCN', '大药剂师法拉尼尔', '皇家药剂师协会', 18019),
(@Faranell_entry, 'zhTW', '藥劑大師法拉尼爾', '皇家藥劑師學會', 18019);

DELETE FROM `creature_template_model` WHERE `CreatureID` IN (@Faranell_entry);
REPLACE INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES 
(@Faranell_entry, 0, 1680, 1, 1, 12340);

DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (@Faranell_entry);
REPLACE INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES 
(@Faranell_entry, 1, 2199, 3695, 0, 18019);

DELETE FROM `creature_queststarter` WHERE `id` IN (@Faranell_entry);
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES 
(@Faranell_entry, 450),
(@Faranell_entry, 515),
(@Faranell_entry, 1109),
(@Faranell_entry, 1113);

DELETE FROM `creature_questender` WHERE `id` IN (@Faranell_entry);
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES 
(@Faranell_entry, 447),
(@Faranell_entry, 451),
(@Faranell_entry, 513),
(@Faranell_entry, 1109),
(@Faranell_entry, 1113),
(@Faranell_entry, 2938),
(@Faranell_entry, 12787);

DELETE FROM `creature` WHERE `guid` IN (@Faranell_guid, @Varimathras, 31901, 43466, 79263);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+1 AND @CGUID+44;
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, 
`wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES 
--
(@Faranell_guid,@Faranell_entry, 0, 0, 0, 1, 1, 1, 1434.48, 404.854, -85.1753, 2.26893, 300, 0, 0, 2215, 1807, 0, 0, 0, 0, '', 0, 0, NULL), -- 大药剂师法拉尼尔
(@Varimathras, 2425, 0, 0, 0, 1, 1, 0, 1287.7, 333.589, -59.9998, 4.86748, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL),                    -- 瓦里玛萨斯
(31901, 36273, 0, 0, 0, 1, 1, 1, 1287.7, 333.589, -59.9998, 4.86748, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL),                          -- 布拉贡·血拳
(43466, 36517, 0, 0, 0, 1, 1, 1, 1283, 338.917, -59.9998, 0.244346, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL),                           -- 阿勒瑞克·霍克金斯
(79263, 36217, 0, 0, 0, 1, 1, 0, 1438.03, 403.83, -85.1626, 3.12414, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL),                          -- 监督者克拉加什
-- 卫兵
(@CGUID+1, 5624, 0, 0, 0, 1, 1, 0, 1440.41, 350.383, -62.1024, 4.13643, 275, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+2, 5624, 0, 0, 0, 1, 1, 0, 1612.13, 189.217, -43.0189, 0.471239, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+3, 5624, 0, 0, 0, 1, 1, 0, 1423.53, 323.279, -62.1024, 1.02974, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+4, 5624, 0, 0, 0, 1, 1, 0, 1466.46, 97.3513, -61.3621, 2.35619, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+5, 5624, 0, 0, 0, 1, 1, 0, 1756.48, 348.171, -62.1424, 5.044, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+6, 5624, 0, 0, 0, 1, 1, 0, 1579.34, 291.169, -43.0189, 3.52556, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+7, 5624, 0, 0, 0, 1, 1, 0, 1591.16, 203.881, 55.3257, 0.10472, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+8, 5624, 0, 0, 0, 1, 1, 0, 1572.02, 287.895, -43.0191, 0.453786, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+9, 5624, 0, 0, 0, 1, 1, 0, 1485.13, 83.6795, -62.2117, 5.79449, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+10, 5624, 0, 0, 0, 1, 1, 0, 1722.7, 96.7601, -61.1554, 0.750492, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+11, 5624, 0, 0, 0, 1, 1, 0, 1591.86, 276.605, 55.3256, 0.017453, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+12, 5624, 0, 0, 0, 1, 1, 0, 1774.37, 216.364, -62.0757, 1.32631, 300, 0, 0, 15952, 0, 2, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+13, 5624, 0, 0, 0, 1, 1, 0, 1527.94, 73.1943, -62.0989, 2.85779, 300, 0, 0, 15952, 0, 2, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+14, 5624, 0, 0, 0, 1, 1, 0, 1600.24, 276.667, 55.3257, 3.12414, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+15, 5624, 0, 0, 0, 1, 1, 0, 1703.69, 80.5655, -62.2086, 3.57792, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+16, 5624, 0, 0, 0, 1, 1, 0, 1619.36, 192.508, -43.0191, 3.63029, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+17, 5624, 0, 0, 0, 1, 1, 0, 1427.76, 176.943, -62.053, 4.98419, 300, 0, 0, 15952, 0, 2, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+18, 5624, 0, 0, 0, 1, 1, 0, 1512.26, 68.1908, -62.2185, 2.51327, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+19, 5624, 0, 0, 0, 1, 1, 0, 1543.83, 222.605, -42.9843, 4.97419, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+20, 5624, 0, 0, 0, 1, 1, 0, 1559.28, 244.735, 55.3256, 4.83456, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+21, 5624, 0, 0, 0, 1, 1, 0, 1452.27, 113.711, -61.0702, 5.42797, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+22, 5624, 0, 0, 0, 1, 1, 0, 1691.67, 428.218, 0.338584, 5.79449, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+23, 5624, 0, 0, 0, 1, 1, 0, 1737.21, 110.932, -61.1708, 3.82227, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+24, 5624, 0, 0, 0, 1, 1, 0, 1559.61, 236.575, 55.3256, 1.64061, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+25, 5624, 0, 0, 0, 1, 1, 0, 1635.1, 421.806, -62.0939, 4.45059, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+26, 5624, 0, 0, 0, 1, 1, 0, 1768.21, 156.172, -62.2184, 4.17134, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+27, 5624, 0, 0, 0, 1, 1, 0, 1437.55, 132.92, -62.2087, 2.02458, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+28, 5624, 0, 0, 0, 1, 1, 0, 1545.49, 214.664, -42.9842, 2.02458, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+29, 5624, 0, 0, 0, 1, 1, 0, 1421.48, 160.056, -62.2018, 5.2709, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+30, 5624, 0, 0, 0, 1, 1, 0, 1763.17, 328.739, -62.1422, 3.21141, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+31, 5624, 0, 0, 0, 1, 1, 0, 1599.45, 203.725, 55.3256, 3.14159, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+32, 5624, 0, 0, 0, 1, 1, 0, 1558.44, 421.562, -62.0937, 4.95674, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+33, 5624, 0, 0, 0, 1, 1, 0, 1515.46, 413.822, -62.1024, 3.7001, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+34, 5624, 0, 0, 0, 1, 1, 0, 1679.78, 413.498, -62.2157, 5.81195, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+35, 5624, 0, 0, 0, 1, 1, 0, 1705.98, 396.834, -62.209, 2.56563, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+36, 5624, 0, 0, 0, 1, 1, 0, 1751.47, 130.047, -62.2117, 0.994838, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+37, 5624, 0, 0, 0, 1, 1, 0, 1664.33, 475.199, -11.807, 1.5708, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+38, 5624, 0, 0, 0, 1, 1, 0, 1675.57, 66.9335, -62.2018, 0.453786, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+39, 5624, 0, 0, 0, 1, 1, 0, 1494.32, 401.674, -62.1024, 0.541052, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+40, 5624, 0, 0, 0, 1, 1, 0, 1714.91, 415.04, 0.33849, 2.61799, 300, 0, 0, 15952, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+41, 5624, 0, 0, 0, 1, 1, 0, 1388.43, 421.595, -77.1538, 6.0912, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+42, 5624, 0, 0, 0, 1, 1, 0, 1446.22, 415.606, -84.9055, 3.85718, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+43, 5624, 0, 0, 0, 1, 1, 0, 1414.68, 448.16, -77.1543, 4.67748, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, NULL), 
(@CGUID+44, 5624, 0, 0, 0, 1, 1, 0, 1419.08, 389.021, -84.9804, 0.698132, 120, 0, 0, 1, 0, 0, 0, 0, 0, '', 0, 0, 'SAI Target');

UPDATE `creature` SET `phaseMask` = @IPPPHASE_II  WHERE `guid` IN (@Faranell_guid, @Varimathras); -- 怒门事件之前
UPDATE `creature` SET `phaseMask` = @IPPPHASE_III WHERE `guid` IN (31900, 31901, 43466, 79263, 203394, 203395, 203420);   -- 怒门事件之后

UPDATE `creature` SET `phaseMask` = @IPPPHASE_II  WHERE `id` = 5624;  -- 怒门事件之前
UPDATE `creature` SET `phaseMask` = @IPPPHASE_III WHERE `id` = 36213; -- 怒门事件之后

-- 卫兵路径点，可以使用现有的
DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID+12, @CGUID+13, @CGUID+17);
REPLACE INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES 
(@CGUID+12, 341030, 0, 0, 0, 0, 0, NULL),
(@CGUID+13, 341040, 0, 0, 0, 0, 0, NULL),
(@CGUID+17, 382970, 0, 0, 0, 0, 0, NULL);

-- 恢复任务系列：死亡行者
DELETE FROM `creature_questender` WHERE `id` = 36517 AND `quest` = 14418;
DELETE FROM `creature_questender` WHERE `id` = 6522  AND `quest` = 14419;
DELETE FROM `creature_questender` WHERE `id` = 6467  AND `quest` = 14420;
DELETE FROM `creature_questender` WHERE `id` = 6467  AND `quest` = 14421;
--
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES (6467, 1886);
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES (6467, 1899);
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES (6522, 1898);
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES (36517, 1978);
--
DELETE FROM `creature_queststarter` WHERE `id` = 6467 AND `quest` = 14418;
DELETE FROM `creature_queststarter` WHERE `id` = 6467 AND `quest` = 14419;
DELETE FROM `creature_queststarter` WHERE `id` = 6467 AND `quest` = 14420;
DELETE FROM `creature_queststarter` WHERE `id` = 6522 AND `quest` = 14421;
--
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (6467, 1886);
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (6467, 1898);
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (6522, 1899);

UPDATE `quest_template` SET `RewardNextQuest` = 1898 WHERE `ID` = 1886;
UPDATE `quest_template` SET `RewardNextQuest` = 1899 WHERE `ID` = 1898;
UPDATE `quest_template` SET `RewardNextQuest` = 1978 WHERE `ID` = 1899;

UPDATE `conditions` SET `ConditionValue1`= 1886,  `comment` = '阿斯特·哈德伦 - 接受任务1886时显示对话' WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 126;

-- 恢复瓦里玛萨斯的任务
DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (550, 6522, 6521, 1048, 5725);

REPLACE INTO `creature_questender` (`id`, `quest`) VALUES 
(2425, 550), (2425, 6144), (2425, 14351), (2425, 14352), (2425, 14353), (2425, 14355), (2425, 14356),
(36273, 550), (36273, 6144), (36273, 14351), (36273, 14352), (36273, 14353), (36273, 14355), (36273, 14356);

REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (2215, 550);
UPDATE `quest_template` SET `RewardNextQuest` = 550 WHERE `ID` = 541;

-- REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES (2215, 14351); -- 与550相同任务
DELETE FROM `creature_queststarter` WHERE `id` = 2215 AND `quest` = 14351;

-- 任务：邪恶同盟
DELETE FROM `creature_loot_template` WHERE `Entry` = 4421 AND `Item` = 49205 AND `Reference` = 0 AND `GroupId` = 0;
REPLACE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(4421, 17008, 0, 100, 0, 1, 0, 1, 1, '卡尔加·刺肋 - 小卷轴');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` = 4421 AND `SourceEntry` = 49205;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, 
                           `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1, 4421, 17008, 0, 0, 6, 0, 67, 0, 0, 0, 0, 0, '', NULL);

UPDATE `item_template` SET `flags` = 2048 WHERE `entry` = 17008;
UPDATE `item_template` SET `description` = '由瓦里玛萨斯大人开启。' WHERE `entry` = 3701;

-- 任务：邪恶同盟
UPDATE `quest_template`
SET `LogDescription`  = "把玛克林大使的头颅交给幽暗城的瓦里玛萨斯。",
    `QuestCompletionLog` = "转至幽暗城，去找皇家区的瓦里玛萨斯。"
WHERE `ID` = 6521;
UPDATE `quest_template_locale` SET `Objectives` = 'Apporter la Tête de l''Ambassadeur Malcin à Varimathras, à Fossoyeuse.', `CompletedText` = 'Retournez voir Varimathras au Quartier royal, à Fossoyeuse.'
WHERE `ID` = 6521 AND `locale` = 'frFR';

UPDATE `quest_template`
SET `LogDescription`  = "把小卷轴交给幽暗城的瓦里玛萨斯。",
    `QuestDescription` = "大人：$B$B您很清楚我们可以提供什么。您占领贫瘠之地及其它土地的机会非常大，我们也只想要您的帮助作为回报。所谓的帮助不过是让您授予我们在这一带行动的自由。$B$B请允许我们说得更远些。我们拥有强大的力量，并愿意与那些希望加入我们的聪明人分享。我当前仍待在剃刀高地外面。$B$B向您致以最高的敬意，$B玛克林大使",
    `QuestCompletionLog` = "转至幽暗城，去找皇家区的瓦里玛萨斯。"
WHERE `ID` = 14352;

UPDATE `quest_template`
SET `LogDescription`  = "把玛克林大使的头颅交给幽暗城的瓦里玛萨斯。",
    `QuestDescription` = "看样子，玛克林就在剃刀高地外面。我们必须将他消灭。$b$b我在奥格瑞玛的线人告诉我，他们的侦察兵在那里发现了一些奇怪的迹象。那里的野猪人身上发生了一些怪异的现象，他们的力量比以前强大了许多。不管天灾军团在那里做了什么，我们必须立刻阻止他们。$b$b找到那个玛克林，消灭他。然后回来向我报告。",
    `QuestCompletionLog` = "转至幽暗城，去找皇家区的瓦里玛萨斯。"
WHERE `ID` = 14353;

-- 任务：毁灭之力...
UPDATE `quest_template`
SET `QuestCompletionLog` = "回到幽暗城皇家区的瓦里玛萨斯处复命。"
WHERE `ID` = 5725;

UPDATE `quest_template`
SET `LogDescription`  = "将《暗影法术研究》和《扭曲虚空的魔法》这两本书交给幽暗城的瓦里玛萨斯。",
    `QuestDescription` = "听着，$c。$b$b你可能不知道，奥格瑞玛出了问题。在怒焰裂谷深处，一个叫燃刃的暗影议会分支正在进行他们邪恶的勾当。他们主要是兽人，我不能把敏感信息交给那里的步兵。这就是你来的原因。$b$b他们手中有两本书。我要防止这两本书落入燃刃和被遗忘者手中。直接把它们交给我。",
    `QuestCompletionLog` = "回到幽暗城皇家区的瓦里玛萨斯处复命。"
WHERE `ID` = 14356;

-- 任务：进入血色修道院
UPDATE `quest_template`
SET `LogDescription`  = "杀死大检察官怀特迈恩、血色十字军指挥官莫格莱尼、血色十字军勇士赫洛德、血色勇士和驯犬者洛克希，然后向幽暗城的瓦里玛萨斯复命。",
    `QuestDescription` = "我驻扎在这里的职责之一就是帮助被遗忘者守卫边境，而这，$c，正是你要替我做的事。$b$b我虽然还活着，但血色十字军杀起我的人来和杀亡灵一样快。他们在这里是个大麻烦，而你要去解决这个问题。$b$b去修道院杀掉大检察官怀特迈恩和她的副手们。",
    `QuestCompletionLog` = "回到幽暗城皇家区的瓦里玛萨斯处复命。"
WHERE `ID` = 14355;

-- 智能脚本
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (36273);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (36273);
REPLACE INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--
(36273, 0, 0, 0, 54, 0, 100, 512, 0, 0, 0, 0, 0, 0, 11, 7741, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                '瓦里玛萨斯 - 召唤时 - 施放召唤恶魔'),
(36273, 0, 1, 0, 4, 0, 100, 1, 0, 0, 0, 0, 0, 0, 4, 5887, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    '瓦里玛萨斯 - 进入战斗 - 播放音效（仅一次）'),
(36273, 0, 2, 0, 9, 0, 100, 0, 25000, 25000, 20000, 20000, 0, 30, 11, 20741, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, '瓦里玛萨斯 - 0-30码范围内 - 施放暗影箭齐射'),
(36273, 0, 3, 0, 2, 0, 100, 0, 0, 30, 20000, 20000, 0, 0, 11, 20743, 1, 0, 0, 0, 0, 5, 20, 0, 0, 0, 0, 0, 0, 0,        '瓦里玛萨斯 - 生命值0-30%时 - 施放生命汲取'),
(36273, 0, 4, 0, 9, 0, 100, 0, 20000, 20000, 15000, 25000, 0, 20, 11, 20740, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, '瓦里玛萨斯 - 0-20码范围内 - 施放精神控制');
