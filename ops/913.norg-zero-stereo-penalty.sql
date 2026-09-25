-- 913.norg-zero-stereo-penalty.sql
--
-- `2.0 Stereo` -10 -> 0 in the six Norg Sonarr profiles that scored it (2026-09-25).
--
-- It created an upgrade LOOP. Scene WEB release titles (EDITH, CAKES, ...) do not state audio, so
-- the release never matches `2.0 Stereo`. The Norg naming format writes audio into the filename
-- (`[AAC 2.0]`), and Sonarr scores an existing file from its filename, so the SAME release scored
-- 50 as a release and 40 once imported. Every identical copy on another indexer then looked like
-- a +10 upgrade: The Daily Show 2026-09-24 was downloaded 5 times in one morning, and one pass
-- pulled a non-freeleech TorrentLeech copy through autobrr's 60 min catch-all. 17 loop re-grabs
-- (~22 GB) in the 27 days before.
--
-- The penalty could only ever act after import (it is invisible in scene titles at grab time),
-- which is exactly the asymmetry that loops, so it is removed rather than rebalanced. Rows are
-- kept at 0 (not deleted) so the profile still lists the format. Stock TRaSH SQP profiles are
-- untouched.

UPDATE quality_profile_custom_formats
   SET score = 0
 WHERE custom_format_name = '2.0 Stereo'
   AND arr_type = 'sonarr'
   AND quality_profile_name IN ('1080p WebDL', '1080p WebDL (AMZN)', '1080p WebDL (DSNP)',
                                '1080p WebDL (HEVC)', '1080p WebDL (CtrlHD)', '1080p Encode (Sonarr)');
