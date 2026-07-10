-- By leewheel 2026-07-07
-- 补充NPC 50000（迪西德拉·风暴荣耀）的creature_template差异
-- 1. scale 从1修正为1.15（与参考项目一致）
-- 2. 补充机制免疫掩码（参考项目mechanic_immune_mask=667631227）
-- End By leewheel

-- 创建NPC 50000的机制免疫记录
-- 667631227 = 0x27CB8F9B
-- 免疫机制: CHARM|DISORIENTED|DISTRACT|FEAR|SLOW_ATTACK|SILENCE|SLEEP|SNARE|STUN|FREEZE|KNOCKOUT|BANDAGE|POLYMORPH|BANISH|SHACKLE|TURN|INTERRUPT|DAZE|SAPPED
DELETE FROM `creature_immunities` WHERE `ID` = 1972;
INSERT INTO `creature_immunities` (`ID`, `SchoolMask`, `DispelTypeMask`, `MechanicsMask`, `Effects`, `Auras`, `ImmuneAoE`, `ImmuneChain`, `Comment`)
VALUES (1972, 0, 0, 667631227, '', '', 0, 0, 'NPC 50000 个人进度NPC机制免疫 mech=0x27CB8F9B(CHARM|DISORIENTED|DISTRACT|FEAR|SLOW_ATTACK|SILENCE|SLEEP|SNARE|STUN|FREEZE|KNOCKOUT|BANDAGE|POLYMORPH|BANISH|SHACKLE|TURN|INTERRUPT|DAZE|SAPPED)');

-- 更新creature_template: scale=1.15, CreatureImmunitiesId=1972
UPDATE `creature_template` SET `scale` = 1.15, `CreatureImmunitiesId` = 1972 WHERE `entry` = 50000;
