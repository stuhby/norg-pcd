-- @operation: export
-- @entity: batch
-- @name: Change IMF Condition Name to Match Upstream
-- @exportedAt: 2026-10-15T22:52:55.981Z
-- @opIds: 15054, 15055

-- --- BEGIN op 15054 ( update custom_format "IMF" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'IMF'
	  AND name = 'IMF'
	  AND type = 'release_title'
	  AND arr_type = 'radarr'
	  AND negate = 0
	  AND required = 1;
-- --- END op 15054

-- --- BEGIN op 15055 ( update custom_format "IMF" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('IMF', 'Interoperable Master Format', 'release_title', 'radarr', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('IMF', 'Interoperable Master Format', 'Interoperable Master Format');
-- --- END op 15055
