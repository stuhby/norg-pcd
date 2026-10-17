-- @operation: export
-- @entity: batch
-- @name: Add Remaining Asian Streaming Services
-- @exportedAt: 2026-10-15T20:55:54.644Z
-- @opIds: 14765, 14766, 14767, 14768, 14769, 14770, 14771, 14772, 14773, 14774, 14775, 14776, 14777, 14778, 14779, 14780, 14781, 14782, 14783, 14784, 14785, 14786, 14787, 14788, 14789, 14790, 14791, 14792, 14793, 14794, 14795, 14796, 14797, 14798, 14799, 14800, 14801, 14802, 14803, 14804, 14805, 14806, 14807, 14808, 14809, 14810, 14811, 14812, 14813, 14814, 14815, 14816, 14817, 14818, 14819, 14820, 14821, 14822, 14823, 14824, 14825, 14826, 14827, 14828, 14829, 14830, 14831, 14832, 14833, 14834, 14835, 14836, 14837, 14838, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14848, 14849, 14850, 14851, 14852, 14853, 14854, 14855, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14867, 14868, 14869, 14870, 14871, 14872, 14873, 14874, 14875, 14876, 14877, 14878, 14879, 14880, 14881, 14882, 14883, 14884, 14885, 14886, 14887, 14888, 14889, 14890, 14891, 14892, 14893, 14894, 14895, 14896, 14897, 14898

