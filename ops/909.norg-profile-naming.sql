-- 909.norg-profile-naming.sql
--
-- Profile naming convention (2026-09-24). Every profile that was not stock carried a
-- "[Norg] " prefix, which told the reader nothing because every profile a user actually picks
-- is ours. The convention is now:
--   bare name          = ours, e.g. "1080p WebDL"
--   [TRaSH] / [Dict]   = based on that database's profile (stock or customised)
--   trailing "(Word)"  = a child variant of a main profile, e.g. "1080p WebDL (AMZN)"
-- The "(Sonarr)" / "(Radarr)" suffix on 4K Remux, 1080p Remux, 1080p Encode and 4K Encode is
-- NOT a child marker. It stays because quality_profiles.name is UNIQUE and a profile has ONE
-- quality ladder shared by every arr it is pushed to, and each of those four pairs has a
-- genuinely different ladder (and 4K Remux a different minimum score) in Sonarr vs Radarr.
--
-- Custom format names are unchanged: bare = stock TRaSH, "(Norg)" = ours.
--
-- (!) Profilarr matches arr profiles by EXACT NAME and CREATES an unknown name as a new
--     profile. The live Sonarr/Radarr profiles were renamed in place (same ids) BEFORE this op
--     was published, so the next sync updates them rather than creating empty duplicates.
--
-- Every child table references quality_profiles(name) with ON UPDATE CASCADE, so one UPDATE
-- per profile carries its scores, ladder, groups, group members and languages. Replay with
-- PRAGMA foreign_keys=ON (see NORG.md).

UPDATE quality_profiles SET name = '1080p Encode (Radarr)' WHERE name = '[Norg] 1080p Encode (Radarr)';
UPDATE quality_profiles SET name = '1080p Encode (Sonarr)' WHERE name = '[Norg] 1080p Encode (Sonarr)';
UPDATE quality_profiles SET name = '[TRaSH] 1080p Encode' WHERE name = '[Norg] 1080p Encode (TRaSH)';
UPDATE quality_profiles SET name = '1080p Remux (Radarr)' WHERE name = '[Norg] 1080p Remux (Radarr)';
UPDATE quality_profiles SET name = '1080p Remux (Sonarr)' WHERE name = '[Norg] 1080p Remux (Sonarr)';
UPDATE quality_profiles SET name = '1080p WebDL' WHERE name = '[Norg] 1080p WebDL';
UPDATE quality_profiles SET name = '1080p WebDL (AMZN)' WHERE name = '[Norg] 1080p WebDL (AMZN)';
UPDATE quality_profiles SET name = '1080p WebDL (CtrlHD)' WHERE name = '[Norg] 1080p WebDL (CtrlHD)';
UPDATE quality_profiles SET name = '1080p WebDL (DSNP)' WHERE name = '[Norg] 1080p WebDL (DSNP)';
UPDATE quality_profiles SET name = '1080p WebDL (HEVC)' WHERE name = '[Norg] 1080p WebDL (HEVC)';
UPDATE quality_profiles SET name = '1080p x265' WHERE name = '[Norg] 1080p x265';
UPDATE quality_profiles SET name = '480p x265' WHERE name = '[Norg] 480p x265';
UPDATE quality_profiles SET name = '480p x265 (AndreMor)' WHERE name = '[Norg] 480p x265 (AndreMor)';
UPDATE quality_profiles SET name = '480p x265 (BiOMA)' WHERE name = '[Norg] 480p x265 (BiOMA)';
UPDATE quality_profiles SET name = '480p x265 (CtrlSD)' WHERE name = '[Norg] 480p x265 (CtrlSD)';
UPDATE quality_profiles SET name = '4K Encode (HONE)' WHERE name = '[Norg] 4K Encode (HONE)';
UPDATE quality_profiles SET name = '4K Encode (Radarr)' WHERE name = '[Norg] 4K Encode (Radarr)';
UPDATE quality_profiles SET name = '4K Encode (Sonarr)' WHERE name = '[Norg] 4K Encode (Sonarr)';
UPDATE quality_profiles SET name = '4K Encode (TrueHD)' WHERE name = '[Norg] 4K Encode (TrueHD)';
UPDATE quality_profiles SET name = '4K Remux (Radarr)' WHERE name = '[Norg] 4K Remux (Radarr)';
UPDATE quality_profiles SET name = '4K Remux (Sonarr)' WHERE name = '[Norg] 4K Remux (Sonarr)';
UPDATE quality_profiles SET name = '[TRaSH] 4K SQP-2' WHERE name = '[Norg] 4K SQP-2 (TRaSH)';
UPDATE quality_profiles SET name = '4K WebDL' WHERE name = '[Norg] 4K WebDL';
UPDATE quality_profiles SET name = '4K WebDL (ATVP)' WHERE name = '[Norg] 4K WebDL (ATVP)';
UPDATE quality_profiles SET name = 'Anime' WHERE name = '[Norg] Anime';
UPDATE quality_profiles SET name = 'Anime (CR)' WHERE name = '[Norg] Anime (CR)';
UPDATE quality_profiles SET name = '[TRaSH] Anime' WHERE name = '[Norg] Anime (TRaSH)';

-- The one description that names a renamed profile.
UPDATE custom_formats
   SET description = replace(description, 'Radarr 1080p Encode (TRaSH)', 'Radarr [TRaSH] 1080p Encode')
 WHERE name = 'BHDStudio (Norg)';
