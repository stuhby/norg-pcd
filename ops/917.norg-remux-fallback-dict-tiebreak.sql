-- 917.norg-remux-fallback-dict-tiebreak.sql
--
-- Operator 2026-10-17, `1080p Encode (Remux Fallback)` only:
-- (1) DTS +50 removed. Both DTS cores and AC3 are lossy disc or encoder tracks; the bonus only reordered
--     groups by audio (an NTb DTS encode beat a DON AC3 encode on Hannibal).
-- (2) Inside each tier, Dictionarry's own 1080p Quality ranking breaks ties: Dict Rank 1-4 (Norg) = the
--     group lists of `1080p Quality Tier 1-4 (Dict)` (Dictionarry database, 2026-10-17), scored +40/+30/+20/+10.
--     TRaSH HD Bluray Tier 01 then orders DON > CtrlHD, EbP > NTb > Chotab, PTer.
--     (!) These lists are COPIES; refresh them if Dictionarry re-tiers (compare against its 1080p Quality
--     Tier 1-4 formats in Sonarr).
-- (3) Tiers re-spaced so the tie-break bonuses (max +40, plus Remaster/Repack/Internal) stay inside a tier:
--     Tier 01 2600, Tier 02 2450, Tier 03 2300, Tier 04 2150, Tier 05 2000, Tier 06 1900, stuxb 1850,
--     Tier 07 1800. Lowest top encode 1850 (Tier 07 + 1080p 50) still beats the best remux (~1750).

INSERT INTO regular_expressions (name, pattern, regex101_id, description) VALUES
 ('coffee','^(coffee)$',NULL,NULL),('DON','^(DON)$',NULL,NULL),('REBORN','^(REBORN)$',NULL,NULL),('SA89','^(SA89)$',NULL,NULL),('SoLaR','^(SoLaR)$',NULL,NULL),('TeamSyndicate','^(TeamSyndicate)$',NULL,NULL),('ZoroSenpai','^(ZoroSenpai)$',NULL,NULL),('0BSiDiAN','^(0BSiDiAN)$',NULL,NULL),('c0kE','^(c0kE)$',NULL,NULL),('CtrlHD','^(CtrlHD)$',NULL,NULL),('D-Z0N3','^(D-Z0N3)$',NULL,NULL),('EbP','^(EbP)$',NULL,NULL),('Geek','^(Geek)$',NULL,NULL),('HiFi','^(HiFi)$',NULL,NULL),('LoRD','^(LoRD)$',NULL,NULL),('TayTO','^(TayTO)$',NULL,NULL),('VietHD','^(VietHD)$',NULL,NULL),('ZQ','^(ZQ)$',NULL,NULL),('BV','^(BV)$',NULL,NULL),('CRiSC','^(CRiSC)$',NULL,NULL),('decibeL','^(decibeL)$',NULL,NULL),('FoRM','^(FoRM)$',NULL,NULL),('HiDt','^(HiDt)$',NULL,NULL),('HiP','^(HiP)$',NULL,NULL),('iFT','^(iFT)$',NULL,NULL),('SbR','^(SbR)$',NULL,NULL),('Skazhutin','^(Skazhutin)$',NULL,NULL),('WMING','^(WMING)$',NULL,NULL),('BMF','^(BMF)$',NULL,NULL),('de[42]','^(de[42])$',NULL,NULL),('eXterminator','^(eXterminator)$',NULL,NULL),('HDMaNiAcS','^(HDMaNiAcS)$',NULL,NULL),('IDE','^(IDE)$',NULL,NULL),('LolHD','^(LolHD)$',NULL,NULL),('NCmt','^(NCmt)$',NULL,NULL),('NTb','^(NTb)$',NULL,NULL)
