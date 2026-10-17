-- 916.norg-split-balanced-encodes.sql
--
-- Operator 2026-10-17: transparency-focused encodes rank above size-focused ones. HD Bluray Tier 04
-- (Norg) mirrored TRaSH's Radarr HD Tier 03 as one bucket, which mixed the two kinds:
--   transparency: HiFi, LoRD, playHD, SPHD, W4NK3R   (Dictionarry ranks HiFi and LoRD 1080p Quality Tier 2)
--   size:         BHDStudio, hallowed, HONE            (Dictionarry files them under "Balanced")
-- The size-focused three move to a new format, HD Bluray Balanced (Norg). Only two profiles scored
-- Tier 04:
--   1080p Encode (Sonarr):          Tier 04 stays 1850, Balanced 1825 (just under it; nothing else moves)
--   1080p Encode (Remux Fallback):  Tier 04 1875 (top tier: above every remux, below Tier 03 1900 and above
--                                   the Dictionarry Tiers 05-07), Balanced 1225 (below every remux, where
--                                   Tier 04 used to sit)
-- BHDStudio (Norg)'s -250 offset is unchanged and still stacks on BHDStudio.

INSERT INTO custom_formats (name, description, include_in_rename) VALUES
 ('HD Bluray Balanced (Norg)','Size-focused 1080p Bluray encoders (streaming-size targets): BHDStudio, hallowed, HONE. Split out of HD Bluray Tier 04 (Norg) so transparency-focused encodes can rank above them.',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Balanced (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('HD Bluray Balanced (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Balanced (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('HD Bluray Balanced (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Balanced (Norg)','BHDStudio','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Balanced (Norg)','BHDStudio','BHDStudio');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Balanced (Norg)','hallowed','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Balanced (Norg)','hallowed','hallowed');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('HD Bluray Balanced (Norg)','HONE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('HD Bluray Balanced (Norg)','HONE','HONE');

-- Tier 04 keeps only the transparency-focused groups (condition_patterns rows cascade)
DELETE FROM custom_format_conditions WHERE custom_format_name='HD Bluray Tier 04 (Norg)' AND name IN ('BHDStudio','hallowed','HONE');
UPDATE custom_formats SET description='Transparency-focused groups from TRaSH Radarr HD Bluray Tier 03, which Sonarr has no equivalent for: HiFi, LoRD, playHD, SPHD, W4NK3R. The size-focused BHDStudio, hallowed and HONE are in HD Bluray Balanced (Norg) since 916.'
 WHERE name='HD Bluray Tier 04 (Norg)';

INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES
 ('1080p Encode (Sonarr)','HD Bluray Balanced (Norg)','sonarr',1825),
 ('1080p Encode (Remux Fallback)','HD Bluray Balanced (Norg)','sonarr',1225);
UPDATE quality_profile_custom_formats SET score=1875
 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 04 (Norg)' AND arr_type='sonarr';
