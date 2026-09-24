-- 907.norg-live-media-management.sql
--
-- Profilarr REFUSES to sync quality profiles until a naming config, a quality-definitions
-- config, a media-settings config AND a delay profile are all selected for the instance.
-- Both Sync runs on 2026-09-24 finished as 'skipped' for exactly this reason.
--
-- (!) EVERY PRE-EXISTING OPTION WOULD HAVE CHANGED LIVE BEHAVIOUR. Measured against the
-- running Arrs: all 9 TRaSH/Norg Sonarr naming configs differ (including series_folder_format,
-- live '{Series TitleYear} {imdb-{ImdbId}}' vs '{Series CleanTitleWithoutYear} {(Series Year)}'),
-- and 100% of the quality definitions differ (20/20, 14/14, 21/21, 14/14, 9/9, 8/8), which govern
-- accepted file SIZES. The existing 'Default' delay profile is prefer_torrent with 0/0 delays and
-- no minimum score, against a live usenet-preferred 15/60 with a minimum CF score of 3341 (Sonarr)
-- and 3000 (Radarr) -- pushing it would have removed the grab gates outright.
--
-- So this op mirrors the LIVE settings 1:1 under the name 'Norg (live)'. Selecting these satisfies
-- Profilarr's requirement and pushes byte-identical values, i.e. it changes nothing.
-- Regenerate from the Arrs if their settings ever change; do NOT hand-edit.
--
-- The media-settings configs are included for symmetry only: the pre-existing 'Default' in this
-- database ALREADY matches live exactly (doNotPrefer / enable_media_info on) for both arrs.

INSERT INTO sonarr_naming (name, rename, standard_episode_format, daily_episode_format, anime_episode_format, series_folder_format, season_folder_format, replace_illegal_characters, colon_replacement_format, custom_colon_replacement_format, multi_episode_style) VALUES (
  'Norg (live)', 1, '{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle:90} {[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}', '{Series TitleYear} - {Air-Date} - {Episode CleanTitle:90} {[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}',
  '{Series TitleYear} - S{season:00}E{episode:00} - {absolute:000} - {Episode CleanTitle:90} {[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{MediaInfo AudioLanguages}{[MediaInfo VideoDynamicRangeType]}[{Mediainfo VideoCodec }{MediaInfo VideoBitDepth}bit]{-Release Group}', '{Series TitleYear} {imdb-{ImdbId}}', 'Season {season:00}',
  1, 0, '', 5);

INSERT INTO radarr_naming (name, rename, movie_format, movie_folder_format, replace_illegal_characters, colon_replacement_format) VALUES (
  'Norg (live)', 1, '{Movie CleanTitle} {(Release Year)} {imdb-{ImdbId}} - {edition-{Edition Tags}} {[MediaInfo 3D]}{[Custom Formats]}{[Quality Full]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo VideoCodec]}{-Release Group}', '{Movie CleanTitle} ({Release Year}) {imdb-{ImdbId}}', 1, 'dash');

INSERT INTO sonarr_media_settings (name, propers_repacks, enable_media_info) VALUES ('Norg (live)', 'doNotPrefer', 1);
INSERT INTO radarr_media_settings (name, propers_repacks, enable_media_info) VALUES ('Norg (live)', 'doNotPrefer', 1);

INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES
  ('Norg (live)', 'Unknown', 1, 199.9, 194.9),
  ('Norg (live)', 'SDTV', 5, 1000, 995),
  ('Norg (live)', 'WEBRip-480p', 5, 1000, 995),
  ('Norg (live)', 'WEBDL-480p', 5, 1000, 995),
  ('Norg (live)', 'DVD', 5, 1000, 995),
  ('Norg (live)', 'Bluray-480p', 5, 1000, 995),
  ('Norg (live)', 'Bluray-576p', 5, 1000, 995),
  ('Norg (live)', 'HDTV-720p', 5, 1000, 995),
  ('Norg (live)', 'HDTV-1080p', 5, 1000, 995),
  ('Norg (live)', 'Raw-HD', 2, 100, 95),
  ('Norg (live)', 'WEBRip-720p', 5, 1000, 995),
  ('Norg (live)', 'WEBDL-720p', 5, 1000, 995),
  ('Norg (live)', 'Bluray-720p', 5, 1000, 995),
  ('Norg (live)', 'WEBRip-1080p', 5, 1000, 995),
  ('Norg (live)', 'WEBDL-1080p', 5, 1000, 995),
  ('Norg (live)', 'Bluray-1080p', 5, 1000, 995),
  ('Norg (live)', 'Remux-1080p', 5, 1000, 995),
  ('Norg (live)', 'HDTV-2160p', 5, 1000, 995),
  ('Norg (live)', 'WEBRip-2160p', 5, 1000, 995),
  ('Norg (live)', 'WEBDL-2160p', 5, 1000, 995),
  ('Norg (live)', 'Bluray-2160p', 5, 1000, 995),
  ('Norg (live)', 'Remux-2160p', 5, 1000, 995);

INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) VALUES
  ('Norg (live)', 'Unknown', 0, 100, 95),
  ('Norg (live)', 'WORKPRINT', 0, 100, 95),
  ('Norg (live)', 'CAM', 0, 100, 95),
  ('Norg (live)', 'TELESYNC', 0, 100, 95),
  ('Norg (live)', 'TELECINE', 0, 100, 95),
  ('Norg (live)', 'REGIONAL', 0, 100, 95),
  ('Norg (live)', 'DVDSCR', 0, 100, 95),
  ('Norg (live)', 'SDTV', 0, 100, 95),
  ('Norg (live)', 'DVD', 0, 100, 95),
  ('Norg (live)', 'DVD-R', 0, 100, 95),
  ('Norg (live)', 'WEBDL-480p', 0, 100, 95),
  ('Norg (live)', 'WEBRip-480p', 0, 100, 95),
  ('Norg (live)', 'Bluray-480p', 0, 100, 95),
  ('Norg (live)', 'Bluray-576p', 0, 100, 95),
  ('Norg (live)', 'HDTV-720p', 17.1, 2000, 1999),
  ('Norg (live)', 'WEBDL-720p', 12.5, 2000, 1999),
  ('Norg (live)', 'WEBRip-720p', 12.5, 2000, 1999),
  ('Norg (live)', 'Bluray-720p', 25.7, 2000, 1999),
  ('Norg (live)', 'HDTV-1080p', 33.8, 2000, 1999),
  ('Norg (live)', 'WEBDL-1080p', 12.5, 2000, 1999),
  ('Norg (live)', 'WEBRip-1080p', 12.5, 2000, 1999),
  ('Norg (live)', 'Bluray-1080p', 50.8, 2000, 1999),
  ('Norg (live)', 'Remux-1080p', 136.8, 2000, 1999),
  ('Norg (live)', 'HDTV-2160p', 85, 2000, 1999),
  ('Norg (live)', 'WEBDL-2160p', 34.5, 2000, 1999),
  ('Norg (live)', 'WEBRip-2160p', 34.5, 2000, 1999),
  ('Norg (live)', 'Bluray-2160p', 102, 2000, 1999),
  ('Norg (live)', 'Remux-2160p', 187.4, 2000, 1999),
  ('Norg (live)', 'BR-DISK', 0, 95, 10),
  ('Norg (live)', 'Raw-HD', 0, 95, 10);

INSERT INTO delay_profiles (name, preferred_protocol, usenet_delay, torrent_delay, bypass_if_highest_quality, bypass_if_above_custom_format_score, minimum_custom_format_score) VALUES (
  'Norg Sonarr (live)', 'prefer_usenet', 15, 60, 0, 0, NULL);
INSERT INTO delay_profiles (name, preferred_protocol, usenet_delay, torrent_delay, bypass_if_highest_quality, bypass_if_above_custom_format_score, minimum_custom_format_score) VALUES (
  'Norg Radarr (live)', 'prefer_usenet', 15, 60, 0, 0, NULL);
