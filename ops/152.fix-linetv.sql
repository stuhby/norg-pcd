-- @operation: export
-- @entity: batch
-- @name: Fix LINETV
-- @exportedAt: 2026-10-15T21:49:52.280Z
-- @opIds: 14900

-- --- BEGIN op 14900 ( update custom_format "LINETV" )
DELETE FROM condition_patterns WHERE custom_format_name = 'LINETV' AND condition_name = 'LINETV' AND regular_expression_name = 'KCW';

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LINETV', 'LINETV', 'LINETV');
-- --- END op 14900
