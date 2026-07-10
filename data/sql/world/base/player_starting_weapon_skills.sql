/* Corrects the starting weapon skills for each race and class to match pre-3.3 */

/* Two-handed swords */
SET @2HSWORDS := 55;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HSWORDS;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 55, 0, 'Death Knight - Two-Handed Swords');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1040, 1, 55, 0, 'Warrior - Two-Handed Swords');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (512, 2, 55, 0, 'Paladin - Two-Handed Swords');

/* One-handed swords */
SET @SWORDS := 43;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @SWORDS;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 43, 0, 'Death Knight - Swords');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1627, 1, 43, 0, 'Warrior - Swords');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1024, 4, 43, 0, 'Hunter - Swords');

/* Daggers */
SET @DAGGERS := 173;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @DAGGERS;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (200, 1, 173, 0, 'Warrior - Daggers');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (8, 1024, 173, 0, 'Druid - Daggers');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (520, 4, 173, 0, 'Hunter - Daggers');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 8, 173, 0, 'Rogue - Daggers');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 256, 173, 0, 'Warlock - Daggers');

/* Staves */
SET @STAVES := 136;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @STAVES;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 1216, 136, 0, 'Staves');

/* Thrown */
SET @THROWN := 176;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @THROWN;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 8, 176, 0, 'Rogue - Thrown');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (128, 1, 176, 0, 'Warrior - Thrown');


/* One-handed maces */
SET @MACES := 54;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @MACES;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (32, 1024, 54, 0, 'Druid - Maces');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 2, 54, 0, 'Paladin - Maces');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 16, 54, 0, 'Priest - Maces');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 64, 54, 0, 'Shaman - Maces');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1645, 1, 54, 0, 'Warrior - Maces');

/* Two-handed maces */
SET @2HMACES := 160;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HMACES;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 2, 160, 0, 'Paladin - Two-Handed Maces');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (32, 1, 160, 0, 'Warrior - Two-Handed Maces');

/* One-handed axes */
SET @AXES := 44;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @AXES;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 44, 0, 'Death Knight - Axes');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (166, 4, 44, 0, 'Hunter - Axes');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (1207, 1, 44, 0, 'Warrior - Axes');

/* Two-handed axes */
SET @2HAXES := 172;

DELETE FROM `playercreateinfo_skills` WHERE `skill` = @2HAXES;
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (0, 32, 172, 0, 'Death Knight - Two-Handed Axes');
REPLACE INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES (6, 1, 172, 0, 'Warrior - Two-Handed Axes');
