-- ============================================================================
-- NORG: Sonarr Bluray tier gap-fill
-- ----------------------------------------------------------------------------
-- TRaSH curates Sonarr and Radarr differently. For Sonarr it ships only
-- HD Bluray Tier 01/02 and NO UHD Bluray tiers at all, while Radarr gets
-- HD 01-03 and UHD 01-03. These formats fill that gap for Sonarr ONLY.
--
-- (!) NOTHING UPSTREAM IS MODIFIED. Every format here is new and (Norg)-tagged.
--     Bare names remain stock TRaSH.
-- (!) Sonarr enum values differ from Radarr: WEBDL=3 WEBRIP=4 DVD=5 BLURAY=6
--     REMUX=7. Requiring source=BLURAY already excludes WEB and Remux, which is
--     why one positive condition replaces Radarr's triple negation.
-- ============================================================================

INSERT INTO regular_expressions (name, pattern, regex101_id, description) VALUES
 ('ATELiER','^(ATELiER)$',NULL,NULL),('BBQ','^(BBQ)$',NULL,NULL),('BMF','^(BMF)$',NULL,NULL),
 ('CRiSC','^(CRiSC)$',NULL,NULL),('D-Z0N3','^(D-Z0N3)$',NULL,NULL),('Dariush','^(Dariush)$',NULL,NULL),
 ('decibeL','^(decibeL)$',NULL,NULL),('EDPH','^(EDPH)$',NULL,NULL),('Geek','^(Geek)$',NULL,NULL),
 ('LolHD','^(LolHD)$',NULL,NULL),('NCmt','^(NCmt)$',NULL,NULL),('TayTO','^(TayTO)$',NULL,NULL),
 ('TDD','^(TDD)$',NULL,NULL),('TnP','^(TnP)$',NULL,NULL),('VietHD','^(VietHD)$',NULL,NULL),
 ('ZQ','^(ZQ)$',NULL,NULL),('ZoroSenpai','^(ZoroSenpai)$',NULL,NULL),('c0kE','^(c0kE)$',NULL,NULL),
 ('BHDStudio','^(BHDStudio)$',NULL,NULL),('HiFi','^(HiFi)$',NULL,NULL),('LoRD','^(LoRD)$',NULL,NULL),
 ('playHD','^(playHD)$',NULL,NULL),('SPHD','^(SPHD)$',NULL,NULL),('W4NK3R','^(W4NK3R)$',NULL,NULL),
 ('hallowed','^(hallowed)$',NULL,NULL),('HONE','^(HONE)$',NULL,NULL),('HQMUX','^(HQMUX)$',NULL,NULL),
 ('WEBDV','^(WEBDV)$',NULL,NULL),('MainFrame','^(MainFrame)$',NULL,NULL),('CtrlHD','^(CtrlHD)$',NULL,NULL),
 ('DON','^(DON)$',NULL,NULL),('PTer','^(PTer)$',NULL,NULL)
ON CONFLICT(name) DO NOTHING;

INSERT INTO custom_formats (name, description, include_in_rename) VALUES
 ('HD Bluray Tier 03 (Norg)','Radarr HD Bluray Tier 01 groups that TRaSH omits from the Sonarr tier, plus ATELiER. Ranked below the shipped Sonarr tiers.',0),
 ('HD Bluray Tier 04 (Norg)','Radarr HD Bluray Tier 03 groups, which Sonarr has no equivalent for.',0),
 ('UHD Bluray Tier 01 (Norg)','Sonarr has no UHD Bluray tiers. Mirrors Radarr UHD Bluray Tier 01.',0),
 ('UHD Bluray Tier 02 (Norg)','Mirrors Radarr UHD Bluray Tier 02.',0),
 ('UHD Bluray Tier 03 (Norg)','Mirrors Radarr UHD Bluray Tier 03.',0),
 ('BHDStudio (Norg)','Unguarded offset to rank BHDStudio below its tier peers. Mirrors the Radarr 1080p Encode (TRaSH) treatment.',0),
 ('hallowed Bluray (Norg)','Present but unscored. HONE/hallowed TV encodes can be very small, so ranking is deliberately left at 0 until measured.',0),
 ('HONE Bluray (Norg)','Present but unscored. See hallowed Bluray (Norg).',0);

-- ------------------------------------------------------------ conditions
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Tier 03 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Tier 03 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','ATELiER','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','ATELiER','ATELiER');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','BBQ','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','BBQ','BBQ');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','BMF','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','BMF','BMF');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','c0kE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','c0kE','c0kE');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','CRiSC','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','CRiSC','CRiSC');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','D-Z0N3','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','D-Z0N3','D-Z0N3');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','Dariush','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','Dariush','Dariush');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','decibeL','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','decibeL','decibeL');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','EDPH','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','EDPH','EDPH');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','Geek','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','Geek','Geek');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','LolHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','LolHD','LolHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','NCmt','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','NCmt','NCmt');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','TayTO','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','TayTO','TayTO');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','TDD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','TDD','TDD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','TnP','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','TnP','TnP');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','VietHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','VietHD','VietHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','ZQ','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','ZQ','ZQ');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 03 (Norg)','ZoroSenpai','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 03 (Norg)','ZoroSenpai','ZoroSenpai');

INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Tier 04 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Tier 04 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','BHDStudio','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','BHDStudio','BHDStudio');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','hallowed','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','hallowed','hallowed');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','HiFi','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','HiFi','HiFi');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','HONE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','HONE','HONE');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','LoRD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','LoRD','LoRD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','playHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','playHD','playHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','SPHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','SPHD','SPHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 04 (Norg)','W4NK3R','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 04 (Norg)','W4NK3R','W4NK3R');

INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','2160p','resolution','sonarr',0,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('UHD Bluray Tier 01 (Norg)','2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('UHD Bluray Tier 01 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','CtrlHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 01 (Norg)','CtrlHD','CtrlHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','MainFrame','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 01 (Norg)','MainFrame','MainFrame');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','W4NK3R','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 01 (Norg)','W4NK3R','W4NK3R');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 01 (Norg)','DON','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 01 (Norg)','DON','DON');

INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 02 (Norg)','2160p','resolution','sonarr',0,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('UHD Bluray Tier 02 (Norg)','2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 02 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('UHD Bluray Tier 02 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 02 (Norg)','HQMUX','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 02 (Norg)','HQMUX','HQMUX');

INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','2160p','resolution','sonarr',0,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('UHD Bluray Tier 03 (Norg)','2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('UHD Bluray Tier 03 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','hallowed','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','hallowed','hallowed');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','HONE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','HONE','HONE');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','PTer','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','PTer','PTer');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','SPHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','SPHD','SPHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','WEBDV','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','WEBDV','WEBDV');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('UHD Bluray Tier 03 (Norg)','BHDStudio','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('UHD Bluray Tier 03 (Norg)','BHDStudio','BHDStudio');

INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('BHDStudio (Norg)','BHDStudio','release_group','sonarr',0,1);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('BHDStudio (Norg)','BHDStudio','BHDStudio');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('hallowed Bluray (Norg)','hallowed','release_group','sonarr',0,1);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('hallowed Bluray (Norg)','hallowed','hallowed');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HONE Bluray (Norg)','HONE','release_group','sonarr',0,1);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HONE Bluray (Norg)','HONE','HONE');
