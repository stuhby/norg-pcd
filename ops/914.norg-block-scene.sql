-- 914.norg-block-scene.sql
--
-- TRaSH's optional `Scene` format at -10000 in ALL 27 Norg profiles (20 Sonarr, 7 Radarr),
-- 2026-09-25, operator decision following the TRaSH guide's optional "Scene: -10000" row.
-- `Scene` matches scene WEB naming (a bare `.WEB.`, not `WEB-DL`) plus a list of scene groups
-- (CAKES, EDITH, ETHEL, KOGI, SLOT, NAISU, ...).
--
-- Why: scene WEB releases arrive first and were replaced every time. Last 27 days, new episodes:
-- CAKES 25/25, ETHEL 6/6, EDITH 5/5, GRACE 5/5 first grabs replaced, median 47 min, mostly by
-- FLUX/Kitsune. Pure churn.
--
-- (!) THREE PROFILES PREVIOUSLY REWARDED SCENE and are flipped: `1080p Encode (Radarr)` +500,
-- `4K WebDL` +100, `4K WebDL (ATVP)` +100.
-- (!) KNOWN COST, accepted: shows whose ONLY release is scene stop auto-grabbing (seen: Documentary
-- Now! and Sins of the Amish and Trafficked via KOGI; Saturday Night Live and The Great British
-- Bake Off via EDITH). Those now need a manual grab or a per-show exception.
-- The [Dict] profiles come from the Dictionarry database and do not use this format.

INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES
  ('1080p Encode (Radarr)', 'Scene', 'radarr', -10000),
  ('1080p Remux (Radarr)', 'Scene', 'radarr', -10000),
  ('4K Encode (HONE)', 'Scene', 'radarr', -10000),
  ('4K Encode (Radarr)', 'Scene', 'radarr', -10000),
  ('4K Remux (Radarr)', 'Scene', 'radarr', -10000),
  ('[TRaSH] 1080p Encode', 'Scene', 'radarr', -10000),
  ('[TRaSH] 4K SQP-2', 'Scene', 'radarr', -10000),
  ('1080p Encode (Sonarr)', 'Scene', 'sonarr', -10000),
  ('1080p Remux (Sonarr)', 'Scene', 'sonarr', -10000),
  ('1080p WebDL', 'Scene', 'sonarr', -10000),
  ('1080p WebDL (AMZN)', 'Scene', 'sonarr', -10000),
  ('1080p WebDL (CtrlHD)', 'Scene', 'sonarr', -10000),
  ('1080p WebDL (DSNP)', 'Scene', 'sonarr', -10000),
  ('1080p WebDL (HEVC)', 'Scene', 'sonarr', -10000),
  ('1080p x265', 'Scene', 'sonarr', -10000),
  ('480p x265', 'Scene', 'sonarr', -10000),
  ('480p x265 (AndreMor)', 'Scene', 'sonarr', -10000),
  ('480p x265 (BiOMA)', 'Scene', 'sonarr', -10000),
  ('480p x265 (CtrlSD)', 'Scene', 'sonarr', -10000),
  ('4K Encode (Sonarr)', 'Scene', 'sonarr', -10000),
  ('4K Encode (TrueHD)', 'Scene', 'sonarr', -10000),
  ('4K Remux (Sonarr)', 'Scene', 'sonarr', -10000),
  ('4K WebDL', 'Scene', 'sonarr', -10000),
  ('4K WebDL (ATVP)', 'Scene', 'sonarr', -10000),
  ('Anime', 'Scene', 'sonarr', -10000),
  ('Anime (CR)', 'Scene', 'sonarr', -10000),
  ('[TRaSH] Anime', 'Scene', 'sonarr', -10000)
ON CONFLICT(quality_profile_name, custom_format_name, arr_type) DO UPDATE SET score = excluded.score;
