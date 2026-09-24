-- 908.norg-uhd-tier-dedupe-and-bhdstudio.sql
--
-- (!) FIXES A REGRESSION op 900 INTRODUCED. The hand-built Sonarr UHD tiers had NO overlap:
--     Tier 01 CtrlHD, DON, MainFrame, W4NK3R | Tier 02 HQMUX
--     Tier 03 hallowed, HONE, PTer           | Tier 04 SPHD, WEBDV
-- op 900 added BHDStudio, SPHD and WEBDV to Tier 03 "to match Radarr" without noticing SPHD and
-- WEBDV were already Tier 04. They then collected BOTH tiers: a 2160p BluRay from SPHD scored
-- 5300, beating CtrlHD (a genuine Tier 01 group) at 3700. Measured via Sonarr's own /api/v3/parse.
--
-- Radarr is the reference and it keeps every group in exactly ONE tier. Restoring that here.

-- 1. SPHD and WEBDV belong to Tier 04 only. Remove them from Tier 03.
DELETE FROM condition_patterns
 WHERE custom_format_name = 'UHD Bluray Tier 03 (Norg)' AND condition_name IN ('SPHD','WEBDV');
DELETE FROM custom_format_conditions
 WHERE custom_format_name = 'UHD Bluray Tier 03 (Norg)' AND name IN ('SPHD','WEBDV');

-- BHDStudio STAYS in Tier 03: it was in no UHD tier at all before, so it scored 0 at 2160p.
-- That was a genuine gap, and Radarr also places it in UHD Tier 03. Step 4 keeps it below peers.

-- 2. (!) Tier 04 was UNGUARDED, the same defect op 900 fixed on Tier 01/02. Unguarded, it paid
--    +1800 on ANY source and resolution: a 1080p WEB-DL from SPHD scored 1850 and a 720p HDTV
--    from WEBDV scored 1805 inside the 4K profiles. Guard it like every other UHD tier.
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES
  ('UHD Bluray Tier 04 (Norg)', '2160p',  'resolution', 'sonarr', 0, 1),
  ('UHD Bluray Tier 04 (Norg)', 'BLURAY', 'source',     'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES
  ('UHD Bluray Tier 04 (Norg)', '2160p', '2160p');
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES
  ('UHD Bluray Tier 04 (Norg)', 'BLURAY', 'bluray');

-- 3. HiDt lands in OUR lowest custom UHD tier rather than touching a TRaSH format. Radarr places
--    it in its UHD Tier 02, but the operator's instruction is not to alter TRaSH tiers to add a
--    group, so it goes here instead. Consequence to know: HiDt scores 1800 rather than a
--    second-rung equivalent. Move it up only if that proves too low in practice.
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES
  ('UHD Bluray Tier 04 (Norg)', 'HiDt', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES
  ('UHD Bluray Tier 04 (Norg)', 'HiDt', 'HiDt');

-- 4. BHDStudio penalty on the Sonarr side, mirroring Radarr (which uses -75/-100/-250).
--    Without it BHDStudio tied hallowed and HONE exactly, against the stated preference for it to
--    sit below them. BHDStudio (Norg) is an UNGUARDED offset, so it applies wherever the group
--    earns a tier score: HD Bluray Tier 04 in 1080p Encode, UHD Bluray Tier 03 in the two 4K ones.
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES
  ('[Norg] 1080p Encode (Sonarr)', 'BHDStudio (Norg)', 'sonarr', -250),
  ('[Norg] 4K Encode (Sonarr)',    'BHDStudio (Norg)', 'sonarr', -250),
  ('[Norg] 4K Encode (TrueHD)',    'BHDStudio (Norg)', 'sonarr', -250);
