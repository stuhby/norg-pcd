-- 910.norg-quality-definitions-unlimited.sql
--
-- op 907 mirrored the live quality definitions 1:1, including "Unlimited" maximum sizes as the
-- literal slider ceiling the Arr API reports: 1000 MB/min on Sonarr, 2000 on Radarr. The PCD
-- convention for unlimited is 0, which every upstream config uses (Series, Anime, Movie,
-- SQP UHD: 77 rows at 0, none at a ceiling). Profilarr pushes 0 as null ("Unlimited") and its
-- drift check reads the Arr's ceiling as null, so a stored 1000/2000 compared as expected=1000
-- vs actual=null and showed as permanent drift on all 34 rows.
--
-- Same meaning, native representation. Only rows AT the ceiling change; the lower caps
-- (Sonarr Unknown 199.9, Radarr 95/100 on the SD/CAM tiers) are real limits and stay.

UPDATE sonarr_quality_definitions SET max_size = 0 WHERE name = 'Norg (live)' AND max_size = 1000;
UPDATE radarr_quality_definitions SET max_size = 0 WHERE name = 'Norg (live)' AND max_size = 2000;
