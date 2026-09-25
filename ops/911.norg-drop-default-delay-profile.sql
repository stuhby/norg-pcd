-- 911.norg-drop-default-delay-profile.sql
--
-- Removes upstream's stock "Default" delay profile (added by trash-pcd op 61: prefer_torrent,
-- 0/0 delays). Nothing here uses it: both arrs sync "Norg Sonarr (live)" / "Norg Radarr (live)",
-- which mirror the live usenet-preferred 15/60. Leaving it selectable only invites picking it,
-- which would switch both arrs to torrent-preferred with no delay (see 907).
--
-- This was first done in the Profilarr UI as a LOCAL op (not in git); it lives here so a fresh
-- Profilarr or a restore from this repo gets the same state. Nothing references delay_profiles
-- by foreign key, so the delete touches this one row only.

DELETE FROM delay_profiles WHERE name = 'Default';
