-- 906.norg-radarr-profile-language.sql
--
-- Carries the per-profile LANGUAGE across, which the 1:1 import missed.
--
-- All seven live Radarr profiles are set to "Original", and upstream trash-pcd sets the
-- same on its own profiles, but op 902 emitted no quality_profile_languages rows at all.
-- Pushing a Radarr profile with no language would let it fall back to whatever Profilarr
-- defaults to, and a profile set to English or Any instead of Original changes which
-- releases are accepted. That is a real behaviour change, not cosmetic.
--
-- Sonarr is NOT affected: Sonarr v4 has no per-profile language (all 20 report none), so
-- no rows are added for the Sonarr-side profiles.
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) VALUES
  ('[Norg] 4K Remux (Radarr)',     'Original', 'simple'),
  ('[Norg] 1080p Remux (Radarr)',  'Original', 'simple'),
  ('[Norg] 1080p Encode (Radarr)', 'Original', 'simple'),
  ('[Norg] 4K Encode (Radarr)',    'Original', 'simple'),
  ('[Norg] 4K SQP-2 (TRaSH)',      'Original', 'simple'),
  ('[Norg] 1080p Encode (TRaSH)',  'Original', 'simple'),
  ('[Norg] 4K Encode (HONE)',      'Original', 'simple');
