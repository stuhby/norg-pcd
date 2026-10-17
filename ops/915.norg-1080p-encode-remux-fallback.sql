-- 915.norg-1080p-encode-remux-fallback.sql
--
-- New profile `1080p Encode (Remux Fallback)` (operator 2026-10-17): a variant of `1080p Encode (Sonarr)` that takes a TOP-TIER
-- Bluray encode if one exists and otherwise the remux. Score bands, highest first:
--   TRaSH HD Bluray Tier 01 / 02                2600 / 2500  (operator: heavily prioritise them)
--   HD Bluray Tier 03 (Norg)                    1900  (TRaSH Radarr HD Tier 01 groups the Sonarr tier omits)
--   HD Bluray Tier 05 / 06 (Norg), new        1850 / 1825  (Dictionarry 1080p Quality Tier 1 / 2 groups no
--                                                Sonarr-side TRaSH or Norg tier covers)
--   stuxb (Norg), our own encodes              1800
--   HD Bluray Tier 07 (Norg), new              1775  (Dictionarry 1080p Quality Tier 3 groups, same rule)
--   tiered Remux: Tier 01-04, Tier 05 (Norg)   1550 / 1525 / 1500 / 1475 / 1450, BTN Remux 1425
--     (new: BiZKiT CiNEPHiLES SURFINBIRD TEPES iFT)
--   HD Bluray Tier 04 (Norg) (BHDStudio,       1225  (TRaSH Radarr HD Tier 03: balanced/streaming-size
--     hallowed, HONE, ...), Kitsune Bluray              encodes rank BELOW the remux)
--   BTN Bluray 1080p (Norg)                    1175  (BTN-tagged packs are not an encode tier)
-- WEB scores are left as they are: in this ladder the Bluray group (Bluray-1080p + Remux-1080p) is a
-- higher QUALITY than the Web 1080p group, and Sonarr compares quality before custom format score,
-- so WEB never competes with a Bluray encode or remux; its scores only rank WEB against WEB.
-- Tier lists are Sonarr-side: TRaSH HD Bluray Tier 01 = Chotab CtrlHD DON EbP NTb PTer, Tier 02 = SA89
-- SbR (its larger lists are Radarr-only conditions). A group in an encode tier and a remux tier never
-- stacks: the encode tiers require source bluray, the remux tiers source remux (bluray_raw).
-- What changes against `1080p Encode (Sonarr)`: there, every ranked Bluray encode (Tier 04 and BTN
-- Bluray included, 1850-1975) outranks every remux tier (975-1150), so a held remux is replaced by any
-- ranked encode. Here only the top-tier encodes do. Margins hold against the extra formats a release
-- can stack (1080p, DTS, Hybrid, Remaster, Repack, Internal, about 240 at most): remux max ~1790 <
-- lowest top encode 1825 (Tier 07 1775 + 1080p 50); lower encodes max ~1465 < remux min 1475
-- (BTN Remux 1425 + 1080p 50).
-- Everything else is copied from `1080p Encode (Sonarr)` at replay time, so the two stay identical apart from the
-- scores set below.

INSERT INTO regular_expressions (name, pattern, regex101_id, description) VALUES
 ('coffee','^(coffee)$',NULL,NULL),('REBORN','^(REBORN)$',NULL,NULL),('SoLaR','^(SoLaR)$',NULL,NULL),('TeamSyndicate','^(TeamSyndicate)$',NULL,NULL),('0BSiDiAN','^(0BSiDiAN)$',NULL,NULL),('BV','^(BV)$',NULL,NULL),('FoRM','^(FoRM)$',NULL,NULL),('HiP','^(HiP)$',NULL,NULL),('Skazhutin','^(Skazhutin)$',NULL,NULL),('WMING','^(WMING)$',NULL,NULL)
