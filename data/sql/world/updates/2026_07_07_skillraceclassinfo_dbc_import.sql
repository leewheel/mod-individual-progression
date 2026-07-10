-- By leewheel 2026-07-07
-- 从 chs_dbc.db_skillraceclassinfo_12340 导入完整的 SkillRaceClassInfo DBC 数据到 acore_world
-- 解决自定义种族(Race 21 恶魔猎手等)因DBC文件缺少 SkillRaceClassInfo 记录导致技能被误删的问题
-- 服务器的加载顺序：先从DBC文件加载，再从数据库表覆盖/追加
-- End By leewheel

-- 先清空目标表
TRUNCATE TABLE `skillraceclassinfo_dbc`;

-- 从chs_dbc导入完整数据
INSERT INTO `skillraceclassinfo_dbc` (`ID`, `SkillID`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierID`, `SkillCostIndex`)
SELECT `ID`, `SkillID`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierID`, `SkillCostIndex`
FROM chs_dbc.db_skillraceclassinfo_12340;
