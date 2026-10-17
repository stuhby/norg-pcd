-- @operation: export
-- @entity: batch
-- @name: Fix SoCFoI + CM4v Regex
-- @exportedAt: 2026-10-16T19:25:23.732Z
-- @opIds: 15085

-- --- BEGIN op 15085 ( update regular_expression "SiCFoI + CM4v" )
update "regular_expressions" set "pattern" = '^(?=.*\b(CMv4)\b).*\b(SiCFoI)\b' where "name" = 'SiCFoI + CM4v' and "pattern" = '(?=.*\b(CMv4)\b).*\b(SiCFoI)\b';
-- --- END op 15085