ON CONFLICT(name) DO NOTHING;

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('Dict Rank 1 (Norg)','Copy of the Dictionarry 1080p Quality Tier 1 group list, used as a small tie-break inside the TRaSH and Norg encode tiers (1080p Encode (Remux Fallback)).',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('Dict Rank 1 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('Dict Rank 1 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','coffee','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','coffee','coffee');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','DON','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','DON','DON');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','REBORN','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','REBORN','REBORN');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','SA89','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','SA89','SA89');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','SoLaR','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','SoLaR','SoLaR');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','TeamSyndicate','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','TeamSyndicate','TeamSyndicate');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 1 (Norg)','ZoroSenpai','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 1 (Norg)','ZoroSenpai','ZoroSenpai');
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (Remux Fallback)','Dict Rank 1 (Norg)','sonarr',40);

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('Dict Rank 2 (Norg)','Copy of the Dictionarry 1080p Quality Tier 2 group list, used as a small tie-break inside the TRaSH and Norg encode tiers (1080p Encode (Remux Fallback)).',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('Dict Rank 2 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('Dict Rank 2 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','0BSiDiAN','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','0BSiDiAN','0BSiDiAN');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','c0kE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','c0kE','c0kE');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','CtrlHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','CtrlHD','CtrlHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','D-Z0N3','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','D-Z0N3','D-Z0N3');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','EbP','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','EbP','EbP');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','Geek','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','Geek','Geek');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','HiFi','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','HiFi','HiFi');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','LoRD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','LoRD','LoRD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','TayTO','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','TayTO','TayTO');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','VietHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','VietHD','VietHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 2 (Norg)','ZQ','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 2 (Norg)','ZQ','ZQ');
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (Remux Fallback)','Dict Rank 2 (Norg)','sonarr',30);

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('Dict Rank 3 (Norg)','Copy of the Dictionarry 1080p Quality Tier 3 group list, used as a small tie-break inside the TRaSH and Norg encode tiers (1080p Encode (Remux Fallback)).',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('Dict Rank 3 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('Dict Rank 3 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','BV','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','BV','BV');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','CRiSC','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','CRiSC','CRiSC');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','decibeL','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','decibeL','decibeL');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','FoRM','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','FoRM','FoRM');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','HiDt','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','HiDt','HiDt');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','HiP','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','HiP','HiP');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','iFT','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','iFT','iFT');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','SbR','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','SbR','SbR');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','Skazhutin','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','Skazhutin','Skazhutin');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 3 (Norg)','WMING','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 3 (Norg)','WMING','WMING');
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (Remux Fallback)','Dict Rank 3 (Norg)','sonarr',20);

INSERT INTO custom_formats (name, description, include_in_rename) VALUES ('Dict Rank 4 (Norg)','Copy of the Dictionarry 1080p Quality Tier 4 group list, used as a small tie-break inside the TRaSH and Norg encode tiers (1080p Encode (Remux Fallback)).',0);
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','Not 2160p','resolution','sonarr',1,1);
INSERT INTO condition_resolutions (custom_format_name,condition_name,resolution) VALUES ('Dict Rank 4 (Norg)','Not 2160p','2160p');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','BLURAY','source','sonarr',0,1);
INSERT INTO condition_sources (custom_format_name,condition_name,source) VALUES ('Dict Rank 4 (Norg)','BLURAY','bluray');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','BMF','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','BMF','BMF');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','de[42]','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','de[42]','de[42]');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','eXterminator','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','eXterminator','eXterminator');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','HDMaNiAcS','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','HDMaNiAcS','HDMaNiAcS');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','IDE','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','IDE','IDE');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','LolHD','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','LolHD','LolHD');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','NCmt','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','NCmt','NCmt');
INSERT INTO custom_format_conditions (custom_format_name,name,type,arr_type,negate,required) VALUES ('Dict Rank 4 (Norg)','NTb','release_group','sonarr',0,0);
INSERT INTO condition_patterns (custom_format_name,condition_name,regular_expression_name) VALUES ('Dict Rank 4 (Norg)','NTb','NTb');
INSERT INTO quality_profile_custom_formats (quality_profile_name,custom_format_name,arr_type,score) VALUES ('1080p Encode (Remux Fallback)','Dict Rank 4 (Norg)','sonarr',10);

-- DTS bonus off, tiers re-spaced
UPDATE quality_profile_custom_formats SET score=0 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='DTS' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2600 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 01' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2450 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 02' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2300 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 03 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2150 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 04 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=2000 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 05 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1900 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 06 (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1850 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='stuxb (Norg)' AND arr_type='sonarr';
UPDATE quality_profile_custom_formats SET score=1800 WHERE quality_profile_name='1080p Encode (Remux Fallback)' AND custom_format_name='HD Bluray Tier 07 (Norg)' AND arr_type='sonarr';
