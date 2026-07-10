DELETE FROM `creature_queststarter` WHERE `quest` IN (4182, 4183) AND `id` = 9562;
DELETE FROM `creature_queststarter` WHERE `quest` IN (4184, 4223) AND `id` = 344;
DELETE FROM `creature_queststarter` WHERE `quest` = 4185 AND `id` = 29611;
DELETE FROM `creature_queststarter` WHERE `quest` = 4186 AND `id` = 1748;
DELETE FROM `creature_queststarter` WHERE `quest` IN (4224, 4241, 4264) AND `id` = 9560;
DELETE FROM `creature_queststarter` WHERE `quest` IN (4242, 4282, 4322) AND `id` = 9023;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(9562, 4182),  -- Dragon Menace, Helendis Riverhorn
(9562, 4183),  -- True Masters [1], Helendis Riverhorn
(344, 4184),   -- True Masters [2], Magistrate Solomon
(29611, 4185), -- True Masters [3], Varian Wrynn
(1748, 4186),  -- True Masters [4], Highlord Bolvar Fordragon
(344, 4223),   -- True Masters [5], Magistrate Solomon
(9560, 4224),  -- True Masters [6], Marshal Maxwell
(9560, 4241),  -- 'Marshal Windsor', Marshal Maxwell
(9023, 4242),  -- Abandon Hope, Marshal Windsor
(9023, 4282),  -- A Shred of Hope, Marshal Windsor
(9023, 4322);  -- Jail Break!, Marshal Windsor

DELETE FROM `creature_questender` WHERE `quest` = 4182 AND `id` = 9562;
DELETE FROM `creature_questender` WHERE `quest` IN (4183, 4186) AND `id` = 344;
DELETE FROM `creature_questender` WHERE `quest` = 4184 AND `id` = 29611;
DELETE FROM `creature_questender` WHERE `quest` = 4185 AND `id` = 1748;
DELETE FROM `creature_questender` WHERE `quest` IN (4223, 4224, 4242) AND `id` = 9560;
DELETE FROM `creature_questender` WHERE `quest`IN (4241, 4264, 4282) AND `id` = 9023;
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(9562, 4182), -- Dragon Menace, Helendis Riverhorn
(344, 4183), -- True Masters [1], Magistrate Solomon
(29611, 4184), -- True Masters [2], Varian Wrynn
(1748, 4185), -- True Masters [3], Highlord Bolvar Fordragon
(344, 4186), -- True Masters [4], Magister Solomon
(9560, 4223), -- True Masters [5], Marshal Maxwell
(9560, 4224), -- True Masters [6], Marshal Maxwell
(9023, 4241), -- 'Marshal Windsor', Marshal Windsor
(9560, 4242), -- Abandon Hope, Marshal Maxwell
(9023, 4264), -- A Crumpled Up Note, Marshal Windsor
(9023, 4282); -- A Shred of Hope, Marshal Windsor

-- True Masters quests
DELETE FROM `disables` WHERE `entry` IN (4183, 4184, 4185, 4186, 4223, 4224) AND `sourceType` = 1;

DELETE FROM `creature_questender` WHERE `quest` = 4322 AND `id` = 9560;
DELETE FROM `creature_questender` WHERE `quest` = 6402 AND `id` = 17804;
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(17804, 6402),
(9560, 4322);

DELETE FROM `creature_queststarter` WHERE `quest` = 6402 AND `id` = 9560;
DELETE FROM `creature_queststarter` WHERE `quest` = 6403 AND `id` = 12580;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(9560, 6402),
(12580, 6403);

