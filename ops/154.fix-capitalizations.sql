-- @operation: export
-- @entity: batch
-- @name: Fix Capitalizations
-- @exportedAt: 2026-10-15T22:21:38.409Z
-- @opIds: 14936, 14937, 14938, 14939, 14940, 14941, 14942, 14943, 14944, 14945, 14946, 14947, 14948, 14949, 14950, 14951, 14952, 14953, 14954, 14955, 14956, 14957, 14958, 14959, 14960, 14961, 14962, 14963, 14964

-- --- BEGIN op 14936 ( update custom_format "Bob" )
update "custom_formats" set "name" = 'Bob' where "name" = 'Wavve';
-- --- END op 14936

-- --- BEGIN op 14937 ( update custom_format "WAVVE" )
update "custom_formats" set "name" = 'WAVVE' where "name" = 'Bob';
-- --- END op 14937

-- --- BEGIN op 14938 ( update custom_format "WAVVE" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'WAVVE'
	  AND name = 'Wavve'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14938

-- --- BEGIN op 14939 ( update custom_format "WAVVE" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WAVVE', 'WAVVE', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WAVVE', 'WAVVE', 'Wavve');
-- --- END op 14939

-- --- BEGIN op 14940 ( update regular_expression "bob" )
update "regular_expressions" set "name" = 'bob' where "name" = 'Wavve';
-- --- END op 14940

-- --- BEGIN op 14941 ( update custom_format "WAVVE" )
update "condition_patterns" set "regular_expression_name" = 'bob' where "custom_format_name" = 'WAVVE' and "condition_name" = 'WAVVE' and "regular_expression_name" in ('Wavve', 'bob');
-- --- END op 14941

-- --- BEGIN op 14942 ( update regular_expression "WAVVE" )
update "regular_expressions" set "name" = 'WAVVE' where "name" = 'bob';
-- --- END op 14942

-- --- BEGIN op 14943 ( update custom_format "WAVVE" )
update "condition_patterns" set "regular_expression_name" = 'WAVVE' where "custom_format_name" = 'WAVVE' and "condition_name" = 'WAVVE' and "regular_expression_name" in ('bob', 'WAVVE');
-- --- END op 14943

-- --- BEGIN op 14944 ( update custom_format "bob" )
update "custom_formats" set "name" = 'bob' where "name" = 'WeTV';
-- --- END op 14944

-- --- BEGIN op 14945 ( update custom_format "WETV" )
update "custom_formats" set "name" = 'WETV' where "name" = 'bob';
-- --- END op 14945

-- --- BEGIN op 14946 ( update custom_format "WETV" )
update "custom_formats" set "description" = 'WeTV

WeTV is the international version of Tencent Video, a Chinese streaming service owned by Tencent. It was launched in 2018 and offers Chinese, Korean, Thai, and Japanese dramas, movies, anime, and original productions. It serves content from various Asian countries, including Indonesia, Korea, Thailand, Malaysia, the Philippines, and Japan, and also produces local original content in the regions where it operates.

For more information, visit the Tencent Video Wikipedia page.' where "name" = 'WETV' and "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.';
-- --- END op 14946

-- --- BEGIN op 14947 ( update custom_format "WETV" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'WETV'
	  AND name = 'WeTV'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14947

-- --- BEGIN op 14948 ( update custom_format "WETV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WETV', 'WETV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WETV', 'WETV', 'WeTV');
-- --- END op 14948

-- --- BEGIN op 14949 ( update regular_expression "bob" )
update "regular_expressions" set "name" = 'bob' where "name" = 'WeTV';
-- --- END op 14949

-- --- BEGIN op 14950 ( update custom_format "WETV" )
update "condition_patterns" set "regular_expression_name" = 'bob' where "custom_format_name" = 'WETV' and "condition_name" = 'WETV' and "regular_expression_name" in ('WeTV', 'bob');
-- --- END op 14950

-- --- BEGIN op 14951 ( update regular_expression "WETV" )
update "regular_expressions" set "name" = 'WETV' where "name" = 'bob';
-- --- END op 14951

-- --- BEGIN op 14952 ( update custom_format "WETV" )
update "condition_patterns" set "regular_expression_name" = 'WETV' where "custom_format_name" = 'WETV' and "condition_name" = 'WETV' and "regular_expression_name" in ('bob', 'WETV');
-- --- END op 14952

-- --- BEGIN op 14953 ( update custom_format "bob" )
update "custom_formats" set "name" = 'bob' where "name" = 'Youku';
-- --- END op 14953

-- --- BEGIN op 14954 ( update custom_format "YOUKU" )
update "custom_formats" set "name" = 'YOUKU' where "name" = 'bob';
-- --- END op 14954

-- --- BEGIN op 14955 ( update custom_format "YOUKU" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'YOUKU'
	  AND name = 'Youku'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14955

-- --- BEGIN op 14956 ( update custom_format "YOUKU" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('YOUKU', 'YOUKU', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('YOUKU', 'YOUKU', 'YOUKU');
-- --- END op 14956

-- --- BEGIN op 14957 ( update custom_format "bob" )
update "custom_formats" set "name" = 'bob' where "name" = 'myTVSUPER';
-- --- END op 14957

-- --- BEGIN op 14958 ( update custom_format "MyTVSuper" )
update "custom_formats" set "name" = 'MyTVSuper' where "name" = 'bob';
-- --- END op 14958

-- --- BEGIN op 14959 ( update custom_format "MyTVSuper" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'MyTVSuper'
	  AND name = 'myTVSUPER'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14959

-- --- BEGIN op 14960 ( update custom_format "MyTVSuper" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('MyTVSuper', 'MyTVSuper', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('MyTVSuper', 'MyTVSuper', 'myTVSUPER');
-- --- END op 14960

-- --- BEGIN op 14961 ( update regular_expression "bob" )
update "regular_expressions" set "name" = 'bob' where "name" = 'myTVSUPER';
-- --- END op 14961

-- --- BEGIN op 14962 ( update custom_format "MyTVSuper" )
update "condition_patterns" set "regular_expression_name" = 'bob' where "custom_format_name" = 'MyTVSuper' and "condition_name" = 'MyTVSuper' and "regular_expression_name" in ('myTVSUPER', 'bob');
-- --- END op 14962

-- --- BEGIN op 14963 ( update regular_expression "MyTVSuper" )
update "regular_expressions" set "name" = 'MyTVSuper' where "name" = 'bob';
-- --- END op 14963

-- --- BEGIN op 14964 ( update custom_format "MyTVSuper" )
update "condition_patterns" set "regular_expression_name" = 'MyTVSuper' where "custom_format_name" = 'MyTVSuper' and "condition_name" = 'MyTVSuper' and "regular_expression_name" in ('bob', 'MyTVSuper');
-- --- END op 14964
