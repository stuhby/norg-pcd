-- 905.norg-drop-hone-nudge-1080p-encode.sql
--
-- Removes the HONE (Norg) nudge of 8 from [Norg] 1080p Encode (Sonarr) ONLY.
--
-- HONE (Norg) is the imported local Sonarr format matching ^(HONE|DiscoD|Weasley)$ with
-- NO source or resolution guard, so it stacked on top of HD Bluray Tier 04 (Norg) and left
-- HONE 8 points clear of its own tier peers. With it gone HONE sits level with them:
--
--     Tier 01 groups         2050
--     Tier 02 groups         2000
--     Tier 03 (Norg) groups  1950
--     Tier 04 (Norg) groups  1900   <- HONE now here, level with hallowed, SPHD, LoRD,
--                                      HiFi, W4NK3R, playHD, BHDStudio
--
-- (!) The format is UNGUARDED, so this also drops the same 8 from DiscoD and Weasley in
-- this profile (58 -> 50 on a 1080p Bluray). Neither is in any Bluray tier, so the nudge
-- was the only thing scoring them here.
--
-- (!) HONE (Norg) is deliberately LEFT ALONE in the other eleven profiles that score it:
-- 8 in 1080p x265, 4K Encode, 4K Encode (TrueHD), Anime, Anime (CR); 12 in the four
-- 480p x265 profiles; 51 in 4K Remux and 1080p Remux; and 12/51 on the Radarr side.
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '[Norg] 1080p Encode (Sonarr)'
  AND custom_format_name   = 'HONE (Norg)'
  AND arr_type             = 'sonarr';