ON CONFLICT(name) DO NOTHING;

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('HD Bluray Tier 05 (Norg)','Dictionarry 1080p Quality Tier 1 groups that no TRaSH or Norg HD Bluray tier covers.',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Tier 05 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Tier 05 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','coffee','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 05 (Norg)','coffee','coffee');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','REBORN','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 05 (Norg)','REBORN','REBORN');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','SoLaR','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 05 (Norg)','SoLaR','SoLaR');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 05 (Norg)','TeamSyndicate','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 05 (Norg)','TeamSyndicate','TeamSyndicate');

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('HD Bluray Tier 06 (Norg)','Dictionarry 1080p Quality Tier 2 groups that no TRaSH or Norg HD Bluray tier covers.',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 06 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Tier 06 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 06 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Tier 06 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 06 (Norg)','0BSiDiAN','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 06 (Norg)','0BSiDiAN','0BSiDiAN');

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('HD Bluray Tier 07 (Norg)','Dictionarry 1080p Quality Tier 3 groups that no Sonarr-side TRaSH or Norg HD Bluray tier covers (HiDt and iFT are in TRaSH HD Bluray Tier 02 for Radarr only).',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Tier 07 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Tier 07 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','HiDt','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','HiDt','HiDt');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','iFT','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','iFT','iFT');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','BV','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','BV','BV');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','FoRM','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','FoRM','FoRM');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','HiP','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','HiP','HiP');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','Skazhutin','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','Skazhutin','Skazhutin');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Tier 07 (Norg)','WMING','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Tier 07 (Norg)','WMING','WMING');

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('Remux Tier 05 (Norg)','Remux groups that TRaSH tiers for Radarr only (or not at all) and no Sonarr-side remux tier covers: BiZKiT, CiNEPHiLES, SURFINBIRD, TEPES, iFT.',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','Remux Source','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('Remux Tier 05 (Norg)','Remux Source','bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','BiZKiT','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Remux Tier 05 (Norg)','BiZKiT','BiZKiT');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','CiNEPHiLES','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Remux Tier 05 (Norg)','CiNEPHiLES','CiNEPHiLES');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','SURFINBIRD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Remux Tier 05 (Norg)','SURFINBIRD','SURFINBIRD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','TEPES','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Remux Tier 05 (Norg)','TEPES','TEPES');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Remux Tier 05 (Norg)','iFT','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Remux Tier 05 (Norg)','iFT','iFT');

-- ------------------------------------------------------------ the profile: a copy of 1080p Encode (Sonarr)
INSERT INTO quality_profiles (name,description,upgrades_allowed,minimum_custom_format_score,upgrade_until_score,upgrade_score_increment)
 SELECT '1080p Encode (Remux Fallback)', 'Variant of 1080p Encode (Sonarr): a top-tier Bluray encode (TRaSH Tier 01/02 first, then Dictionarry Tier 1-3 groups TRaSH lacks) if one exists, otherwise a top-tier Remux; lower-ranked encodes and WEB rank below the Remux.', upgrades_allowed,minimum_custom_format_score,upgrade_until_score,upgrade_score_increment FROM quality_profiles WHERE name='1080p Encode (Sonarr)';
INSERT INTO quality_groups (quality_profile_name,name) SELECT '1080p Encode (Remux Fallback)', name FROM quality_groups WHERE quality_profile_name='1080p Encode (Sonarr)';
INSERT INTO quality_group_members (quality_profile_name,quality_group_name,quality_name) SELECT '1080p Encode (Remux Fallback)', quality_group_name,quality_name FROM quality_group_members WHERE quality_profile_name='1080p Encode (Sonarr)';
INSERT INTO quality_profile_qualities (quality_profile_name,quality_name,quality_group_name,position,enabled,upgrade_until) SELECT '1080p Encode (Remux Fallback)', quality_name,quality_group_name,position,enabled,upgrade_until FROM quality_profile_qualities WHERE quality_profile_name='1080p Encode (Sonarr)';
INSERT INTO quality_profile_languages (quality_profile_name,language_name,type) SELECT '1080p Encode (Remux Fallback)', language_name,type FROM quality_profile_languages WHERE quality_profile_name='1080p Encode (Sonarr)';
INSERT INTO quality_profile_tags (quality_profile_name,tag_name) SELECT '1080p Encode (Remux Fallback)', tag_name FROM quality_profile_tags WHERE quality_profile_name='1080p Encode (Sonarr)';
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) SELECT '1080p Encode (Remux Fallback)', custom_format_name,arr_type,score FROM quality_profile_custom_formats WHERE quality_profile_name='1080p Encode (Sonarr)';

-- the new tiers
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES
 ('1080p Encode (Remux Fallback)','HD Bluray Tier 05 (Norg)','sonarr',1850),
 ('1080p Encode (Remux Fallback)','HD Bluray Tier 06 (Norg)','sonarr',1825),
 ('1080p Encode (Remux Fallback)','HD Bluray Tier 07 (Norg)','sonarr',1775),
 ('1080p Encode (Remux Fallback)','Remux Tier 05 (Norg)','sonarr',1450);

-- re-scored formats (see the bands above)
UPDATE quality_profile_custom_formats SET score=2600 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 01' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2500 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 02' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1550 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='Remux Tier 01' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1525 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='Remux Tier 02' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1500 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='Remux Tier 03 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1475 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='Remux Tier 04 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1425 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='BTN Remux 1080p (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1225 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 04 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1225 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='Kitsune Bluray (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1175 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='BTN Bluray 1080p (Norg)' AND arr_type='sonarr';
