-- @operation: export
-- @entity: batch
-- @name: Add RlsGrp SumVision to Generated Dynamic HDR
-- @exportedAt: 2026-10-14T01:29:36.606Z
-- @opIds: 14711, 14714

-- --- BEGIN op 14711 ( update custom_format "Generated Dynamic HDR" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Generated Dynamic HDR', 'SumVision', 'release_title', 'radarr', 0, 0);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Generated Dynamic HDR', 'SumVision', 'SumVision');
-- --- END op 14711

-- --- BEGIN op 14714 ( update custom_format "Generated Dynamic HDR" )
UPDATE custom_format_conditions
SET type = 'release_group'
WHERE custom_format_name = 'Generated Dynamic HDR'
  AND name = 'SumVision'
  AND type = 'release_title'
  AND arr_type = 'radarr'
  AND negate = 0
  AND required = 0;

DELETE FROM condition_patterns WHERE custom_format_name = 'Generated Dynamic HDR' AND condition_name = 'SumVision' AND regular_expression_name = 'SumVision';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Generated Dynamic HDR', 'SumVision', 'SumVision');
-- --- END op 14714