-- --- BEGIN op 14765 ( create regular_expression "CPNG" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('CPNG', '\b(CPNG)\b', NULL, NULL);
-- --- END op 14765

-- --- BEGIN op 14766 ( create regular_expression "friDay" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('friDay', '\b(HTSR|DSNPHS|HS)\b', NULL, NULL);
-- --- END op 14766

-- --- BEGIN op 14767 ( update regular_expression "friDay" )
update "regular_expressions" set "pattern" = '\b(friDay)\b(?=[ ._-]web[ ._-]?(dl|rip)\b)' where "name" = 'friDay' and "pattern" = '\b(HTSR|DSNPHS|HS)\b';
-- --- END op 14767

-- --- BEGIN op 14768 ( create regular_expression "Hami" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Hami', '\b(hami|HamiVideo)\b', NULL, NULL);
-- --- END op 14768

-- --- BEGIN op 14769 ( create regular_expression "iQIY" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('iQIY', '\b(IQIY|IQ|iQIYI)\b(?=[ ._-]web[ ._-]?(dl|rip)\b)', NULL, NULL);
-- --- END op 14769

-- --- BEGIN op 14770 ( create regular_expression "KKTV" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('KKTV', '\b(KKTV)\b', NULL, NULL);
-- --- END op 14770

-- --- BEGIN op 14771 ( create regular_expression "KCW" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('KCW', '\b(KCW|KOCOWA)\b', NULL, NULL);
-- --- END op 14771

-- --- BEGIN op 14772 ( create regular_expression "LINETV" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('LINETV', '\b(LINETV)\b', NULL, NULL);
-- --- END op 14772

-- --- BEGIN op 14773 ( create regular_expression "myTVSUPER" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('myTVSUPER', '\b(MyTVSuper)\b', NULL, NULL);
-- --- END op 14773

-- --- BEGIN op 14774 ( create regular_expression "Viki" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Viki', '\b(Viki)\b', NULL, NULL);
-- --- END op 14774

-- --- BEGIN op 14775 ( create regular_expression "Wavve" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Wavve', '\b(WAVVE)\b', NULL, NULL);
-- --- END op 14775

-- --- BEGIN op 14776 ( create regular_expression "WeTV" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('WeTV', '\b(WETV)\b', NULL, NULL);
-- --- END op 14776

-- --- BEGIN op 14777 ( create regular_expression "YOUKU" )
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('YOUKU', '\b(YOUKU)\b', NULL, NULL);
-- --- END op 14777

-- --- BEGIN op 14778 ( create custom_format "CPNG" )
insert into "custom_formats" ("name", "description") values ('CPNG', '');
-- --- END op 14778

-- --- BEGIN op 14779 ( update custom_format "CPNG" )
update "custom_formats" set "description" = '**Fuji Television On Demand**

From Wikipedia, the free encyclopedia
FOD Website' where "name" = 'CPNG' and "description" = '';
-- --- END op 14779

-- --- BEGIN op 14780 ( update custom_format "CPNG" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'CPNG' and "include_in_rename" = 0;
-- --- END op 14780

-- --- BEGIN op 14781 ( update custom_format "CPNG" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('CPNG', 'Asian Streaming Services');
-- --- END op 14781

-- --- BEGIN op 14782 ( update custom_format "CPNG" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('CPNG', 'FOD', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CPNG', 'FOD', 'FOD');
-- --- END op 14782

-- --- BEGIN op 14783 ( update custom_format "CPNG" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('CPNG', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CPNG', 'WEBDL', 'web_dl');
-- --- END op 14783

-- --- BEGIN op 14784 ( update custom_format "CPNG" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('CPNG', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CPNG', 'WEBRIP', 'webrip');
-- --- END op 14784

-- --- BEGIN op 14785 ( update custom_format "CPNG" )
update "custom_formats" set "description" = 'Coupang Play

Coupang Play is a South Korean streaming service launched by Coupang in December 2020. It offers movies, dramas, variety shows, and live sports including the Premier League, NBA, and more. It is included with Coupang''s Rocket Wow membership.

For more information, visit the Coupang Play Wikipedia page.' where "name" = 'CPNG' and "description" = '**Fuji Television On Demand**

From Wikipedia, the free encyclopedia
FOD Website';
-- --- END op 14785

-- --- BEGIN op 14786 ( update custom_format "CPNG" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'CPNG'
	  AND name = 'FOD'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14786

-- --- BEGIN op 14787 ( update custom_format "CPNG" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('CPNG', 'CPNG', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CPNG', 'CPNG', 'CPNG');
-- --- END op 14787

-- --- BEGIN op 14788 ( create custom_format "friDay" )
insert into "custom_formats" ("name", "description") values ('friDay', '');
-- --- END op 14788

-- --- BEGIN op 14789 ( update custom_format "friDay" )
update "custom_formats" set "description" = '**TVer**

From Wikipedia, the free encyclopedia>){:target="\_blank" rel="noopener noreferrer"}
TVer Website' where "name" = 'friDay' and "description" = '';
-- --- END op 14789

-- --- BEGIN op 14790 ( update custom_format "friDay" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'friDay' and "include_in_rename" = 0;
-- --- END op 14790

-- --- BEGIN op 14791 ( update custom_format "friDay" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('friDay', 'Asian Streaming Services');
-- --- END op 14791

-- --- BEGIN op 14792 ( update custom_format "friDay" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('friDay', 'TVer', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('friDay', 'TVer', 'TVer');
-- --- END op 14792

-- --- BEGIN op 14793 ( update custom_format "friDay" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('friDay', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('friDay', 'WEBDL', 'web_dl');
-- --- END op 14793

-- --- BEGIN op 14794 ( update custom_format "friDay" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('friDay', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('friDay', 'WEBRIP', 'webrip');
-- --- END op 14794

-- --- BEGIN op 14795 ( update custom_format "friDay" )
update "custom_formats" set "description" = 'friDay Video

friDay Video is a Taiwanese streaming service owned by Far EasTone, one of Taiwan''s major telecom providers, and is Taiwan''s number one domestic streaming platform. It offers movies, dramas, variety shows, live news, and anime, with a strong focus on Korean, Japanese, and local Taiwanese content. New releases and simulcast titles are regularly added, making it a popular choice for fans of Asian entertainment in Taiwan.

For more information, visit the Far EasTone Wikipedia page.' where "name" = 'friDay' and "description" = '**TVer**

From Wikipedia, the free encyclopedia>){:target="\_blank" rel="noopener noreferrer"}
TVer Website';
-- --- END op 14795

-- --- BEGIN op 14796 ( update custom_format "friDay" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'friDay'
	  AND name = 'TVer'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14796

-- --- BEGIN op 14797 ( update custom_format "friDay" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('friDay', 'friDay', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('friDay', 'friDay', 'friDay');
-- --- END op 14797

-- --- BEGIN op 14798 ( create custom_format "Hami" )
insert into "custom_formats" ("name", "description") values ('Hami', '');
-- --- END op 14798

-- --- BEGIN op 14799 ( update custom_format "Hami" )
update "custom_formats" set "description" = '**Disney+ Hotstar**

From Wikipedia, the free encyclopedia

Disney+ Hotstar is an Indian subscription-based video-on-demand streaming service owned by JioStar, a joint venture between Reliance Industries, Viacom18, and Disney India. It offers a diverse array of content from Disney Star (formerly Star India) local networks, including films, television series, live sports, and original programming, as well as licensed content from third parties such as Showtime and Southeast Asian countries (Indonesia, Malaysia, and Thailand.) Although it primarily caters to audiences in India and those of Indian origin living abroad, its catalog has broad appeal.' where "name" = 'Hami' and "description" = '';
-- --- END op 14799

-- --- BEGIN op 14800 ( update custom_format "Hami" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'Hami' and "include_in_rename" = 0;
-- --- END op 14800

-- --- BEGIN op 14801 ( update custom_format "Hami" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Hami', 'Asian Streaming Services');
-- --- END op 14801

-- --- BEGIN op 14802 ( update custom_format "Hami" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Hami', 'Hotstar', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Hami', 'Hotstar', 'Hotstar');
-- --- END op 14802

-- --- BEGIN op 14803 ( update custom_format "Hami" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Hami', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Hami', 'WEBDL', 'web_dl');
-- --- END op 14803

-- --- BEGIN op 14804 ( update custom_format "Hami" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Hami', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Hami', 'WEBRIP', 'webrip');
-- --- END op 14804

-- --- BEGIN op 14805 ( update custom_format "Hami" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Hami'
	  AND name = 'Hotstar'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14805

-- --- BEGIN op 14806 ( update custom_format "Hami" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Hami', 'Hami', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Hami', 'Hami', 'Hami');
-- --- END op 14806

-- --- BEGIN op 14807 ( update custom_format "Hami" )
update "custom_formats" set "description" = 'Hami Video

Hami Video is a Taiwanese streaming service owned by Chunghwa Telecom, Taiwan''s largest telecom provider. It offers live TV channels, movies, dramas, anime, and major sporting events, including the Olympics. It is primarily aimed at viewers in Taiwan and is available as part of Chunghwa Telecom''s broader entertainment services.

For more information, visit the Chunghwa Telecom Wikipedia page.' where "name" = 'Hami' and "description" = '**Disney+ Hotstar**

From Wikipedia, the free encyclopedia

Disney+ Hotstar is an Indian subscription-based video-on-demand streaming service owned by JioStar, a joint venture between Reliance Industries, Viacom18, and Disney India. It offers a diverse array of content from Disney Star (formerly Star India) local networks, including films, television series, live sports, and original programming, as well as licensed content from third parties such as Showtime and Southeast Asian countries (Indonesia, Malaysia, and Thailand.) Although it primarily caters to audiences in India and those of Indian origin living abroad, its catalog has broad appeal.';
-- --- END op 14807

-- --- BEGIN op 14808 ( create custom_format "iQIY" )
insert into "custom_formats" ("name", "description") values ('iQIY', '');
-- --- END op 14808

-- --- BEGIN op 14809 ( update custom_format "iQIY" )
update "custom_formats" set "description" = 'Hami Video

Hami Video is a Taiwanese streaming service owned by Chunghwa Telecom, Taiwan''s largest telecom provider. It offers live TV channels, movies, dramas, anime, and major sporting events, including the Olympics. It is primarily aimed at viewers in Taiwan and is available as part of Chunghwa Telecom''s broader entertainment services.

For more information, visit the Chunghwa Telecom Wikipedia page.' where "name" = 'iQIY' and "description" = '';
-- --- END op 14809

-- --- BEGIN op 14810 ( update custom_format "iQIY" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'iQIY' and "include_in_rename" = 0;
-- --- END op 14810

-- --- BEGIN op 14811 ( update custom_format "iQIY" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('iQIY', 'Asian Streaming Services');
-- --- END op 14811

-- --- BEGIN op 14812 ( update custom_format "iQIY" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('iQIY', 'Hami', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('iQIY', 'Hami', 'Hami');
-- --- END op 14812

-- --- BEGIN op 14813 ( update custom_format "iQIY" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('iQIY', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('iQIY', 'WEBDL', 'web_dl');
-- --- END op 14813

-- --- BEGIN op 14814 ( update custom_format "iQIY" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('iQIY', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('iQIY', 'WEBRIP', 'webrip');
-- --- END op 14814

-- --- BEGIN op 14815 ( update custom_format "iQIY" )
update "custom_formats" set "description" = 'iQIYI

iQIYI is a Chinese streaming service offering a wide range of Asian content, including Chinese dramas, anime, variety shows, and original movies. Initially available only in China, it has since expanded to international viewers. It is owned by Baidu and is one of the largest online video platforms in the world.

For more information, visit the iQIYI Wikipedia page.' where "name" = 'iQIY' and "description" = 'Hami Video

Hami Video is a Taiwanese streaming service owned by Chunghwa Telecom, Taiwan''s largest telecom provider. It offers live TV channels, movies, dramas, anime, and major sporting events, including the Olympics. It is primarily aimed at viewers in Taiwan and is available as part of Chunghwa Telecom''s broader entertainment services.

For more information, visit the Chunghwa Telecom Wikipedia page.';
-- --- END op 14815

-- --- BEGIN op 14816 ( update custom_format "iQIY" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'iQIY'
	  AND name = 'Hami'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14816

-- --- BEGIN op 14817 ( update custom_format "iQIY" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('iQIY', 'iQIY', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('iQIY', 'iQIY', 'iQIY');
-- --- END op 14817

-- --- BEGIN op 14818 ( create custom_format "KKTV" )
insert into "custom_formats" ("name", "description") values ('KKTV', '');
-- --- END op 14818

-- --- BEGIN op 14819 ( update custom_format "KKTV" )
update "custom_formats" set "description" = '**TVer**

From Wikipedia, the free encyclopedia>){:target="\_blank" rel="noopener noreferrer"}
TVer Website' where "name" = 'KKTV' and "description" = '';
-- --- END op 14819

-- --- BEGIN op 14820 ( update custom_format "KKTV" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'KKTV' and "include_in_rename" = 0;
-- --- END op 14820

-- --- BEGIN op 14821 ( update custom_format "KKTV" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('KKTV', 'Asian Streaming Services');
-- --- END op 14821

-- --- BEGIN op 14822 ( update custom_format "KKTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KKTV', 'TVer', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('KKTV', 'TVer', 'TVer');
-- --- END op 14822

-- --- BEGIN op 14823 ( update custom_format "KKTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KKTV', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('KKTV', 'WEBDL', 'web_dl');
-- --- END op 14823

-- --- BEGIN op 14824 ( update custom_format "KKTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KKTV', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('KKTV', 'WEBRIP', 'webrip');
-- --- END op 14824

-- --- BEGIN op 14825 ( update custom_format "KKTV" )
update "custom_formats" set "description" = 'KKTV

KKTV is a Taiwanese streaming service offering dramas, films, and anime from Taiwan, Japan, South Korea, Thailand, and Hong Kong, as well as original series. It was founded in 2016 and is based in Taipei, Taiwan. It is especially known for offering the latest Japanese dramas, with some released within hours or days of their premiere in Japan. In November 2025, KKTV merged with LINE TV.

For more information, visit the KKTV Wikipedia page.' where "name" = 'KKTV' and "description" = '**TVer**

From Wikipedia, the free encyclopedia>){:target="\_blank" rel="noopener noreferrer"}
TVer Website';
-- --- END op 14825

-- --- BEGIN op 14826 ( update custom_format "KKTV" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'KKTV'
	  AND name = 'TVer'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14826

-- --- BEGIN op 14827 ( update custom_format "KKTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KKTV', 'KKTV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('KKTV', 'KKTV', 'KKTV');
-- --- END op 14827

-- --- BEGIN op 14828 ( create custom_format "KCW" )
insert into "custom_formats" ("name", "description") values ('KCW', '');
-- --- END op 14828

-- --- BEGIN op 14829 ( update custom_format "KCW" )
update "custom_formats" set "description" = 'KKTV

KKTV is a Taiwanese streaming service offering dramas, films, and anime from Taiwan, Japan, South Korea, Thailand, and Hong Kong, as well as original series. It was founded in 2016 and is based in Taipei, Taiwan. It is especially known for offering the latest Japanese dramas, with some released within hours or days of their premiere in Japan. In November 2025, KKTV merged with LINE TV.

For more information, visit the KKTV Wikipedia page.' where "name" = 'KCW' and "description" = '';
-- --- END op 14829

-- --- BEGIN op 14830 ( update custom_format "KCW" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'KCW' and "include_in_rename" = 0;
-- --- END op 14830

-- --- BEGIN op 14831 ( update custom_format "KCW" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('KCW', 'Asian Streaming Services');
-- --- END op 14831

-- --- BEGIN op 14832 ( update custom_format "KCW" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KCW', 'KKTV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('KCW', 'KKTV', 'KKTV');
-- --- END op 14832

-- --- BEGIN op 14833 ( update custom_format "KCW" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KCW', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('KCW', 'WEBDL', 'web_dl');
-- --- END op 14833

-- --- BEGIN op 14834 ( update custom_format "KCW" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KCW', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('KCW', 'WEBRIP', 'webrip');
-- --- END op 14834

-- --- BEGIN op 14835 ( update custom_format "KCW" )
update "custom_formats" set "description" = 'KOCOWA aka KCW

KOCOWA is a premium Korean streaming service that offers Korean dramas, variety shows, and K-Pop content from major broadcasters KBS, MBC, and SBS. New shows are available within 6 hours of their original airtime in Korea, with subtitles in English, Portuguese, and Spanish.

For more information, visit the KOCOWA Wikipedia page.' where "name" = 'KCW' and "description" = 'KKTV

KKTV is a Taiwanese streaming service offering dramas, films, and anime from Taiwan, Japan, South Korea, Thailand, and Hong Kong, as well as original series. It was founded in 2016 and is based in Taipei, Taiwan. It is especially known for offering the latest Japanese dramas, with some released within hours or days of their premiere in Japan. In November 2025, KKTV merged with LINE TV.

For more information, visit the KKTV Wikipedia page.';
-- --- END op 14835

-- --- BEGIN op 14836 ( update custom_format "KCW" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'KCW'
	  AND name = 'KKTV'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14836

-- --- BEGIN op 14837 ( update custom_format "KCW" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('KCW', 'KCW', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('KCW', 'KCW', 'KCW');
-- --- END op 14837

-- --- BEGIN op 14838 ( create custom_format "LINETV" )
insert into "custom_formats" ("name", "description") values ('LINETV', '');
-- --- END op 14838

-- --- BEGIN op 14839 ( update custom_format "LINETV" )
update "custom_formats" set "description" = 'KOCOWA aka KCW

KOCOWA is a premium Korean streaming service that offers Korean dramas, variety shows, and K-Pop content from major broadcasters KBS, MBC, and SBS. New shows are available within 6 hours of their original airtime in Korea, with subtitles in English, Portuguese, and Spanish.

For more information, visit the KOCOWA Wikipedia page.' where "name" = 'LINETV' and "description" = '';
-- --- END op 14839

-- --- BEGIN op 14840 ( update custom_format "LINETV" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'LINETV' and "include_in_rename" = 0;
-- --- END op 14840

-- --- BEGIN op 14841 ( update custom_format "LINETV" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('LINETV', 'Asian Streaming Services');
-- --- END op 14841

-- --- BEGIN op 14842 ( update custom_format "LINETV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('LINETV', 'KCW', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LINETV', 'KCW', 'KCW');
-- --- END op 14842

-- --- BEGIN op 14843 ( update custom_format "LINETV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('LINETV', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('LINETV', 'WEBDL', 'web_dl');
-- --- END op 14843

-- --- BEGIN op 14844 ( update custom_format "LINETV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('LINETV', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('LINETV', 'WEBRIP', 'webrip');
-- --- END op 14844

-- --- BEGIN op 14845 ( update custom_format "LINETV" )
update "custom_formats" set "description" = 'LINE TV

LINE TV is a free, ad-supported streaming service owned by Japan-based LINE Corporation, operating mainly in Taiwan. It offers dramas, variety shows, movies, anime, and original content. It is especially popular for Taiwanese, Korean, and Chinese content. In November 2025, LINE TV announced a full merger with KKTV, combining both platforms'' content libraries to offer a wider range of Asian dramas and new features such as offline viewing and dual subtitles.

For more information, visit the LINE TV Wikipedia page.' where "name" = 'LINETV' and "description" = 'KOCOWA aka KCW

KOCOWA is a premium Korean streaming service that offers Korean dramas, variety shows, and K-Pop content from major broadcasters KBS, MBC, and SBS. New shows are available within 6 hours of their original airtime in Korea, with subtitles in English, Portuguese, and Spanish.

For more information, visit the KOCOWA Wikipedia page.';
-- --- END op 14845

-- --- BEGIN op 14846 ( update custom_format "LINETV" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'LINETV'
	  AND name = 'KCW'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14846

-- --- BEGIN op 14847 ( update custom_format "LINETV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('LINETV', 'LINETV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LINETV', 'LINETV', 'KCW');
-- --- END op 14847

-- --- BEGIN op 14848 ( create custom_format "myTVSUPER" )
insert into "custom_formats" ("name", "description") values ('myTVSUPER', '');
-- --- END op 14848

-- --- BEGIN op 14849 ( update custom_format "myTVSUPER" )
update "custom_formats" set "description" = 'Hami Video

Hami Video is a Taiwanese streaming service owned by Chunghwa Telecom, Taiwan''s largest telecom provider. It offers live TV channels, movies, dramas, anime, and major sporting events, including the Olympics. It is primarily aimed at viewers in Taiwan and is available as part of Chunghwa Telecom''s broader entertainment services.

For more information, visit the Chunghwa Telecom Wikipedia page.' where "name" = 'myTVSUPER' and "description" = '';
-- --- END op 14849

-- --- BEGIN op 14850 ( update custom_format "myTVSUPER" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'myTVSUPER' and "include_in_rename" = 0;
-- --- END op 14850

-- --- BEGIN op 14851 ( update custom_format "myTVSUPER" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('myTVSUPER', 'Asian Streaming Services');
-- --- END op 14851

-- --- BEGIN op 14852 ( update custom_format "myTVSUPER" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('myTVSUPER', 'Hami', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('myTVSUPER', 'Hami', 'Hami');
-- --- END op 14852

-- --- BEGIN op 14853 ( update custom_format "myTVSUPER" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('myTVSUPER', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('myTVSUPER', 'WEBDL', 'web_dl');
-- --- END op 14853

-- --- BEGIN op 14854 ( update custom_format "myTVSUPER" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('myTVSUPER', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('myTVSUPER', 'WEBRIP', 'webrip');
-- --- END op 14854

-- --- BEGIN op 14855 ( update custom_format "myTVSUPER" )
update "custom_formats" set "description" = 'myTV SUPER

myTV SUPER is a subscription-based streaming service launched in April 2016 by MyTV Super Limited, a subsidiary of Television Broadcasts Limited (TVB) in Hong Kong. It offers TVB dramas, variety shows, movies, anime, live sports, and horse racing content, with some content supporting up to 4K resolution. The service is primarily available in Hong Kong and Macau.

For more information, visit the myTV SUPER Wikipedia page.' where "name" = 'myTVSUPER' and "description" = 'Hami Video

Hami Video is a Taiwanese streaming service owned by Chunghwa Telecom, Taiwan''s largest telecom provider. It offers live TV channels, movies, dramas, anime, and major sporting events, including the Olympics. It is primarily aimed at viewers in Taiwan and is available as part of Chunghwa Telecom''s broader entertainment services.

For more information, visit the Chunghwa Telecom Wikipedia page.';
-- --- END op 14855

-- --- BEGIN op 14856 ( update custom_format "myTVSUPER" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'myTVSUPER'
	  AND name = 'Hami'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14856

-- --- BEGIN op 14857 ( update custom_format "myTVSUPER" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('myTVSUPER', 'myTVSUPER', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('myTVSUPER', 'myTVSUPER', 'myTVSUPER');
-- --- END op 14857

-- --- BEGIN op 14858 ( create custom_format "Viki" )
insert into "custom_formats" ("name", "description") values ('Viki', '');
-- --- END op 14858

-- --- BEGIN op 14859 ( update custom_format "Viki" )
update "custom_formats" set "description" = '**U-NEXT**

From Wikipedia, the free encyclopedia
U-NEXT Website' where "name" = 'Viki' and "description" = '';
-- --- END op 14859

-- --- BEGIN op 14860 ( update custom_format "Viki" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'Viki' and "include_in_rename" = 0;
-- --- END op 14860

-- --- BEGIN op 14861 ( update custom_format "Viki" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Viki', 'Asian Streaming Services');
-- --- END op 14861

-- --- BEGIN op 14862 ( update custom_format "Viki" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Viki', 'U-NEXT', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Viki', 'U-NEXT', 'U-NEXT');
-- --- END op 14862

-- --- BEGIN op 14863 ( update custom_format "Viki" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Viki', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Viki', 'WEBDL', 'web_dl');
-- --- END op 14863

-- --- BEGIN op 14864 ( update custom_format "Viki" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Viki', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Viki', 'WEBRIP', 'webrip');
-- --- END op 14864

-- --- BEGIN op 14865 ( update custom_format "\b(Viki)\b" )
update "custom_formats" set "name" = '\b(Viki)\b' where "name" = 'Viki';
-- --- END op 14865

-- --- BEGIN op 14866 ( update custom_format "\b(Viki)\b" )
update "custom_formats" set "description" = 'Viki (Rakuten Viki)

Rakuten Viki is a streaming service owned by Rakuten that specialises in Asian TV shows and films, particularly Korean, Chinese, Taiwanese, and Japanese productions. It is available worldwide and is unique for its community-created subtitles, with content available in more than 200 languages.

For more information, visit the Rakuten Viki Wikipedia page.' where "name" = '\b(Viki)\b' and "description" = '**U-NEXT**

From Wikipedia, the free encyclopedia
U-NEXT Website';
-- --- END op 14866

-- --- BEGIN op 14867 ( update custom_format "Viki" )
update "custom_formats" set "name" = 'Viki' where "name" = '\b(Viki)\b';
-- --- END op 14867

-- --- BEGIN op 14868 ( update custom_format "Viki" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Viki'
	  AND name = 'U-NEXT'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14868

-- --- BEGIN op 14869 ( update custom_format "Viki" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Viki', 'Viki', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Viki', 'Viki', 'Viki');
-- --- END op 14869

-- --- BEGIN op 14870 ( create custom_format "Wavve" )
insert into "custom_formats" ("name", "description") values ('Wavve', '');
-- --- END op 14870

-- --- BEGIN op 14871 ( update custom_format "Wavve" )
update "custom_formats" set "description" = 'Viki (Rakuten Viki)

Rakuten Viki is a streaming service owned by Rakuten that specialises in Asian TV shows and films, particularly Korean, Chinese, Taiwanese, and Japanese productions. It is available worldwide and is unique for its community-created subtitles, with content available in more than 200 languages.

For more information, visit the Rakuten Viki Wikipedia page.' where "name" = 'Wavve' and "description" = '';
-- --- END op 14871

-- --- BEGIN op 14872 ( update custom_format "Wavve" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'Wavve' and "include_in_rename" = 0;
-- --- END op 14872

-- --- BEGIN op 14873 ( update custom_format "Wavve" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Wavve', 'Asian Streaming Services');
-- --- END op 14873

-- --- BEGIN op 14874 ( update custom_format "Wavve" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Wavve', 'Viki', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Wavve', 'Viki', 'Viki');
-- --- END op 14874

-- --- BEGIN op 14875 ( update custom_format "Wavve" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Wavve', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Wavve', 'WEBDL', 'web_dl');
-- --- END op 14875

-- --- BEGIN op 14876 ( update custom_format "Wavve" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Wavve', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Wavve', 'WEBRIP', 'webrip');
-- --- END op 14876

-- --- BEGIN op 14877 ( update custom_format "Wavve" )
update "custom_formats" set "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.' where "name" = 'Wavve' and "description" = 'Viki (Rakuten Viki)

Rakuten Viki is a streaming service owned by Rakuten that specialises in Asian TV shows and films, particularly Korean, Chinese, Taiwanese, and Japanese productions. It is available worldwide and is unique for its community-created subtitles, with content available in more than 200 languages.

For more information, visit the Rakuten Viki Wikipedia page.';
-- --- END op 14877

-- --- BEGIN op 14878 ( update custom_format "Wavve" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Wavve'
	  AND name = 'Viki'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14878

-- --- BEGIN op 14879 ( update custom_format "Wavve" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Wavve', 'Wavve', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Wavve', 'Wavve', 'Wavve');
-- --- END op 14879

-- --- BEGIN op 14880 ( create custom_format "WeTV" )
insert into "custom_formats" ("name", "description") values ('WeTV', '');
-- --- END op 14880

-- --- BEGIN op 14881 ( update custom_format "WeTV" )
update "custom_formats" set "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.' where "name" = 'WeTV' and "description" = '';
-- --- END op 14881

-- --- BEGIN op 14882 ( update custom_format "WeTV" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'WeTV' and "include_in_rename" = 0;
-- --- END op 14882

-- --- BEGIN op 14883 ( update custom_format "WeTV" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('WeTV', 'Asian Streaming Services');
-- --- END op 14883

-- --- BEGIN op 14884 ( update custom_format "WeTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WeTV', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('WeTV', 'WEBDL', 'web_dl');
-- --- END op 14884

-- --- BEGIN op 14885 ( update custom_format "WeTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WeTV', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('WeTV', 'WEBRIP', 'webrip');
-- --- END op 14885

-- --- BEGIN op 14886 ( update custom_format "WeTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WeTV', 'Wavve', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WeTV', 'Wavve', 'Wavve');
-- --- END op 14886

-- --- BEGIN op 14887 ( update custom_format "WeTV" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'WeTV'
	  AND name = 'Wavve'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14887

-- --- BEGIN op 14888 ( update custom_format "WeTV" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('WeTV', 'WeTV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WeTV', 'WeTV', 'WeTV');
-- --- END op 14888

-- --- BEGIN op 14889 ( create custom_format "Youku" )
insert into "custom_formats" ("name", "description") values ('Youku', '');
-- --- END op 14889

-- --- BEGIN op 14890 ( update custom_format "Youku" )
update "custom_formats" set "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.' where "name" = 'Youku' and "description" = '';
-- --- END op 14890

-- --- BEGIN op 14891 ( update custom_format "Youku" )
update "custom_formats" set "include_in_rename" = 1 where "name" = 'Youku' and "include_in_rename" = 0;
-- --- END op 14891

-- --- BEGIN op 14892 ( update custom_format "Youku" )
insert into "tags" ("name") values ('Asian Streaming Services') on conflict ("name") do nothing;

insert into "custom_format_tags" ("custom_format_name", "tag_name") values ('Youku', 'Asian Streaming Services');
-- --- END op 14892

-- --- BEGIN op 14893 ( update custom_format "Youku" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Youku', 'WEBDL', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Youku', 'WEBDL', 'web_dl');
-- --- END op 14893

-- --- BEGIN op 14894 ( update custom_format "Youku" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Youku', 'WEBRIP', 'source', 'all', 0, 0);

INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Youku', 'WEBRIP', 'webrip');
-- --- END op 14894

-- --- BEGIN op 14895 ( update custom_format "Youku" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Youku', 'WeTV', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Youku', 'WeTV', 'WeTV');
-- --- END op 14895

-- --- BEGIN op 14896 ( update custom_format "Youku" )
update "custom_formats" set "description" = 'Youku

Youku is one of China''s leading video streaming platforms, founded in 2006 and headquartered in Beijing. It has been part of the Alibaba Group since its acquisition in 2015. It offers original TV dramas, variety shows, and licensed international content, including Korean dramas, Japanese anime, and selected Western series. The service is primarily aimed at audiences in China.

For more information, visit the Youku Wikipedia page.' where "name" = 'Youku' and "description" = 'Wavve

Wavve is a South Korean subscription streaming service operated by SK Telecom, offering TV dramas, variety shows, films, documentaries, animations, and sports. It was launched in September 2019 as a joint venture between SK Telecom and South Korea''s three major broadcasters KBS, MBC, and SBS. Wavve has received approval to merge with fellow Korean streaming service TVING.

For more information, visit the Wavve Wikipedia page.';
-- --- END op 14896

-- --- BEGIN op 14897 ( update custom_format "Youku" )
DELETE FROM custom_format_conditions
	WHERE custom_format_name = 'Youku'
	  AND name = 'WeTV'
	  AND type = 'release_title'
	  AND arr_type = 'all'
	  AND negate = 0
	  AND required = 1;
-- --- END op 14897

-- --- BEGIN op 14898 ( update custom_format "Youku" )
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required)
VALUES ('Youku', 'Youku', 'release_title', 'all', 0, 1);

INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Youku', 'Youku', 'YOUKU');
-- --- END op 14898
