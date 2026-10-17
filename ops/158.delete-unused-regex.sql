-- @operation: export
-- @entity: batch
-- @name: Delete Unused Regex
-- @exportedAt: 2026-10-16T19:24:22.590Z
-- @opIds: 15079

-- --- BEGIN op 15079 ( delete regular_expression "Dutch Groups" )
delete from "regular_expressions" where "name" = 'Dutch Groups';
-- --- END op 15079
