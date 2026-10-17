-- @operation: export
-- @entity: batch
-- @name: Add DMM-TV
-- @exportedAt: 2026-10-15T21:59:23.195Z
-- @opIds: 14914, 14915, 14916, 14917, 14918, 14919, 14920, 14921, 14922, 14923, 14924, 14925, 14926

-- --- BEGIN op 14914 ( create regular_expression "DMM-TV" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('DMM-TV', '\b(DMM-TV)\b', NULL, NULL);
-- --- END op 14914

-- --- BEGIN op 14915 ( create custom_format "DMM-TV" )
insert into "custom_formats" ("name", "description") values ('DMM-TV', '');
-- --- END op 14915

-- --- BEGIN op 14916 ( update custom_format "DMM-TV" )
update "custom_formats" set "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.' where "name" = 'DMM-TV' and "description" = '';
-- --- END op 14916

-- --- BEGIN op 14917 ( update custom_format "DMM-TV" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'DMM-TV' and "include_in_rename" = 0;
-- --- END op 14917

-- --- BEGIN op 14918 ( update custom_format "DMM-TV" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('DMM-TV', 'Asian Streaming Services');
-- --- END op 14918

-- --- BEGIN op 14919 ( update custom_format "DMM-TV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DMM-TV', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('DMM-TV', 'WEBDL', 'web_dl');
-- --- END op 14919

-- --- BEGIN op 14920 ( update custom_format "DMM-TV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DMM-TV', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('DMM-TV', 'WEBRIP', 'webrip');
-- --- END op 14920

-- --- BEGIN op 14921 ( update custom_format "DMM-TV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DMM-TV', 'Wavve', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DMM-TV', 'Wavve', 'Wavve');
-- --- END op 14921

-- --- BEGIN op 14922 ( update custom_format "DMM-TV" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'DMM-TV'
	  AND name = 'Wavve'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14922

-- --- BEGIN op 14923 ( update custom_format "DMM-TV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('DMM-TV', 'DMM-TV', 'release_title', 'sonarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DMM-TV', 'DMM-TV', 'DMM-TV');
-- --- END op 14923

-- --- BEGIN op 14924 ( update custom_format "DMM-TV" )
UPDATE custom_format_conditions
SET arr_type = 'sonarr'
WHERE custom_format_name = 'DMM-TV'
  AND name = 'WEBDL'
  AND type = 'source'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 0;
-- --- END op 14924

-- --- BEGIN op 14925 ( update custom_format "DMM-TV" )
UPDATE custom_format_conditions
SET arr_type = 'sonarr'
WHERE custom_format_name = 'DMM-TV'
  AND name = 'WEBRIP'
  AND type = 'source'
  AND arr_type = 'all'
  AND negate = 0
  AND required = 0;
-- --- END op 14925

-- --- BEGIN op 14926 ( update custom_format "DMM-TV" )
update "custom_formats" set "description" = 'DMM TV

DMM TV is a Japanese streaming service by DMM.com, offering anime, movies, dramas, and variety shows. It is especially popular for its large anime library. Content is primarily aimed at viewers in Japan.

For more information, visit the DMM TV Wikipedia page.' where "name" = 'DMM-TV' and "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.';
-- --- END op 14926
