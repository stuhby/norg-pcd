-- 918.norg-1080p-encode-webdl-fallback.sql
--
-- New profile `1080p Encode (WebDL Fallback)` (operator 2026-10-17): `1080p WebDL` as it is, plus the top-tier Bluray encode
-- ranking of `1080p Encode (Remux Fallback)`, so a top-tier encode can replace a WEB release while
-- everything else ranks exactly as in `1080p WebDL`.
--   * Ladder: in `1080p WebDL` the Web 1080p group is a higher QUALITY than Bluray-1080p, and Sonarr compares
--     quality before score, so no encode could ever replace a WEB file. Here Bluray-1080p joins the
--     group (renamed "WEB + Bluray 1080p"), so the score decides. Remux stays off.
--   * Encode tiers keep the Remux Fallback ORDER, 400 higher so even the lowest top tier beats any WEB
--     release (WEB Tier 01 1700 + streaming 75 + FLUX 51 + 1080p 50 + Hybrid 100 + Remaster/Repack/
--     Internal ~42 = ~2020 at most; the lowest top encode is Tier 07 2200 + 1080p 50 = 2250):
--       TRaSH HD Bluray Tier 01 / 02 3000 / 2850, Norg Tier 03 2700, Tier 04 2550, Tier 05 2400,
--       Tier 06 2300, stuxb 2250, Tier 07 2200; Dict Rank 1-4 tie-break +40/+30/+20/+10; DTS 0.
--   * Encodes that are not top tier do not replace WEB: BTN Bluray 1080p (1775 in `1080p WebDL`) and
--     HD Bluray Balanced (BHDStudio, hallowed, HONE) are 0, so they compete like untiered releases.
-- Everything else is copied from `1080p WebDL` at replay time.

INSERT INTO quality_profiles (name,description,upgrades_allowed,minimum_custom_format_score,upgrade_until_score,upgrade_score_increment)
 SELECT '1080p Encode (WebDL Fallback)', 'Variant of 1080p WebDL: the same WEB ranking, plus the top-tier Bluray encode ranking of 1080p Encode (Remux Fallback); a top-tier encode replaces WEB, nothing else does.', upgrades_allowed,minimum_custom_format_score,upgrade_until_score,upgrade_score_increment FROM quality_profiles WHERE name='1080p WebDL';
INSERT INTO quality_groups (quality_profile_name,name) SELECT '1080p Encode (WebDL Fallback)', name FROM quality_groups WHERE quality_profile_name='1080p WebDL';
INSERT INTO quality_group_members (quality_profile_name,quality_group_name,quality_name,position) SELECT '1080p Encode (WebDL Fallback)', quality_group_name, quality_name, position FROM quality_group_members WHERE quality_profile_name='1080p WebDL';
INSERT INTO quality_profile_qualities (quality_profile_name,quality_name,quality_group_name,position,enabled,upgrade_until) SELECT '1080p Encode (WebDL Fallback)', quality_name,quality_group_name,position,enabled,upgrade_until FROM quality_profile_qualities WHERE quality_profile_name='1080p WebDL';
INSERT INTO quality_profile_languages (quality_profile_name,language_name,type) SELECT '1080p Encode (WebDL Fallback)', language_name,type FROM quality_profile_languages WHERE quality_profile_name='1080p WebDL';
INSERT INTO quality_profile_tags (quality_profile_name,tag_name) SELECT '1080p Encode (WebDL Fallback)', tag_name FROM quality_profile_tags WHERE quality_profile_name='1080p WebDL';
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) SELECT '1080p Encode (WebDL Fallback)', custom_format_name,arr_type,score FROM quality_profile_custom_formats WHERE quality_profile_name='1080p WebDL';

-- ladder: Bluray-1080p joins the WEB group (the rename cascades to the group's members and ladder row)
UPDATE quality_groups SET name='WEB + Bluray 1080p' WHERE quality_profile_name='1080p Encode (WebDL Fallback)' AND name='Web 1080p';
DELETE FROM quality_profile_qualities WHERE quality_profile_name='1080p Encode (WebDL Fallback)' AND quality_name='Bluray-1080p';
INSERT INTO quality_group_members (quality_profile_name,quality_group_name,quality_name,position) VALUES ('1080p Encode (WebDL Fallback)','WEB + Bluray 1080p','Bluray-1080p',3);
UPDATE quality_profile_qualities SET position=2 WHERE quality_profile_name='1080p Encode (WebDL Fallback)' AND quality_name='HDTV-1080p';

-- encode ranking (Remux Fallback order, +400)
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES
 ('1080p Encode (WebDL Fallback)','HD Bluray Tier 03 (Norg)','sonarr',2700),('1080p Encode (WebDL Fallback)','HD Bluray Tier 04 (Norg)','sonarr',2550),
 ('1080p Encode (WebDL Fallback)','HD Bluray Tier 05 (Norg)','sonarr',2400),('1080p Encode (WebDL Fallback)','HD Bluray Tier 06 (Norg)','sonarr',2300),
 ('1080p Encode (WebDL Fallback)','HD Bluray Tier 07 (Norg)','sonarr',2200),('1080p Encode (WebDL Fallback)','Dict Rank 1 (Norg)','sonarr',40),('1080p Encode (WebDL Fallback)','Dict Rank 2 (Norg)','sonarr',30),
 ('1080p Encode (WebDL Fallback)','Dict Rank 3 (Norg)','sonarr',20),('1080p Encode (WebDL Fallback)','Dict Rank 4 (Norg)','sonarr',10)
ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','HD Bluray Tier 01','sonarr',3000) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','HD Bluray Tier 02','sonarr',2850) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','stuxb (Norg)','sonarr',2250) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','DTS','sonarr',0) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','BTN Bluray 1080p (Norg)','sonarr',0) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (WebDL Fallback)','HD Bluray Balanced (Norg)','sonarr',0) ON CONFLICT(quality_profile_name,custom_format_name,arr_type) DO UPDATE SET score=excluded.score;
