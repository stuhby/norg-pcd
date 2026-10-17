-- @operation: export
-- @entity: batch
-- @name: Add NEW Custom Format IMF to General Streaming Services
-- @exportedAt: 2026-10-15T22:35:39.611Z
-- @opIds: 14966, 14994, 14995, 14996, 14997, 14998, 14999, 15000, 15001, 15002, 15003, 15004, 15005, 15006, 15007, 15008, 15009, 15010, 15011, 15012, 15013, 15014, 15015, 15016, 15017, 15018, 15019, 15020, 15021, 15022, 15023, 15024

-- --- BEGIN op 14966 ( create regular_expression "Interoperable Master Format" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Interoperable Master Format', '(\b(IMF)\b(?=.*\b(web[ ._-]?rip))\b)', NULL, NULL);
-- --- END op 14966

-- --- BEGIN op 14994 ( create custom_format "IMF" )
insert into "custom_formats" ("name", "description") values ('IMF', '');
-- --- END op 14994

-- --- BEGIN op 14995 ( update custom_format "IMF" )
update "custom_formats" set "description" = '**Amazon Prime Video**

From Wikipedia, the free encyclopedia

Amazon Prime Video, or simply Prime Video, is an American subscription video on-demand over-the-top streaming and rental service of Amazon offered as a standalone service or as part of Amazon''s Prime subscription. The service primarily distributes films and television series produced by Amazon MGM Studios or licensed to Amazon, as Amazon Originals, with the service also hosting content from other providers, content add-ons, live sporting events, and video rental and purchasing services.' where "name" = 'IMF' and "description" = '';
-- --- END op 14995

-- --- BEGIN op 14996 ( update custom_format "IMF" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'IMF' and "include_in_rename" = 0;
-- --- END op 14996

-- --- BEGIN op 14997 ( update custom_format "IMF" )
insert into "tags" ("name") values ('General Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('IMF', 'General Streaming Services');
-- --- END op 14997

-- --- BEGIN op 14998 ( update custom_format "IMF" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('IMF', 'Amazon', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('IMF', 'Amazon', 'Amazon');
-- --- END op 14998

-- --- BEGIN op 14999 ( update custom_format "IMF" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('IMF', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('IMF', 'WEBDL', 'web_dl');
-- --- END op 14999

-- --- BEGIN op 15000 ( update custom_format "IMF" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('IMF', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('IMF', 'WEBRIP', 'webrip');
-- --- END op 15000

-- --- BEGIN op 15001 ( update custom_format "IMF" )
update "custom_formats" set "description" = 'IMF (Interoperable Master Format)

IMF (Interoperable Master Format) isn''t a streaming service but a standardized file format for storing and delivering finished video content.

Releases that use IMF as a source are created from the highest available source, resulting in a higher-quality WEBRip than those sourced from standard streaming delivery files.

IMF is widely used by major studios and streaming platforms to manage and distribute large catalogs of content efficiently and consistently.

For more information, visit the IMF Explainer page and the Interoperable Master Format Wikipedia page.' where "name" = 'IMF' and "description" = '**Amazon Prime Video**

From Wikipedia, the free encyclopedia

Amazon Prime Video, or simply Prime Video, is an American subscription video on-demand over-the-top streaming and rental service of Amazon offered as a standalone service or as part of Amazon''s Prime subscription. The service primarily distributes films and television series produced by Amazon MGM Studios or licensed to Amazon, as Amazon Originals, with the service also hosting content from other providers, content add-ons, live sporting events, and video rental and purchasing services.';
-- --- END op 15001

-- --- BEGIN op 15002 ( update custom_format "IMF" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'IMF'
	  AND name = 'Amazon'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 15002

-- --- BEGIN op 15003 ( update custom_format "IMF" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('IMF', 'IMF', 'release_title', 'radarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('IMF', 'IMF', 'Interoperable Master Format');
-- --- END op 15003

-- --- BEGIN op 15004 ( update custom_format "IMF" )
UPDATE custom_format_conditions
SET arr_type = 'radarr'
WHERE custom_format_name = 'IMF'
  AND name = 'WEBDL'
  AND type = 'source'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 0;
-- --- END op 15004

-- --- BEGIN op 15005 ( update custom_format "IMF" )
UPDATE custom_format_conditions
SET arr_type = 'radarr'
WHERE custom_format_name = 'IMF'
  AND name = 'WEBRIP'
  AND type = 'source'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 0;
-- --- END op 15005

-- --- BEGIN op 15006 ( update quality_profile "HD Bluray + WEB" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'HD Bluray + WEB', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'HD Bluray + WEB'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15006

-- --- BEGIN op 15007 ( update quality_profile "Remux + WEB 1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Remux + WEB 1080p', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Remux + WEB 1080p'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15007

-- --- BEGIN op 15008 ( update quality_profile "Remux + WEB 2160p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Remux + WEB 2160p', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Remux + WEB 2160p'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15008

-- --- BEGIN op 15009 ( update quality_profile "Remux 2160p (Alternative)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Remux 2160p (Alternative)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Remux 2160p (Alternative)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15009

-- --- BEGIN op 15010 ( update quality_profile "Remux 2160p (Combined)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'Remux 2160p (Combined)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'Remux 2160p (Combined)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15010

-- --- BEGIN op 15011 ( update quality_profile "SQP-1 (1080p)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-1 (1080p)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-1 (1080p)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15011

-- --- BEGIN op 15012 ( update quality_profile "SQP-1 (2160p)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-1 (2160p)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-1 (2160p)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15012

-- --- BEGIN op 15013 ( update quality_profile "SQP-1 WEB (1080p)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-1 WEB (1080p)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-1 WEB (1080p)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15013

-- --- BEGIN op 15014 ( update quality_profile "SQP-1 WEB (2160p)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-1 WEB (2160p)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-1 WEB (2160p)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15014

-- --- BEGIN op 15015 ( update quality_profile "SQP-2" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-2', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-2'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15015

-- --- BEGIN op 15016 ( update quality_profile "SQP-3" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-3', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-3'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15016

-- --- BEGIN op 15017 ( update quality_profile "SQP-3 (Audio)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-3 (Audio)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-3 (Audio)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15017

-- --- BEGIN op 15018 ( update quality_profile "SQP-4" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-4', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-4'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15018

-- --- BEGIN op 15019 ( update quality_profile "SQP-4 (MA Hybrid)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-4 (MA Hybrid)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-4 (MA Hybrid)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15019

-- --- BEGIN op 15020 ( update quality_profile "SQP-5" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'SQP-5', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'SQP-5'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15020

-- --- BEGIN op 15021 ( update quality_profile "UHD Bluray + WEB" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'UHD Bluray + WEB', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'UHD Bluray + WEB'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15021

-- --- BEGIN op 15022 ( update quality_profile "WEB-1080p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'WEB-1080p', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'WEB-1080p'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15022

-- --- BEGIN op 15023 ( update quality_profile "WEB-2160p" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'WEB-2160p', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'WEB-2160p'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15023

-- --- BEGIN op 15024 ( update quality_profile "WEB-2160p (Combined)" )
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score)
SELECT 'WEB-2160p (Combined)', 'IMF', 'radarr', 20
WHERE NOT EXISTS (
  SELECT 1 FROM quality_profile_custom_formats
  WHERE quality_profile_name = 'WEB-2160p (Combined)'
    AND custom_format_name = 'IMF'
    AND arr_type = 'radarr'
);
-- --- END op 15024