DELETE FROM `creature_text` WHERE `CreatureID` = 466 AND `GroupID` > 0;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(466, 1, 0, '雷吉纳德，你知道，我是不能让你通过的。', 12, 0, 100, 0, 0, 0, 8121, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_MARCUS_1'),
(466, 2, 0, '%s似乎陷入了沉思。', 16, 0, 100, 0, 0, 0, 8124, 0, 'Marcus Jonathan - EMOTE_CONTEMPLATE'),
(466, 3, 0, '我很惭愧，老朋友。我不知道我该怎么办了。并不是你使那些伟大的英雄蒙羞，而是我。是我和其余堕落的政客们。他们让我们的生命中充满空洞的诺言和无尽的谎言。', 12, 0, 100, 0, 0, 0, 8125, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_MARCUS_2'),
(466, 4, 0, '我们令祖先蒙羞。我们令牺牲的同胞蒙羞……原谅我吧，雷吉纳德。', 12, 0, 100, 0, 0, 0, 8132, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_MARCUS_3'),
(466, 5, 0, '退后！你们没看到英雄正在与我们同行吗？', 12, 0, 100, 0, 0, 0, 8127, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_GUARDS_1'),
(466, 6, 0, '让开！让他们过去！', 12, 0, 100, 0, 0, 0, 8128, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_GUARDS_2'),
(466, 7, 0, '雷吉纳德·温德索尔不得受到任何伤害！让他安全地通过这里！', 14, 0, 100, 0, 0, 0, 8129, 3, 'Marcus Jonathan - SAY_JONATHAN_TO_GUARDS_3'),
(466, 8, 0, '去吧，雷吉纳德。愿光明指引着你。', 12, 0, 100, 66, 0, 0, 8130, 0, 'Marcus Jonathan - SAY_JONATHAN_TO_MARCUS_4');

UPDATE `creature_template` SET `ScriptName` = 'npc_squire_rowe' WHERE `entry` = 17804;
UPDATE `creature_template` SET `ScriptName` = 'npc_reginald_windsor' WHERE `entry` = 12580;
UPDATE `creature_template` SET `ScriptName` = 'npc_royal_stormwind_guard' WHERE `entry` = 1756;
UPDATE `creature_template` SET `ScriptName` = 'npc_marshal_windsor' WHERE `entry` = 9023;
UPDATE `creature_template` SET `ScriptName` = 'npc_jail_break_dughal_or_seecher' WHERE `entry` IN (9022, 9679);

DELETE FROM `gossip_menu` WHERE `MenuID` = 12580 AND `TextID` = 5633;
REPLACE INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(12580, 5633);

UPDATE `creature_template` SET `gossip_menu_id` = 12580, `npcflag` = `npcflag` | 1 WHERE `entry` = 12580;

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 12580;
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextId`) VALUES
(12580, 0, 0, '我准备好了，我的军队也整装待命。让我们结束这次假面舞会吧！', 8256, 1, 1, 0, 0, 0, 0, '', 0);

SET @ENTRY := 12580;
DELETE FROM `creature_text` WHERE `CreatureID` = @ENTRY;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, '嗷！', 12, 0, 100, 0, 0, 0, 8091, 0, 'Reginald Windsor - SAY_REGINALD_SHOO_HORSE'),
(@ENTRY, 1, 0, '我知道你会来的，$n。很高兴再次见到你，朋友。', 12, 0, 100, 0, 0, 0, 8090, 0, 'Reginald Windsor - SAY_REGINALD_END_INTRO'),
(@ENTRY, 2, 0, '朋友，保持警惕。除非打一架，否则母龙是不会放弃的。', 12, 0, 100, 0, 0, 0, 8107, 0, 'Reginald Windsor - SAY_REGINALD_MASQUERADE_1'),
(@ENTRY, 3, 0, '就像很久以前在卡拉赞注定的那样，怪物。我来了，带着公正的裁决而来！', 14, 0, 100, 0, 0, 0, 8109, 3, 'Reginald Windsor - SAY_REGINALD_MASQUERADE_2'),
(@ENTRY, 4, 0, '你一定要做你认为是正确的事情，马库斯。我们一起在图拉扬将军麾下服役。他使我们两个成为了今天的样子。他看错我了么？你真的相信我的目的是要破坏我们的联盟吗？我让我们的英雄们蒙羞了吗？', 12, 0, 100, 0, 0, 0, 8123, 0, 'Reginald Windsor - SAY_REGINALD_TO_MARCUS_1'),
(@ENTRY, 5, 0, '把我挡在这里可不是明智的决定，马库斯。', 12, 0, 100, 0, 0, 0, 8133, 0, 'Reginald Windsor - SAY_REGINALD_TO_MARCUS_2'),
(@ENTRY, 6, 0, '亲爱的朋友，你警惕的目光让英雄们以你为荣，你对联盟忠心耿耿。你会在必要的时候像那些俯瞰着你的英雄一样，为你的人民做出伟大的牺牲，我对此毫不怀疑。', 12, 0, 100, 0, 0, 0, 8126, 0, 'Reginald Windsor - SAY_REGINALD_TO_MARCUS_3'),
(@ENTRY, 7, 0, '现在是结束她统治的时候了，马库斯。让开，我的朋友。', 12, 0, 100, 0, 0, 0, 8134, 0, 'Reginald Windsor - SAY_REGINALD_TO_MARCUS_4'),
(@ENTRY, 8, 0, '谢谢你，老朋友。你做得对。', 12, 0, 100, 0, 0, 0, 8205, 0, 'Reginald Windsor - SAY_REGINALD_TO_MARCUS_5'),
(@ENTRY, 9, 0, '跟着我，朋友。到暴风城要塞！', 12, 0, 100, 0, 0, 0, 8206, 0, 'Reginald Windsor - SAY_MASQUERADE_3'),
(@ENTRY, 10, 0, '朋友，勇敢些。这只爬虫会剧烈地翻滚起来。那是绝望的表现。你准备好了就跟我说一声。', 12, 0, 100, 0, 0, 0, 8207, 0, 'Reginald Windsor - SAY_STORMWIND_BEFORE_KEEP'),
(@ENTRY, 11, 0, '前进！', 12, 0, 100, 0, 0, 0, 8208, 0, 'Reginald Windsor - SAY_MOVE_IN_KEEP'),
(@ENTRY, 12, 0, '国王陛下，请在一切还来得及的时候赶快退避一下吧。她并非你所想象的那样……', 12, 0, 100, 0, 0, 0, 8210, 0, 'Reginald Windsor - SAY_REGINALD_TO_ANDUINN'),
(@ENTRY, 13, 0, '化妆舞会结束了，女伯爵普瑞斯托。或者我应该称呼你的真名……奥妮克希亚……', 12, 0, 100, 0, 0, 0, 8211, 0, 'Reginald Windsor - SAY_REGINALD_TO_KATRANA'),
(@ENTRY, 14, 0, '你逃脱不了你的命运，奥妮克希亚。预言早已注定了这一切——卡拉赞的大厅里浮现的幻景早已预示了你的结局。现在来做一个了结吧……', 12, 0, 100, 0, 0, 0, 8218, 0, 'Reginald Windsor - SAY_REGINALD_TO_KATRANA_2'),
(@ENTRY, 15, 0, '黑铁矮人认为这些石板是经过加密的。但这不是什么密码，只是古老的龙语而已。', 12, 0, 100, 0, 0, 0, 8227, 0, 'Reginald Windsor - SAY_REGINALD_TO_KATRANA_3'),
(@ENTRY, 16, 0, '听着，你这条龙。让真相大白于天下吧。', 12, 0, 100, 0, 0, 0, 8219, 0, 'Reginald Windsor - SAY_REGINALD_TO_KATRANA'),
(@ENTRY, 17, 0, '%s开始阅读石板。某种从未听过的神秘声音在你耳边回荡。', 16, 0, 100, 0, 0, 0, 8228, 0, 'Reginald Windsor - EMOTE_READ_TABLET'),
(@ENTRY, 18, 0, '别让她逃了！', 12, 0, 100, 0, 0, 0, 8247, 0, 'Reginald Windsor - SAY_REGINALD_TO_GUARDS'),
(@ENTRY, 19, 0, '伯……伯瓦尔……勋章……用它……', 12, 0, 100, 0, 0, 0, 8250, 0, 'Reginald Windsor - SAY_REGINALD_TO_BOLVAR'),
(@ENTRY, 20, 0, '%s死了。', 16, 0, 100, 0, 0, 0, 8251, 0, 'Reginald Windsor - EMOTE_WINDSOR_DIES'),
(@ENTRY, 21, 0, '%s打开包裹，取出密文石板。', 16, 0, 100, 0, 0, 0, 8226, 0, 'Reginald Windsor - EMOTE_WINDSOR_TABLETS');

SET @ENTRY := 1749;
DELETE FROM `creature_text` WHERE `CreatureID` = @ENTRY;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, '抓住他！抓住这个卑鄙的罪犯和他的同伙！', 14, 0, 100, 0, 0, 0, 8119, 3, 'Lady Katrana Prestor - SAY_KATRANA_1'),
(@ENTRY, 1, 0, '%s笑起来。', 16, 0, 100, 0, 0, 0, 8214, 0, 'Lady Katrana Prestor - EMOTE_KATRANA_LAUGH'),
(@ENTRY, 2, 0, '你会被监禁并因叛国罪接受审判，温德索尔。我会很高兴看到他们宣布你有罪，并把你送上绞刑架……', 12, 0, 100, 0, 0, 0, 8215, 0, 'Lady Katrana Prestor - SAY_KATRANA_2'),
(@ENTRY, 3, 0, '当你瘫软的尸体在绞刑架上摇摆的时候，我会为一个疯子的性命终于得到终结而高兴。毕竟，你有什么证据呢？你难道想要到这里来挑衅一个贵族，然后毫发无伤地离开？', 12, 0, 100, 0, 0, 0, 8216, 0, 'Lady Katrana Prestor - SAY_KATRANA_3');

SET @ENTRY := 1748;
DELETE FROM `creature_text` WHERE `CreatureID` = @ENTRY;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, '尊贵的陛下，请到安全的大厅去。', 12, 0, 100, 0, 0, 0, 8212, 0, 'Highlord Bolvar Fordragon - SAY_BOLVAR_TO_ANDUINN'),
(@ENTRY, 1, 0, '%s喘息着。', 16, 0, 100, 0, 0, 0, 8236, 0, 'Highlord Bolvar Fordragon - EMOTE_BOLVAR_GASP'),
(@ENTRY, 2, 0, '龙！卫兵！卫兵！抓住这个怪物！', 14, 0, 100, 0, 0, 0, 8237, 3, 'Highlord Bolvar Fordragon - SAY_BOLVAR_TO_GUARDS'),
(@ENTRY, 3, 0, '雷吉纳德……我……很抱歉。', 12, 0, 100, 0, 0, 0, 8249, 0, 'Highlord Bolvar Fordragon - SAY_BOLVAR_REGINALD_DIES');

SET @ENTRY := 12756;
DELETE FROM `creature_text` WHERE `CreatureID` = @ENTRY;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, '我好奇的是……温德索尔，在那个幻象中，你最终有没有活下来？我之所以这样问，是因为我可以确保你今天死定了。就是现在。', 12, 0, 100, 0, 0, 0, 8235, 0, 'Lady Onyxia - SAY_ONYXIA_TO_WINDSOR'),
(@ENTRY, 1, 0, '对……卫兵们，过来帮帮你们的主人！', 12, 0, 100, 0, 0, 0, 8239, 0, 'Lady Onyxia - SAY_ONYXIA_TO_WINDSOR_2'),
(@ENTRY, 2, 0, '这是命运吗，温德索尔？如果你是赶来赴死的，那么预言已经实现了。愿你的思想在扭曲虚空里面腐烂。干掉其余爱管闲事的家伙，我的孩子们。伯瓦尔，你是一个令人满意的傀儡。', 12, 0, 100, 0, 0, 0, 8246, 0, 'Lady Onyxia - SAY_ONYXIA_TO_WINDSOR_3'),
(@ENTRY, 3, 0, '你们已经失败了，凡人……再见！', 12, 0, 100, 0, 0, 0, 8248, 0, 'Lady Onyxia - SAY_ONYXIA_TO_WINDSOR_4');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=20465;
REPLACE INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,1,20465,31,3,12580,'Windsor Death hit only Reginald Windsor');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=20358;
REPLACE INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,1,20358,31,3,1749,'Windsor Read Table hit only Katrana Prestor');

SET @ENTRY  := 68;
SET @ENTRY2 := 1756;
SET @ENTRY3 := 1976;
DELETE FROM `creature_text` WHERE `CreatureID` IN (68, 1756, 1976) AND `GroupID` = 10;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 10, 0, '愿圣光与您同在，长官。', 12, 0, 100, 0, 0, 0, 8167, 0, ''),
(@ENTRY, 10, 1, '我们不过是您脚下的尘土。', 12, 0, 100, 0, 0, 0, 8177, 0, ''),
(@ENTRY, 10, 2, '……瑟银的胆量。', 12, 0, 100, 0, 0, 0, 8183, 0, ''),
(@ENTRY, 10, 3, '让开！', 12, 0, 100, 0, 0, 0, 8175, 0, ''),
(@ENTRY, 10, 4, '一个活生生的传说……', 12, 0, 100, 0, 0, 0, 8184, 0, ''),
(@ENTRY, 10, 5, '我永远都会记住这一刻。', 12, 0, 100, 0, 0, 0, 8180, 0, ''),
(@ENTRY, 10, 6, '您对我们所有人都是一种激励，阁下。', 12, 0, 100, 0, 0, 0, 8170, 0, ''),
(@ENTRY2, 10, 0, '愿圣光与您同在，长官。', 12, 0, 100, 0, 0, 0, 8167, 0, ''),
(@ENTRY2, 10, 1, '我们不过是您脚下的尘土。', 12, 0, 100, 0, 0, 0, 8177, 0, ''),
(@ENTRY2, 10, 2, '……瑟银的胆量。', 12, 0, 100, 0, 0, 0, 8183, 0, ''),
(@ENTRY2, 10, 3, '让开！', 12, 0, 100, 0, 0, 0, 8175, 0, ''),
(@ENTRY2, 10, 4, '一个活生生的传说……', 12, 0, 100, 0, 0, 0, 8184, 0, ''),
(@ENTRY2, 10, 5, '我永远都会记住这一刻。', 12, 0, 100, 0, 0, 0, 8180, 0, ''),
(@ENTRY2, 10, 6, '您对我们所有人都是一种激励，阁下。', 12, 0, 100, 0, 0, 0, 8170, 0, ''),
(@ENTRY3, 10, 0, '愿圣光与您同在，长官。', 12, 0, 100, 0, 0, 0, 8167, 0, ''),
(@ENTRY3, 10, 1, '我们不过是您脚下的尘土。', 12, 0, 100, 0, 0, 0, 8177, 0, ''),
(@ENTRY3, 10, 2, '……瑟银的胆量。', 12, 0, 100, 0, 0, 0, 8183, 0, ''),
(@ENTRY3, 10, 3, '让开！', 12, 0, 100, 0, 0, 0, 8175, 0, ''),
(@ENTRY3, 10, 4, '一个活生生的传说……', 12, 0, 100, 0, 0, 0, 8184, 0, ''),
(@ENTRY3, 10, 5, '我永远都会记住这一刻。', 12, 0, 100, 0, 0, 0, 8180, 0, ''),
(@ENTRY3, 10, 6, '您对我们所有人都是一种激励，阁下。', 12, 0, 100, 0, 0, 0, 8170, 0, '');

DELETE FROM `creature_questender` WHERE `quest` = 6402 AND `id` = 12580;
REPLACE INTO `creature_questender` VALUES
(12580, 6402);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 7480;
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextId`) VALUES
(7480, 0, 0, '请转告温德索尔元帅我已准备就绪。', 14388, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM `creature_text` WHERE `CreatureID` = 17804;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(17804, 0, 0, '我已经通知了温德索尔元帅。他应该很快就能赶到这儿。', 12, 7, 100, 0, 0, 0, 14389, 0, '');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 7480;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 7480, 0, 0, 0, 8, 0, 6403, 0, 0, 1, 0, 0, '', 'Squire Rowe - Require Stormwind Rendezvous'),
(15, 7480, 0, 0, 0, 8, 0, 6402, 0, 0, 0, 0, 0, '', 'Squire Rowe - Require Stormwind Rendezvous'),
(15, 7480, 0, 0, 1, 8, 0, 6403, 0, 0, 1, 0, 0, '', 'Squire Rowe - Require Stormwind Rendezvous'),
(15, 7480, 0, 0, 1, 28, 0, 6402, 0, 0, 0,0, 0, '', 'Squire Rowe - Require Stormwind Rendezvous');

DELETE FROM `gossip_menu` WHERE `MenuID` = 51749 AND `TextID` = 2693;
DELETE FROM `gossip_menu` WHERE `MenuID` = 51750 AND `TextID` = 2694;
DELETE FROM `gossip_menu` WHERE `MenuID` = 51751 AND `TextID` = 2695;
DELETE FROM `gossip_menu` WHERE `MenuID` = 51752 AND `TextID` = 2696;
REPLACE INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(51749, 2693),
(51750, 2694),
(51751, 2695),
(51752, 2696);

UPDATE `creature_template` SET `gossip_menu_id` = 51749 WHERE `entry` = 1749;

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (51749, 51750, 51751, 51752);
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcasttextId`) VALUES
(51749, 0, 0, '普瑞斯托女士，请原谅我的冒昧，但是伯瓦尔·弗塔根公爵让我来寻求您的建议。', 4991, 1, 1, 51750, 0, 0, 0, '', 0),
(51750, 0, 0, '很抱歉，普瑞斯托女士。', 4993, 1, 1, 51751, 0, 0, 0, '', 0),
(51751, 0, 0, '普瑞斯托女士，请你原谅。这并非我的本意。', 4995, 1, 1, 51752, 0, 0, 0, '', 0),
(51752, 0, 0, '普瑞斯托女士您费时了，谢谢你。', 4997, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM `conditions` WHERE `sourcetypeorreferenceId` = 14 AND `sourcegroup` = 51749;
DELETE FROM `conditions` WHERE `sourcetypeorreferenceId` = 15 AND `sourcegroup` = 51749;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('14','51749','2693','0','0','9','0','4185','0','0','0','0','0','','Lady Prestor, require True Masters (3)'),
('15','51749','0','0','0','9','0','4185','0','0','0','0','0','','Lady Prestor, Require True Masters (3)');

DELETE FROM `gossip_menu` WHERE `MenuID` BETWEEN 59563 AND 59575 AND `TextID` BETWEEN 2713 AND 2725;
REPLACE INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(59563, 2713),
(59564, 2714),
(59565, 2715),
(59566, 2716),
(59567, 2717),
(59568, 2718),
(59569, 2719),
(59570, 2720),
(59571, 2721),
(59572, 2722),
(59573, 2723),
(59574, 2725);

UPDATE `creature_template` SET `gossip_menu_id` = 59563 WHERE `entry` = 9563;

DELETE FROM `gossip_menu_option` WHERE `MenuID` BETWEEN 59563 AND 59575;
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcasttextId`) VALUES
(59563, 0, 0, '约翰，我有公务在身。我需要一切有关温德索尔元帅的信息。你最后一次见他是什么时候？', 5007, 1, 1, 59564, 0, 0, 0, '', 0),
(59564, 0, 0, '你干了些什么？', 5010, 1, 1, 59565, 0, 0, 0, '', 0),
(59565, 0, 0, '矮人，脑子放清醒点。我可没问你什么老爹啊名誉啊之类的事儿。', 5013, 1, 1, 59566, 0, 0, 0, '', 0),
(59566, 0, 0, '反对者？', 5015, 1, 1, 59567, 0, 0, 0, '', 0),
(59567, 0, 0, '真有趣……继续。', 5017, 1, 1, 59568, 0, 0, 0, '', 0),
(59568, 0, 0, '温德索尔就那样死了……', 5019, 1, 1, 59569, 0, 0, 0, '', 0),
(59569, 0, 0, '他是怎么死的？', 5021, 1, 1, 59570, 0, 0, 0, '', 0),
(59570, 0, 0, '好吧，他到底在哪儿？等一会！你喝醉了吗？', 5024, 1, 1, 59571, 0, 0, 0, '', 0),
(59571, 0, 0, '他为什么在黑石深渊？', 5027, 1, 1, 59572, 0, 0, 0, '', 0),
(59572, 0, 0, '300？那么说黑铁矮人杀死了他，并把他拖到了深渊里？', 5030, 1, 1, 59573, 0, 0, 0, '', 0),
(59573, 0, 0, '啊……反对者。', 5034, 1, 1, 59574, 0, 0, 0, '', 0),
(59574, 0, 0, '谢谢你，约翰。你的故事振奋人心，使我受益匪浅。', 5038, 1, 1, 0, 0, 0, 0, '', 0);

UPDATE `smart_scripts` SET `event_param1` = 59574 WHERE `entryorguid` = 9563 AND `id` = 3 AND `event_type` = 62; -- Ragged John quest credit

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 59563;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,59563,0,0,0,9,0,4224,0,0,0,0,0,'','Ragged John - Require True Masters (6)');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 1749;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 1749 AND `Source_type` = 0;
REPLACE INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) values
(1749, 0, 0, 1, 62, 0, 100, 0, 51752, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Katrana Prestor - On Gossip Option Select - Close Gossip'),
(1749, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 15, 4185, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Katrana Prestor - On Gossip Option Select - Complete Quest - The True Masters');

-- Spawn Lady Katrana Prestor
-- Positions are hand-made. There's a huge throne where she used to be spawned in classic...
DELETE FROM `creature` WHERE `guid` = 500800 AND `id` = 1749;
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(500800, 1749, 0, 0, 0, 1, 1, 1, -8435, 335.559, 122.163, 2.56468, 300, 0, 3497, 2568, 0, 0, 0, 0, '', 0);

# DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 30 AND `SourceEntry` = 1749;
# REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
# (30, 0, 1749, 0, 0, 47, 0, 4182, 64, 0, 0, 0, 0, '', 'Lady Katrana Prestor - Visibility - Require quest Dragonkin Menace rewarded.'),
# (30, 0, 1749, 0, 0, 47, 0, 6403, 64, 0, 1, 0, 0, '', 'Lady Katrana Prestor - Visibility - Require quest The Great Masquerade NOT rewarded.');

UPDATE `item_template` SET `startquest` = 4264 WHERE `entry` = 11446; -- A crumpled up note

-- Spawn Bolvar
DELETE FROM `creature` WHERE `guid` = 500801 AND `id` = 1748;
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(500801, 1748, 0, 0, 0, 1, 1, 1, -8445.01, 329.85, 122.163, 2.12562, 300, 0, 1055700, 67740, 0, 0, 0, 0, '', 0);

# DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 30 AND `SourceEntry` = 1748;
# REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
# (30, 0, 1748, 0, 0, 47, 0, 4182, 64, 0, 0, 0, 0, '', 'Highlord Bolvar Fordring - Visibility - Require quest Dragonkin Menace rewarded.');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 47622; -- Marshal Windsor

DELETE FROM `script_waypoint` WHERE `entry` = 9023;
REPLACE INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
(9023, 1, 316.336, -225.528, -77.7258, 2000, 'SAY_WINDSOR_START'),
(9023, 2, 322.96, -207.13, -77.87, 0, ''),
(9023, 3, 281.05, -172.16, -75.12, 0, ''),
(9023, 4, 272.19, -139.14, -70.61, 0, ''),
(9023, 5, 283.62, -116.09, -70.21, 0, ''),
(9023, 6, 296.18, -94.3, -74.08, 0, ''),
(9023, 7, 294.57, -93.11, -74.08, 0, 'escort paused - SAY_WINDSOR_CELL_DUGHAL_1'),
(9023, 8, 294.57, -93.11, -74.08, 5000, ''),
(9023, 9, 294.57, -93.11, -74.08, 3000, 'SAY_WINDSOR_CELL_DUGHAL_3'),
(9023, 10, 314.31, -74.31, -76.09, 0, ''),
(9023, 11, 360.22, -62.93, -66.77, 0, ''),
(9023, 12, 383.38, -69.4, -63.25, 0, ''),
(9023, 13, 389.99, -67.86, -62.57, 0, ''),
(9023, 14, 400.98, -72.01, -62.31, 0, 'SAY_WINDSOR_EQUIPMENT_1'),
(9023, 15, 404.22, -62.3, -63.5, 2000, ''),
(9023, 16, 404.22, -62.3, -63.5, 1500, 'open supply door'),
(9023, 17, 407.65, -51.86, -63.96, 0, ''),
(9023, 18, 403.61, -51.71, -63.92, 1000, 'SAY_WINDSOR_EQUIPMENT_2'),
(9023, 19, 403.61, -51.71, -63.92, 2000, ''),
(9023, 20, 403.61, -51.71, -63.92, 1000, 'open supply crate'),
(9023, 21, 403.61, -51.71, -63.92, 1000, 'update entry to Reginald Windsor'),
(9023, 22, 403.61, -52.71, -63.92, 4000, 'SAY_WINDSOR_EQUIPMENT_3'),
(9023, 23, 403.61, -52.71, -63.92, 4000, 'SAY_WINDSOR_EQUIPMENT_4'),
(9023, 24, 406.33, -54.87, -63.95, 0, ''),
(9023, 25, 403.86, -73.88, -62.02, 0, ''),
(9023, 26, 428.8, -81.34, -64.91, 0, ''),
(9023, 27, 557.03, -119.71, -61.83, 0, ''),
(9023, 28, 573.4, -124.39, -65.07, 0, ''),
(9023, 29, 593.91, -130.29, -69.25, 0, ''),
(9023, 30, 593.21, -132.16, -69.25, 0, 'escort paused - SAY_WINDSOR_CELL_JAZ_1'),
(9023, 31, 593.21, -132.16, -69.25, 1000, ''),
(9023, 32, 593.21, -132.16, -69.25, 3000, 'SAY_WINDSOR_CELL_JAZ_2'),
(9023, 33, 622.81, -135.55, -71.92, 0, ''),
(9023, 34, 634.68, -151.29, -70.32, 0, ''),
(9023, 35, 635.06, -153.25, -70.32, 0, 'escort paused - SAY_WINDSOR_CELL_SHILL_1'),
(9023, 36, 635.06, -153.25, -70.32, 3000, ''),
(9023, 37, 635.06, -153.25, -70.32, 5000, 'SAY_WINDSOR_CELL_SHILL_2'),
(9023, 38, 635.06, -153.25, -70.32, 2000, 'SAY_WINDSOR_CELL_SHILL_3'),
(9023, 39, 655.25, -172.39, -73.72, 0, ''),
(9023, 40, 654.79, -226.3, -83.06, 0, ''),
(9023, 41, 622.85, -268.85, -83.96, 0, ''),
(9023, 42, 579.45, -275.56, -80.44, 0, ''),
(9023, 43, 561.19, -266.85, -75.59, 0, ''),
(9023, 44, 547.91, -253.92, -70.34, 0, ''),
(9023, 45, 549.2, -252.4, -70.34, 0, 'escort paused - SAY_WINDSOR_CELL_CREST_1'),
(9023, 46, 549.2, -252.4, -70.34, 1000, ''),
(9023, 47, 549.2, -252.4, -70.34, 4000, 'SAY_WINDSOR_CELL_CREST_2'),
(9023, 48, 555.33, -269.16, -74.4, 0, ''),
(9023, 49, 554.31, -270.88, -74.4, 0, 'escort paused - SAY_WINDSOR_CELL_TOBIAS_1'),
(9023, 50, 554.31, -270.88, -74.4, 5000, ''),
(9023, 51, 554.31, -270.88, -74.4, 4000, 'SAY_WINDSOR_CELL_TOBIAS_2'),
(9023, 52, 536.1, -249.6, -67.47, 0, ''),
(9023, 53, 520.94, -216.65, -59.28, 0, ''),
(9023, 54, 505.99, -148.74, -62.17, 0, ''),
(9023, 55, 484.21, -56.24, -62.43, 0, ''),
(9023, 56, 470.39, -6.01, -70.1, 0, ''),
(9023, 57, 452.45, 29.85, -70.37, 1500, 'SAY_WINDSOR_FREE_1'),
(9023, 58, 452.45, 29.85, -70.37, 15000, 'SAY_WINDSOR_FREE_2');

DELETE FROM `creature_text` WHERE `CreatureID` = 9023;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(9023, 0, 0, '你关错元帅了，$n。准备受死吧！', 12, 0, 100, 0, 0, 0, 5253, 0, 'Marshal Windsor - SAY_AGGRO'),
(9023, 0, 1, '我敢打赌你现在感到遗憾了，不是吗$n！？！', 12, 0, 100, 0, 0, 0, 5252, 0, 'Marshal Windsor - SAY_AGGRO'),
(9023, 0, 2, '你最好抓牢我，否则$n就有苦头吃了！', 12, 0, 100, 0, 0, 0, 5250, 0, 'Marshal Windsor - SAY_AGGRO'),
(9023, 0, 3, '狠狠地打$n！', 12, 0, 100, 0, 0, 0, 5249, 0, 'Marshal Windsor - SAY_AGGRO'),
(9023, 1, 0, '我们行动吧。我的装备应该在这条路上的某个储物间里。', 12, 0, 100, 0, 0, 0, 5205, 0, 'Marshal Windsor - SAY_START_ESCORT'),
(9023, 2, 0, '检查那间牢房，$n。如果那里还有人活着，我们就得把他们救出来。', 12, 0, 100, 0, 0, 0, 5207, 0, 'Marshal Windsor - SAY_DUGHAL_CELL_1'),
(9023, 3, 0, '干得好！我们差不多成功了！这边走。', 12, 0, 100, 0, 0, 0, 5213, 0, 'Marshal Windsor - SAY_DUGHAL_CELL_2'),
(9023, 4, 0, '没错，$n，我的东西都在那个房间里。保护我，我准备冲进去了！', 12, 0, 100, 0, 0, 0, 5214, 0, 'Marshal Windsor - SAY_EQUIPMENT_1'),
(9023, 5, 0, '啊，它在那儿！', 12, 0, 100, 0, 0, 0, 5215, 0, 'Marshal Windsor - SAY_EQUIPMENT_2');

-- Windsor, armored up.
DELETE FROM `creature_text` WHERE `CreatureID` = 9682;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(9682, 0, 0, '你关错元帅了，$n。准备受死吧！', 12, 0, 100, 0, 0, 0, 5253, 0, 'Marshal Windsor - SAY_AGGRO'),
(9682, 0, 1, '我敢打赌你现在感到遗憾了，不是吗$n！？！', 12, 0, 100, 0, 0, 0, 5252, 0, 'Marshal Windsor - SAY_AGGRO'),
(9682, 0, 2, '你最好抓牢我，否则$n就有苦头吃了！', 12, 0, 100, 0, 0, 0, 5250, 0, 'Marshal Windsor - SAY_AGGRO'),
(9682, 0, 3, '狠狠地打$n！', 12, 0, 100, 0, 0, 0, 5249, 0, 'Marshal Windsor - SAY_AGGRO'),
(9682, 6, 0, '你能感受到这力量吗，$n？让我们舞动起来吧！', 12, 0, 100, 0, 0, 0, 5216, 0, 'Reginald Windsor - SAY_EQUIPMENT_3'),
(9682, 7, 0, '我们只需解放图比亚斯，然后就能离开这儿了。这边走！', 12, 0, 100, 0, 0, 0, 5217, 0, 'Reginald Windsor - SAY_EQUIPMENT_4'),
(9682, 8, 0, '打开它。', 12, 0, 100, 0, 0, 0, 5222, 0, 'Reginald Windsor - SAY_JAZ_CELL_1'),
(9682, 9, 0, '我从未喜欢过那两个家伙。我们继续前进吧。', 12, 0, 100, 0, 0, 0, 5223, 0, 'Reginald Windsor - SAY_JAZ_CELL2'),
(9682, 10, 0, '打开它，这次小心点！', 12, 0, 100, 0, 0, 0, 5224, 0, 'Reginald Windsor - SAY_SHILL_CELL_1'),
(9682, 11, 0, '那个愚蠢的家伙真是罪有应得！', 12, 0, 100, 0, 0, 0, 5225, 0, 'Reginald Windsor - SAY_SHILL_CELL_2'),
(9682, 12, 0, '好吧，我们走。', 12, 0, 100, 0, 0, 0, 5227, 0, 'Reginald Windsor - SAY_SHILL_CELL_3'),
(9682, 13, 0, '打开它。我们要抓紧时间。我已经可以闻到黑铁军团的气味了，我可以告诉你，他们就要来了！', 12, 0, 100, 0, 0, 0, 5228, 0, 'Reginald Windsor - SAY_CREST_CELL_1'),
(9682, 14, 0, '他应该在最后一间牢房里。除非……除非他们已经把他给杀了。', 12, 0, 100, 0, 0, 0, 5229, 0, 'Reginald Windsor - SAY_CREST_CELL_2'),
(9682, 15, 0, '把他从那里弄出去！', 12, 0, 100, 0, 0, 0, 5230, 0, 'Reginald Windsor - SAY_TOBIAS_CELL_1'),
(9682, 16, 0, '干得很好，$n。让我们去找出口吧。我想我知道该怎么走，跟着我！', 12, 0, 100, 0, 0, 0, 5221, 0, 'Reginald Windsor - SAY_TOBIAS_CELL_2'),
(9682, 17, 0, '我们成功了！', 12, 0, 100, 0, 0, 0, 5231, 0, 'Reginald Windsor - SAY_FREE_1'),
(9682, 18, 0, '到麦克斯韦尔的营地碰面吧。我们将在那儿开始下一阶段的计划，在没有译码戒指的情况下找出破解石板上的文字的方法。', 12, 0, 100, 0, 0, 0, 5232, 0, 'Reginald Windsor - SAY_FREE_2');

DELETE FROM `creature_text` WHERE `CreatureID` = 9022;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(9022, 0, 0, '谢谢你，$n！我自由了！！！', 12, 0, 100, 0, 0, 0, 5210, 0,'Dughal Stormwing - On Gossip Select');

DELETE FROM `creature_text` WHERE `CreatureID` = 9679;
REPLACE INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(9679, 0, 0, '我终于可以离开这个垃圾场了！！', 12, 0, 100, 0, 0, 0, 5218, 0,'Tobias Seecher - SAY_FREED');

-- The Great Masquerade
DELETE FROM `creature_questender` WHERE `id` = 1748 AND `quest` = 6403;
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(1748, 6403);

-- Disable mmaps for Reginald in stormwind
UPDATE `creature_template` SET `flags_extra` = `flags_extra` |536870912 WHERE `entry` = 12580;

DELETE FROM `creature_queststarter` WHERE `quest` = 6501;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(1748, 6501);

DELETE FROM `creature_queststarter` WHERE `quest` = 6501;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(1748, 6501);

DELETE FROM `creature_queststarter` WHERE `quest` = 6502;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES
(10929, 6502);

DELETE FROM `creature_questender` WHERE `quest` = 6501;
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(10929, 6501);

DELETE FROM `creature_questender` WHERE `quest` = 6502;
REPLACE INTO `creature_questender` (`id`, `quest`) VALUES
(10929, 6502);

UPDATE creature_text SET TextRange = 2 WHERE CreatureID = 1748 AND GroupID = 2;
UPDATE creature_text SET TextRange = 2 WHERE CreatureID = 1749 AND GroupID = 0;
UPDATE creature_text SET TextRange = 2 WHERE CreatureID = 12580 AND GroupID = 3;
UPDATE creature_text SET TextRange = 2 WHERE CreatureID = 466 AND GroupID = 7;

UPDATE `creature_template` SET `npcflag` = `npcflag` |1|2 WHERE `entry` = 1749;

UPDATE `quest_template` SET `flags` = `flags`|2|8 WHERE `id` = 6403; -- The Great Masquerade, shareable & escort flag

-- Adjust quest Mother's Milk gossip option to work with changed Ragged John gossip menu
DELETE FROM `gossip_menu_option` WHERE `MenuID`=59563 AND `OptionID`=1;
REPLACE INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES (59563, 1, 0, '挤“奶”吧，约翰。', 5833, 1, 1, 2062, 0, 0, 0, '', 0, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=59563 AND `SourceEntry`=1;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 59563, 1, 0, 1, 1, 0, 16468, 0, 0, 0, 0, 0, '', 'Show Gossip 59563 option 1 only if player has aura 16468'),
(15, 59563, 1, 0, 1, 9, 0, 4866, 0, 0, 0, 0, 0, '', 'Show gossip 59563 option 1 if player does have quest 4866 taken');

