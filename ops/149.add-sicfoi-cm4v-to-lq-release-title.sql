-- @operation: export
-- @entity: batch
-- @name: Add SiCFoI + CM4v to LQ(Release Title)
-- @exportedAt: 2026-10-14T01:26:47.990Z
-- @opIds: 14702, 14705

-- --- BEGIN op 14702 ( create regular_expression "SiCFoI + CM4v" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('SiCFoI + CM4v', '(?=.*\b(CMv4)\b).*\b(SiCFoI)\b', NULL, NULL);
-- --- END op 14702

-- --- BEGIN op 14705 ( update custom_format "LQ (Release Title)" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('LQ (Release Title)', 'SiCFoI + CM4v', 'release_title', 'radarr', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LQ (Release Title)', 'SiCFoI + CM4v', 'SiCFoI + CM4v');
-- --- END op 14705
