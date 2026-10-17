-- @operation: export
-- @entity: batch
-- @name: Fix IMF
-- @exportedAt: 2026-10-15T22:51:38.354Z
-- @opIds: 15045, 15046

-- --- BEGIN op 15045 ( update custom_format "IMF" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'IMF'
	  AND name = 'WEBDL'
	  AND type = 'source'
	  AND arr_type = 'radarr'
	  AND negate = 0
	  AND required = 0;
-- --- END op 15045

-- --- BEGIN op 15046 ( update custom_format "IMF" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'IMF'
	  AND name = 'WEBRIP'
	  AND type = 'source'
	  AND arr_type = 'radarr'
	  AND negate = 0
	  AND required = 0;
-- --- END op 15046
