-- 904.norg-hone-not-leading.sql
--
-- Stops HONE leading the Bluray ladder in [Norg] 1080p Encode (Sonarr).
--
-- op 903 put HONE into HD Bluray Tier 04 (Norg) at 1850, but HONE was ALREADY scored
-- separately by HONE Bluray (Norg) at 1200 in that same profile, so the two stacked and
-- HONE reached 3108 against 1950 for the Tier 03 groups: top of the profile by a wide
-- margin, which is the opposite of the intent.
--
-- Measured through Sonarr's own /api/v3/parse on a 1080p BluRay x264 title, BEFORE this
-- change: CRiSC/BBQ/playHD 1950, HONE 1258, hallowed/SPHD/BHDStudio 50 (baseline only).
-- HONE did NOT lead before op 903; the stacking is what put it on top.
--
-- Dropping the HONE Bluray row here leaves HONE scored by the tier alone, plus the small
-- HONE (Norg) nudge of 8:
--     Tier 01 groups            2050
--     Tier 02 groups            2000
--     Tier 03 (Norg) groups     1950
--     HONE                      1908
--     Tier 04 (Norg) peers      1900
-- HONE sits inside its own tier, just above its peers and below every higher tier.
--
-- (!) HONE Bluray (Norg) is ALSO scored 1500 in [Norg] Anime and [Norg] Anime (CR).
-- Those profiles do not score any HD Bluray tier, so nothing stacks there and they are
-- deliberately left untouched.
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = '[Norg] 1080p Encode (Sonarr)'
  AND custom_format_name   = 'HONE Bluray (Norg)'
  AND arr_type             = 'sonarr';
