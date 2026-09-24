-- 901.norg-local-custom-formats.sql
-- 1:1 import of every hand-built Norg custom format that carries a score in a profile.
-- Two sources: the 92 configarr local-*.json definitions, and 20 formats that live only in
-- Sonarr/Radarr (TRaSH names the PCD renamed or deliberately deleted, e.g. the German/FR set).
-- All are suffixed (Norg): a BARE name always means stock TRaSH.
-- Dual-defined formats become ONE format with per-arr conditions via arr_type.

INSERT INTO regular_expressions (name, pattern) VALUES
  ('AndreMor', '\b(AndreMor)\b'),
  ('EMBER (2)', '\[EMBER\]|-EMBER'),
  ('LostYears (2)', '\[LostYears\]|-LostYears'),
  ('with Audio Description', '\bwith[ ._-]?audio[ ._-]?description\b'),
  ('BTN', '\b(BTN)\b'),
  ('BTN (2)', '^(BTN)$'),
  ('BiOMA (2)', '\b(BiOMA)\b'),
  ('CtrlSD', '^(CtrlSD)$'),
  ('Not Low Channel Count', '(?<!repac)[^0-9][1-4][ .][0-1]|\b(Stereo|Mono)\b'),
  ('Not DV HDR10', '^(?=.*\b(DV|DoVi|Dolby[ .]?V(ision)?)\b)(?=.*\b(HDR(10)?(P(lus)?)?)\b)'),
  ('Not DV HLG', '\b(DV[ .]HLG)\b'),
  ('Not DV SDR', '\b(DV[ .]SDR)\b'),
  ('DarQ', '^(DarQ)$'),
  ('h265', '[h][ ._-]?265|\bHEVC(\b|\d)'),
  ('EDGE2020', '^(EDGE2020)$'),
  ('EGEN', '^(EGEN)$'),
  ('ARK01', '^(ARK01)$'),
  ('BONBON', '^(BONBON)$'),
  ('FRATERNiTY', '^(FRATERNiTY)$'),
  ('FTMVHD', '^(FTMVHD)$'),
  ('HeavyWeight', '^(HeavyWeight)$'),
  ('Psaro', '^(Psaro)$'),
  ('Ads/Watermarks', '\b(Bandix|CZ\d+|EXTREME|GA(Ï|I)A|HMiDiMADRiDi|Hush|KILLERMIX|LiBERTAD|LTa?TM|MONiCO|NEWCINE|R(PZ|ZP)|ShowFR|VERCLAM|ViKi47|Wawa-?(city|mania|porno)?|ZW)\b'),
  ('Bad/False releases', '\b(ACOOL|AlioZ|ASPHiXiAS|AViTECH|AZAZE|Balibalo|BLABLASTREAM|DDLFRENCH(ORG)?|FERVEX|FReeZeR|GHOSTSPiRiT|GHZ|GLaDOS|GZR|HEVCBay|JiHeff|KR4K3N|Matmatha|MKVXTEAM|Monchat|NLX5|NOMAD|NORRIS|PiCKLES|PREUMS|qctimb3rlandqc|ReBoT|ROLLED|SCREEN|SHiFT|SKRiN|TicaDow|Tokushi|Tonyk|TOXIC|TUTUTE|UNiKORN|Zombie)\b'),
  ('DeTAG/ReTAG', '\b((Cpasbien|CPB)|ANONA|AT|bigZT|Boheme|BOL|CINeHD|Cortex91|DOLL4R|Dread[ .-]?Team|Dropse|EZTV([ ._-]re)?|FGT|Firetown|FUN|HDMIDIMADRIDI|JetAnime|L-?O-?L|NewZT|NG|RARBG|STVFRV|SubZero|T9|Time2Watch|TIREXO|Torrent9|WebAnime|YIFY|YTS|ZONE|ZT)\b'),
  ('Other reasons', '\b(AKLHD|ARKRiL|BossBaby|Champion9|Copycomic|CR4ZYTiME|EASPORTS|EliteT|FUNKKY|FZTeam|GOBO2S|HD2|LION|LMPS|LNA3d|MACK4|MeMyl|METALLIKA|MGD|Moorea81|Moviz|Muxman|Mystic|MZC|MZi?SYS|N3TFL1X|NoelMaison|nutella|OMERTA|Papaya|PIKACHU|PULSE|Q7|RELiC|SANCTUAIRE|SHARKS|SP3CTR|Spow|STR4NGE|TeamSuW|TORRiD|TSN999|TVPSLO|Upmix|VATFER|Wakanim|WaNeZt|WINCHESTER|WITA)\b'),
  ('#', '^(4FR)$'),
  ('A', '^(AiR3D|AiRDOCS|AiRFORCE|AiRLiNE|AiRTV|AMB3R|ANMWR|AVON|AYMO|AZR)$'),
  ('B', '^(BANKAi|BAWLS|BiPOLAR|BLACKPANTERS|BODIE|BOOLZ|BRiNK|BTT)$'),
  ('C', '^(CARAPiLS|CiELOS|CiNEMA|CMBHD|CoRa|COUAC|CRYPT0)$'),
  ('D', '^(D4KiD|DEAL|DiEBEX|DUPLI|DUSS)$'),
  ('E (2)', '^(ENJOi|EUBDS)$'),
  ('F', '^(FHD|FiDELiO|FiDO|ForceBleue|FREAMON|FRENCHDEADPOOL2|FRiES|FUTiL|FWDHD)$'),
  ('G', '^(GHOULS|GiMBAP|GLiMMER|Goatlove)$'),
  ('H', '^(HERC|HiggsBoson|HiRoSHiMa|HYBRiS|HyDe)$'),
  ('J', '^(JMT|JoKeR|JUSTICELEAGUE)$'),
  ('K', '^(KAZETV)$'),
  ('L', '^(L0SERNiGHT|LaoZi|LeON|LOFiDEL|LOST|LOWIMDB|LUCKY|LYPSG)$'),
  ('M', '^(MAGiCAL|MANGACiTY|MAXAGAZ|MaxiBeNoul|McNULTY|MELBA|MiND|MORELAND|MUNSTER|MUxHD)$'),
  ('N', '^(N0Z00M|NERDHD|NERO|NrZ|NTK)$'),
  ('O', '^(OBSTACLE|OohLaLa|OOKAMI)$'),
  ('P', '^(PANZeR|PATHECROUTE|Penrose|PHoQUE|PiNKPANTERS|PKPTRS|PRiDEHD|PROPJOE|PURE|PUREWASTEOFBW)$'),
  ('R', '^(ROUGH|RUDE|Ryotox)$'),
  ('S', '^(SAFETY|SASHiMi|SEiGHT|SESKAPiLE|SharpHD|SHEEEiT|SHiNiGAMi(UHD)?|SiGeRiS|SILVIODANTE|SLEEPINGFOREST|SODAPOP|S4LVE|SPINE|SPOiLER|STRINGERBELL|Sunday26th|SUNRiSE)$'),
  ('T', '^(tFR|THENiGHTMAREiNHD|THiNK|THREESOME|TiMELiNE|TSuNaMi)$'),
  ('U', '^(UKDHD|UKDTV|ULSHD|Ulysse|(US)?UNSKiLLED|URY|USURY)$'),
  ('V', '^(VENUE|VFC|VoMiT)$'),
  ('W', '^(Wednesday29th)$'),
  ('Z', '^(ZEST|ZiRCON)$'),
  ('GGEZ', '\b(GGEZ)\b'),
  ('ZeroTwo', '^(ZeroTwo)$'),
  ('ZeroTwo Aliases', '\b(BUTTERCUP|HARTZ02|XiSS|DOGPACK404|PRiNCESSDiANA|DiVA|D02KU|WAREZCX|BiTCHNUGGET)\b'),
  ('TSCC', '^(TSCC)$'),
  ('NIMA4K', '^(NIMA4K)$'),
  ('TVS', '^(TVS)$'),
  ('PXL', '^(PXL)$'),
  ('CNY', '^(CNY)$'),
  ('WeebPinn', '^(WeebPinn)$'),
  ('WalterBishop', '^(WalterBishop)$'),
  ('MULTiPLEX', '^(MULTiPLEX)$'),
  ('SiXTYNiNE', '^(SiXTYNiNE)$'),
  ('Oergel', '^(Oergel)$'),
  ('ABJ', '^(ABJ)$'),
  ('RobertDeNiro', '^(RobertDeNiro)$'),
  ('HQC', '^(HQC)$'),
  ('RDR', '^(RDR)$'),
  ('HDSource', '^(HDSource)$'),
  ('PsO', '^(PsO)$'),
  ('Cancer58', '^(Cancer58)$'),
  ('Tylor.D', '^(Tylor\.D)$'),
  ('1XBET (2)', '^(1XBET)$'),
  ('2dead', '^(2dead)$'),
  ('HELD', '^(HELD)$'),
  ('kala', '^(kala)$'),
  ('POE', '^(POE)$'),
  ('SHOWE', '^(SHOWE)$'),
  ('SHOWEHD', '^(SHOWEHD)$'),
  ('ORCA88', '^(ORCA88)$'),
  ('LuRCH', '^(LuRCH)$'),
  ('N2D2', '^(N2D2)$'),
  ('GETB8', '^(GETB8)$'),
  ('TFARC', '^(TFARC)$'),
  ('Kristallprinz', '^(Kristallprinz)$'),
  ('LAW', '^(LAW)$'),
  ('Pendeti', '^(Pendeti)$'),
  ('OJ', '^(OJ)$'),
  ('PS', '^(PS)$'),
  ('FSX', '^(FSX)$'),
  ('EMVY', '^(EMVY)$'),
  ('ZaidaNulled', '^(ZaidaNulled)$'),
  ('MEGA', '^(MEGA)$'),
  ('MBA', '^(MBA)$'),
  ('FORMBA', '^(FORMBA)$'),
  ('PaZ', '^(PaZ)$'),
  ('Whistler', '^(Whistler)$'),
  ('omikron', '^(omikron)$'),
  ('WOTT', '^(WOTT)$'),
  ('SunDry', '^(SunDry)$'),
  ('PL', '^(PL)$'),
  ('TVARCHiV', '^(TVARCHiV)$'),
  ('P73', '^(P73)$'),
  ('LizardSquad', '^(LizardSquad)$'),
  ('AVTOMAT', '^(AVTOMAT)$'),
  ('iSSEYMiYAKE', '^(iSSEYMiYAKE)$'),
  ('TVP', '^(TVP)$'),
  ('AIDA', '^(AIDA)$'),
  ('UTOPiA', '^(UTOPiA)$'),
  ('FRAGGERS', '^(FRAGGERS)$'),
  ('SD7', '^(SD7)$'),
  ('TVS iTunesHD', '([._-])iTunes(?:HD|SD)?\1.+?-TVS$'),
  ('Jellyfin-Plex', 'Jellyfin-Plex$'),
  ('Double German Tag', '[._-]German[._-].+?[._-]?German$'),
  ('4KCONNECTiON', '^(4KCONNECTiON)$'),
  ('ACED', '^(ACED)$'),
  ('AWARDS', '^(AWARDS)$'),
  ('bi0hazard', '^(bi0hazard)$'),
  ('CDD', '^(CDD)$'),
  ('CDP', '^(CDP)$'),
  ('CONTRiBUTiON', '^(CONTRiBUTiON)$'),
  ('DETAiLS', '^(DETAiLS)$'),
  ('DMPD', '^(DMPD)$'),
  ('ENCOUNTERS', '^(ENCOUNTERS)$'),
  ('ENDSTATiON', '^(ENDSTATiON)$'),
  ('euHD', '^(euHD)$'),
  ('EXCiTED', '^(EXCiTED)$'),
  ('FENDT', '^(FENDT)$'),
  ('FKKTV', '^(FKKTV)$'),
  ('GTVG', '^(GTVG)$'),
  ('HAXE', '^(HAXE)$'),
  ('HDARCHiV', '^(HDARCHiV)$'),
  ('iNTENTiON', '^(iNTENTiON)$'),
  ('JaJunge', '^(JaJunge)$'),
  ('MGE (2)', '^(MGE)$'),
  ('MisFiTS', '^(MisFiTS)$'),
  ('muhHD', '^(muhHD)$'),
  ('OCA', '^(OCA)$'),
  ('OHD', '^(OHD)$'),
  ('PL3X', '^(PL3X)$'),
  ('RiLE', '^(RiLE)$'),
  ('RIPLEY', '^(RIPLEY)$'),
  ('RSG', '^(RSG)$'),
  ('RUBBiSH', '^(RUBBiSH)$'),
  ('RWP', '^(RWP)$'),
  ('SAUERKRAUT', '^(SAUERKRAUT)$'),
  ('STARS', '^(STARS)$'),
  ('TMSF', '^(TMSF)$'),
  ('TV4A', '^(TV4A)$'),
  ('TVNATiON', '^(TVNATiON)$'),
  ('W4K', '^(W4K)$'),
  ('WATCHABLE', '^(WATCHABLE)$'),
  ('WAYNE', '^(WAYNE)$'),
  ('WOMBAT', '^(WOMBAT)$'),
  ('WvF', '^(WvF)$'),
  ('HANDJOB', '^(HANDJOB)$'),
  ('HONE (Sonarr)', '^(HONE|DiscoD|Weasley)$'),
  ('DV HDR10', '^(?=.*\b(DV|DoVi|Dolby[ .]?V(ision)?)\b)(?=.*\b((HDR10(?!(P(lus)?)\b|\+))|(HDR))\b)'),
  ('Not DV HDR10Plus', '^(?=.*\b(DV|DoVi|Dolby[ .]?V(ision)?)\b)(?=.*\b((HDR10(?=(P(lus)?)\b|\+))))'),
  ('HONE (2)', '\b(HONE)\b'),
  ('HONE (3)', '^(HONE|Weasley)$'),
  ('Joy UTR', '\b(Joy|UTR)\b'),
  ('Kallango (2)', '^(Kallango)$'),
  ('LEGi0N', '^(LEGi0N)$'),
  ('MULTi (Radarr)', '\b(MULTi)(\b|\d)'),
  ('MULTi (Sonarr)', '\b(MULTi)(\d|\b)'),
  ('NINJACENTRAL (2)', '\b(NINJACENTRAL)\b'),
  ('NNMClub', '\b(NNMClub)\b'),
  ('NorthKorea', '^(NorthKorea)$'),
  ('Other x265 Groups', '\b(BeiTai|KeepFRDS|Weasley|DiscoD|Kira|D0ctorLew)\b'),
  ('Not HDR10', '\bHDR10(?!\+|Plus)\b'),
  ('Not SDR (2)', '\bSDR(\b|\d)'),
  ('QxR', '\b(Tigole|QxR|Ghost|MONOLITH|Silence|t3nzin|SAMPA|FreeTheFish|RZeroX|afm72|RCVR|Bandi|Bluespots|LION|Natty|r00t|ImE|Garshasp|Celdra)\b'),
  ('QxR Members', '\b(Tigole|qxr|QxR|tigole|Ghost|ghost|MONOLITH|Silence|t3nzin|SAMPA|FreeTheFish|RZeroX|RCVR|Bandi|ImE|afm72|Garshasp|r00t|Panda|Kappa|YOGI|Bluespots|Langbard|Celdra)\b'),
  ('RARBG (2)', '\b(RARBG)\b'),
  ('ROVERS', '^(ROVERS)$'),
  ('RTW', '^(RTW)$'),
  ('TAoE', '\b(TAoE|r0b0t)\b'),
  ('Amazon (2)', '\b(amzn|amazon)\b'),
  ('UTR', '^(UTR)$'),
  ('Vertag', '^(Vertag)$'),
  ('TAoE (2)', '\b(Vyndros)\b'),
  ('WEB-DL', '\b(WEB-DL)\b'),
  ('WRS', '^(WRS)$'),
  ('iVy (Sonarr)', '\b(iVy)\b'),
  ('r00t', '\b(r00t)\b'),
  ('stuxb', '^(stuxb)$');

DELETE FROM condition_patterns WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM condition_sources WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM condition_resolutions WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM condition_languages WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM condition_quality_modifiers WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM custom_format_conditions WHERE custom_format_name = 'hallowed Bluray (Norg)';
DELETE FROM condition_patterns WHERE custom_format_name = 'HONE Bluray (Norg)';
DELETE FROM condition_sources WHERE custom_format_name = 'HONE Bluray (Norg)';
DELETE FROM condition_resolutions WHERE custom_format_name = 'HONE Bluray (Norg)';
DELETE FROM condition_languages WHERE custom_format_name = 'HONE Bluray (Norg)';
DELETE FROM condition_quality_modifiers WHERE custom_format_name = 'HONE Bluray (Norg)';
DELETE FROM custom_format_conditions WHERE custom_format_name = 'HONE Bluray (Norg)';

INSERT INTO custom_formats (name, include_in_rename) VALUES
  ('AndreMor (Norg)', 0),
  ('Anime EMBER (Norg)', 0),
  ('Anime Judas (Norg)', 0),
  ('Anime LostYears (Norg)', 0),
  ('Anime Web Tier 01 (General) (Norg)', 0),
  ('Anime Web Tier 02 (General) (Norg)', 0),
  ('Anime Web Tier 03 (General) (Norg)', 0),
  ('Audio Description (Norg)', 0),
  ('BHDStudio Bluray (Norg)', 0),
  ('BTN (Norg)', 0),
  ('BTN Bluray 1080p (Norg)', 0),
  ('BTN Remux 1080p (Norg)', 0),
  ('BTN SD/720p (Norg)', 0),
  ('BTN WebDL 1080p (Norg)', 0),
  ('BiOMA (Norg)', 0),
  ('Bluray (Norg)', 0),
  ('CMRG (Norg)', 0),
  ('CR - Boost (Norg)', 0),
  ('CRFW (Norg)', 0),
  ('CtrlHD Bluray (Norg)', 0),
  ('CtrlSD SD (Norg)', 0),
  ('DD+ 5.1 (Norg)', 0),
  ('DV (Norg)', 0),
  ('DV SDR (Norg)', 0),
  ('DVD Tier 01 (Norg)', 0),
  ('DarQ (Norg)', 0),
  ('DarQ h265 (Norg)', 0),
  ('Dual Audio (Norg)', 0),
  ('EDGE2020 (Norg)', 0),
  ('EGEN (Norg)', 0),
  ('EPSiLON Remux (Norg)', 0),
  ('FR HD Bluray Tier 01', 0),
  ('FR LQ', 0),
  ('FR Scene Groups', 0),
  ('FastSUB', 0),
  ('Flights (Norg)', 0),
  ('FraMeSToR Remux (Norg)', 0),
  ('GGEZ (Norg)', 0),
  ('German Bluray Tier 01', 0),
  ('German Bluray Tier 02', 0),
  ('German Bluray Tier 03', 0),
  ('German LQ', 0),
  ('German LQ (release title)', 0),
  ('German Scene', 0),
  ('HANDJOB (Norg)', 0),
  ('HONE (Norg)', 0),
  ('HONE DV HDR Web-DL (Norg)', 0),
  ('HONE DV HDR10+ Web-DL (Norg)', 0),
  ('HONE NF (Norg)', 0),
  ('HONE h265 (Norg)', 0),
  ('Joy UTR (Norg)', 0),
  ('Kallango (Norg)', 0),
  ('Kitsune (Norg)', 0),
  ('Kitsune Bluray (Norg)', 0),
  ('LEGi0N (Norg)', 0),
  ('LostYears (Norg)', 0),
  ('Multi-French (Norg)', 1),
  ('NINJACENTRAL (Norg)', 0),
  ('NNMClub (Norg)', 0),
  ('NorthKorea (Norg)', 0),
  ('Other x265 Groups (Norg)', 0),
  ('PQ (Norg)', 0),
  ('QxR Members (Norg)', 0),
  ('RARBG (Norg)', 0),
  ('ROVERS (Norg)', 0),
  ('RTW (Norg)', 0),
  ('RandomBytes UHD Bluray (Norg)', 0),
  ('Remux Tier 03 (Norg)', 0),
  ('Remux Tier 04 (Norg)', 0),
  ('SPHD (Norg)', 0),
  ('TAoE (Norg)', 0),
  ('Tigole (Norg)', 0),
  ('UHD Bluray Tier 04 (Norg)', 0),
  ('UHD Streaming Cut (Norg)', 0),
  ('UTR (Norg)', 0),
  ('Vertag (Norg)', 0),
  ('Vyndros (Norg)', 0),
  ('W4NK3R (Norg)', 0),
  ('WEB-DL (Norg)', 0),
  ('WEBDL (Norg)', 0),
  ('WEBRip (Norg)', 0),
  ('WRS (Norg)', 0),
  ('h265 (Norg)', 0),
  ('iVy (Norg)', 0),
  ('r00t (Norg)', 0),
  ('r00t DV HDR (Norg)', 0),
  ('r00t DV HDR10+ (Norg)', 0),
  ('stuxb (Norg)', 0);

INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('AndreMor (Norg)', 'AndreMor', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('AndreMor (Norg)', 'AndreMor', 'AndreMor');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime EMBER (Norg)', 'EMBER', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime EMBER (Norg)', 'EMBER', 'EMBER (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Judas (Norg)', 'Judas', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Judas (Norg)', 'Judas', 'Judas');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime LostYears (Norg)', 'LostYears', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime LostYears (Norg)', 'LostYears', 'LostYears (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEB', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 01 (General) (Norg)', 'WEB', 'television');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'HONE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 01 (General) (Norg)', 'HONE', 'HONE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'FLUX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 01 (General) (Norg)', 'FLUX', 'FLUX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'NTb', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 01 (General) (Norg)', 'NTb', 'NTb');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 01 (General) (Norg)', 'APEX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 01 (General) (Norg)', 'APEX', 'APEX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEB', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 02 (General) (Norg)', 'WEB', 'television');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 02 (General) (Norg)', 'dB', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 02 (General) (Norg)', 'dB', 'dB');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 02 (General) (Norg)', 'SMURF', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 02 (General) (Norg)', 'SMURF', 'SMURF');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEB', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Anime Web Tier 03 (General) (Norg)', 'WEB', 'television');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Anime Web Tier 03 (General) (Norg)', 'HHWEB', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Anime Web Tier 03 (General) (Norg)', 'HHWEB', 'HHWEB');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Audio Description (Norg)', 'with Audio Description', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Audio Description (Norg)', 'with Audio Description', 'with Audio Description');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BHDStudio Bluray (Norg)', 'BHDStudio', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BHDStudio Bluray (Norg)', 'BHDStudio', 'BHDStudio');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BHDStudio Bluray (Norg)', 'BLURAY', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('BHDStudio Bluray (Norg)', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN (Norg)', 'BTN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BTN (Norg)', 'BTN', 'BTN');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Bluray 1080p (Norg)', 'BTN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BTN Bluray 1080p (Norg)', 'BTN', 'BTN (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Bluray 1080p (Norg)', '1080p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('BTN Bluray 1080p (Norg)', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Bluray 1080p (Norg)', 'BLURAY', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('BTN Bluray 1080p (Norg)', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Remux 1080p (Norg)', 'BTN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BTN Remux 1080p (Norg)', 'BTN', 'BTN (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Remux 1080p (Norg)', '1080p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('BTN Remux 1080p (Norg)', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN Remux 1080p (Norg)', 'Remux', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('BTN Remux 1080p (Norg)', 'Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN SD/720p (Norg)', 'BTN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BTN SD/720p (Norg)', 'BTN', 'BTN (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN SD/720p (Norg)', '720p', 'resolution', 'sonarr', 0, 0);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('BTN SD/720p (Norg)', '720p', '720p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN SD/720p (Norg)', '480p', 'resolution', 'sonarr', 0, 0);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('BTN SD/720p (Norg)', '480p', '480p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN WebDL 1080p (Norg)', 'BTN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BTN WebDL 1080p (Norg)', 'BTN', 'BTN (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN WebDL 1080p (Norg)', '1080p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('BTN WebDL 1080p (Norg)', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN WebDL 1080p (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('BTN WebDL 1080p (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BTN WebDL 1080p (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('BTN WebDL 1080p (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('BiOMA (Norg)', 'BiOMA', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('BiOMA (Norg)', 'BiOMA', 'BiOMA (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Bluray (Norg)', 'Bluray', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Bluray (Norg)', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CMRG (Norg)', 'CMRG', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CMRG (Norg)', 'CMRG', 'CMRG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CR - Boost (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CR - Boost (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CR - Boost (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CR - Boost (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CR - Boost (Norg)', 'WEB', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CR - Boost (Norg)', 'WEB', 'television');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CR - Boost (Norg)', 'Crunchyroll', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CR - Boost (Norg)', 'Crunchyroll', 'Crunchyroll');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CRFW (Norg)', 'CRFW', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CRFW (Norg)', 'CRFW', 'CRFW');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlHD Bluray (Norg)', 'CtrlHD', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CtrlHD Bluray (Norg)', 'CtrlHD', 'CtrlHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlHD Bluray (Norg)', 'BLURAY', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CtrlHD Bluray (Norg)', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlHD Bluray (Norg)', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('CtrlHD Bluray (Norg)', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlHD Bluray (Norg)', 'Not 2160p', 'resolution', 'sonarr', 1, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('CtrlHD Bluray (Norg)', 'Not 2160p', '2160p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlSD SD (Norg)', 'CtrlSD', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('CtrlSD SD (Norg)', 'CtrlSD', 'CtrlSD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('CtrlSD SD (Norg)', '480p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('CtrlSD SD (Norg)', '480p', '480p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DD+ 5.1 (Norg)', '5.1 Surround', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DD+ 5.1 (Norg)', '5.1 Surround', '5.1 Surround');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DD+ 5.1 (Norg)', 'Not 7.1 Surround', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DD+ 5.1 (Norg)', 'Not 7.1 Surround', 'Not 7.1 Surround');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DD+ 5.1 (Norg)', 'Not Low Channel Count', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DD+ 5.1 (Norg)', 'Not Low Channel Count', 'Not Low Channel Count');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DD+ 5.1 (Norg)', 'DD+', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DD+ 5.1 (Norg)', 'DD+', 'Dolby Digital Plus');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV (Norg)', 'DV', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV (Norg)', 'DV', 'Dolby Vision');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV (Norg)', 'Not DV HDR10', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV (Norg)', 'Not DV HDR10', 'Not DV HDR10');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV (Norg)', 'Not DV HLG', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV (Norg)', 'Not DV SDR', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV (Norg)', 'Not DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV SDR (Norg)', 'DV SDR', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV SDR (Norg)', 'DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV SDR (Norg)', 'Not DV HDR10', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV SDR (Norg)', 'Not DV HDR10', 'Not DV HDR10');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DV SDR (Norg)', 'Not DV HLG', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DV SDR (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'ABBiE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'ABBiE', 'ABBiE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'AJP69', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'AJP69', 'AJP69');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'APEX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'APEX', 'APEX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'CasStudio', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'CasStudio', 'CasStudio');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'CRFW', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'CRFW', 'CRFW');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'CtrlHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'CtrlHD', 'CtrlHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'FLUX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'FLUX', 'FLUX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'HONE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'HONE', 'HONE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'KiNGS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'KiNGS', 'KiNGS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'monkee', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'monkee', 'monkee');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'NOSiViD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'NOSiViD', 'NOSiViD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'NTb', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'NTb', 'NTb');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'NTG', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'NTG', 'NTG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'QOQ', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'QOQ', 'QOQ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'RTN', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'RTN', 'RTN');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'SiC', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'SiC', 'SiC (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'T6D', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'T6D', 'T6D');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'TOMMY', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'TOMMY', 'TOMMY');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'ViSUM', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DVD Tier 01 (Norg)', 'ViSUM', 'ViSUM');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DVD Tier 01 (Norg)', 'DVD', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('DVD Tier 01 (Norg)', 'DVD', 'dvd');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DarQ (Norg)', 'DarQ', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DarQ (Norg)', 'DarQ', 'DarQ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DarQ h265 (Norg)', 'DarQ', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DarQ h265 (Norg)', 'DarQ', 'DarQ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('DarQ h265 (Norg)', 'h265', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('DarQ h265 (Norg)', 'h265', 'h265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Dual Audio', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Dual Audio (Norg)', 'Dual Audio', 'Dual Audio');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Not Single Language Only', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Dual Audio (Norg)', 'Not Single Language Only', 'Not Single Language Only');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Japanese Language', 'language', 'sonarr', 0, 0);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Dual Audio (Norg)', 'Japanese Language', 'Japanese', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Chinese Language', 'language', 'sonarr', 0, 0);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Dual Audio (Norg)', 'Chinese Language', 'Chinese', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Korean Language', 'language', 'sonarr', 0, 0);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Dual Audio (Norg)', 'Korean Language', 'Korean', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'Spanish', 'language', 'sonarr', 0, 0);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Dual Audio (Norg)', 'Spanish', 'Spanish', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Dual Audio (Norg)', 'French', 'language', 'sonarr', 0, 0);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Dual Audio (Norg)', 'French', 'French', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('EDGE2020 (Norg)', 'EDGE2020', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('EDGE2020 (Norg)', 'EDGE2020', 'EDGE2020');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('EGEN (Norg)', 'EGEN', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('EGEN (Norg)', 'EGEN', 'EGEN');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('EPSiLON Remux (Norg)', 'Remux', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('EPSiLON Remux (Norg)', 'Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('EPSiLON Remux (Norg)', 'EPSiLON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('EPSiLON Remux (Norg)', 'EPSiLON', 'EPSiLON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'BLURAY', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('FR HD Bluray Tier 01', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('FR HD Bluray Tier 01', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'Not 2160p', 'resolution', 'sonarr', 1, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('FR HD Bluray Tier 01', 'Not 2160p', '2160p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'ARK01', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'ARK01', 'ARK01');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'BONBON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'BONBON', 'BONBON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'FRATERNiTY', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'FRATERNiTY', 'FRATERNiTY');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'FTMVHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'FTMVHD', 'FTMVHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'HeavyWeight', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'HeavyWeight', 'HeavyWeight');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR HD Bluray Tier 01', 'Psaro', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR HD Bluray Tier 01', 'Psaro', 'Psaro');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR LQ', 'Ads/Watermarks', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR LQ', 'Ads/Watermarks', 'Ads/Watermarks');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR LQ', 'Bad/False releases', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR LQ', 'Bad/False releases', 'Bad/False releases');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR LQ', 'DeTAG/ReTAG', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR LQ', 'DeTAG/ReTAG', 'DeTAG/ReTAG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR LQ', 'Other reasons', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR LQ', 'Other reasons', 'Other reasons');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', '#', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', '#', '#');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'A', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'A', 'A');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'B', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'B', 'B');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'C', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'C', 'C');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'D', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'D', 'D');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'E', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'E', 'E (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'F', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'F', 'F');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'G', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'G', 'G');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'H', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'H', 'H');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'J', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'J', 'J');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'K', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'K', 'K');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'L', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'L', 'L');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'M', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'M', 'M');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'N', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'N', 'N');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'O', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'O', 'O');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'P', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'P', 'P');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'R', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'R', 'R');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'S', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'S', 'S');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'T', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'T', 'T');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'U', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'U', 'U');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'V', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'V', 'V');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'W', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'W', 'W');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FR Scene Groups', 'Z', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FR Scene Groups', 'Z', 'Z');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FastSUB', 'FastSUB', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FastSUB', 'FastSUB', 'FastSUB');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Flights (Norg)', 'Flights', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Flights (Norg)', 'Flights', 'Flights');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FraMeSToR Remux (Norg)', 'Remux', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('FraMeSToR Remux (Norg)', 'Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('FraMeSToR Remux (Norg)', 'FraMeSToR', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('FraMeSToR Remux (Norg)', 'FraMeSToR', 'FraMeSToR (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('GGEZ (Norg)', 'GGEZ', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('GGEZ (Norg)', 'GGEZ', 'GGEZ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'ZeroTwo', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'ZeroTwo', 'ZeroTwo');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'ZeroTwo Aliases', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'ZeroTwo Aliases', 'ZeroTwo Aliases');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'TSCC', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'TSCC', 'TSCC');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'TvR', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'TvR', 'TvR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'NIMA4K', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'NIMA4K', 'NIMA4K');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'TVS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'TVS', 'TVS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'PXL', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'PXL', 'PXL');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'CNY', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'CNY', 'CNY');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'WeebPinn', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'WeebPinn', 'WeebPinn');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'WalterBishop', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 01', 'WalterBishop', 'WalterBishop');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'Bluray', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 01', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 01', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 01', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'VECTOR', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 02', 'VECTOR', 'VECTOR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'MULTiPLEX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 02', 'MULTiPLEX', 'MULTiPLEX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'SiXTYNiNE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 02', 'SiXTYNiNE', 'SiXTYNiNE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'Oergel', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 02', 'Oergel', 'Oergel');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'ABJ', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 02', 'ABJ', 'ABJ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'Bluray', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 02', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 02', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 02', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'RobertDeNiro', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 03', 'RobertDeNiro', 'RobertDeNiro');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'HQC', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 03', 'HQC', 'HQC');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'RDR', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 03', 'RDR', 'RDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'HDSource', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Bluray Tier 03', 'HDSource', 'HDSource');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'Bluray', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 03', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Bluray Tier 03', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('German Bluray Tier 03', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'PsO', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'PsO', 'PsO');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'Cancer58', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'Cancer58', 'Cancer58');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'Tylor.D', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'Tylor.D', 'Tylor.D');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', '1XBET', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', '1XBET', '1XBET (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', '2dead', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', '2dead', '2dead');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'HELD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'HELD', 'HELD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'kala', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'kala', 'kala');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'POE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'POE', 'POE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'SHOWE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'SHOWE', 'SHOWE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'SHOWEHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'SHOWEHD', 'SHOWEHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'ORCA88', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'ORCA88', 'ORCA88');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'LuRCH', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'LuRCH', 'LuRCH');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'N2D2', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'N2D2', 'N2D2');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'GETB8', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'GETB8', 'GETB8');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'TFARC', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'TFARC', 'TFARC');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'Kristallprinz', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'Kristallprinz', 'Kristallprinz');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'LAW', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'LAW', 'LAW');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'CTFOH', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'CTFOH', 'CTFOH');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'Pendeti', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'Pendeti', 'Pendeti');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'OJ', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'OJ', 'OJ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'PS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'PS', 'PS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'FSX', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'FSX', 'FSX');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'EMVY', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'EMVY', 'EMVY');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'ZaidaNulled', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'ZaidaNulled', 'ZaidaNulled');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'MEGA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'MEGA', 'MEGA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'MBA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'MBA', 'MBA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'FORMBA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'FORMBA', 'FORMBA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'PaZ', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'PaZ', 'PaZ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'Whistler', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'Whistler', 'Whistler');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'omikron', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'omikron', 'omikron');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'WOTT', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'WOTT', 'WOTT');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'SunDry', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'SunDry', 'SunDry');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'PL', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'PL', 'PL');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'TVARCHiV', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'TVARCHiV', 'TVARCHiV');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'P73', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'P73', 'P73');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'LizardSquad', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'LizardSquad', 'LizardSquad');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'AVTOMAT', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'AVTOMAT', 'AVTOMAT');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'iSSEYMiYAKE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'iSSEYMiYAKE', 'iSSEYMiYAKE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'TVP', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'TVP', 'TVP');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'AIDA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'AIDA', 'AIDA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'UTOPiA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'UTOPiA', 'UTOPiA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'FRAGGERS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'FRAGGERS', 'FRAGGERS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ', 'SD7', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ', 'SD7', 'SD7');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ (release title)', 'TVS iTunesHD', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ (release title)', 'TVS iTunesHD', 'TVS iTunesHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ (release title)', 'Jellyfin-Plex', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ (release title)', 'Jellyfin-Plex', 'Jellyfin-Plex');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German LQ (release title)', 'Double German Tag', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German LQ (release title)', 'Double German Tag', 'Double German Tag');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', '4KCONNECTiON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', '4KCONNECTiON', '4KCONNECTiON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'ACED', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'ACED', 'ACED');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'AWARDS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'AWARDS', 'AWARDS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'bi0hazard', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'bi0hazard', 'bi0hazard');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'CDD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'CDD', 'CDD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'CDP', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'CDP', 'CDP');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'CONTRiBUTiON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'CONTRiBUTiON', 'CONTRiBUTiON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'DETAiLS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'DETAiLS', 'DETAiLS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'DMPD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'DMPD', 'DMPD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'ENCOUNTERS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'ENCOUNTERS', 'ENCOUNTERS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'ENDSTATiON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'ENDSTATiON', 'ENDSTATiON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'euHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'euHD', 'euHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'EXCiTED', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'EXCiTED', 'EXCiTED');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'FENDT', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'FENDT', 'FENDT');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'FKKTV', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'FKKTV', 'FKKTV');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'GTVG', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'GTVG', 'GTVG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'HAXE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'HAXE', 'HAXE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'HDARCHiV', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'HDARCHiV', 'HDARCHiV');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'iNTENTiON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'iNTENTiON', 'iNTENTiON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'JaJunge', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'JaJunge', 'JaJunge');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'MGE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'MGE', 'MGE (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'MisFiTS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'MisFiTS', 'MisFiTS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'muhHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'muhHD', 'muhHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'OCA', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'OCA', 'OCA');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'OHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'OHD', 'OHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'PL3X', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'PL3X', 'PL3X');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'RiLE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'RiLE', 'RiLE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'RIPLEY', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'RIPLEY', 'RIPLEY');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'RSG', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'RSG', 'RSG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'RUBBiSH', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'RUBBiSH', 'RUBBiSH');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'RWP', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'RWP', 'RWP');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'SAUERKRAUT', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'SAUERKRAUT', 'SAUERKRAUT');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'STARS', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'STARS', 'STARS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'TMSF', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'TMSF', 'TMSF');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'TV4A', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'TV4A', 'TV4A');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'TVNATiON', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'TVNATiON', 'TVNATiON');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'W4K', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'W4K', 'W4K');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'WATCHABLE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'WATCHABLE', 'WATCHABLE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'WAYNE', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'WAYNE', 'WAYNE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'WOMBAT', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'WOMBAT', 'WOMBAT');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('German Scene', 'WvF', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('German Scene', 'WvF', 'WvF');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HANDJOB (Norg)', 'HANDJOB', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HANDJOB (Norg)', 'HANDJOB', 'HANDJOB');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE (Norg)', 'HONE (Radarr)', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE (Norg)', 'HONE (Radarr)', 'HONE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE (Norg)', 'HONE (Sonarr)', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE (Norg)', 'HONE (Sonarr)', 'HONE (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE Bluray (Norg)', 'BLURAY', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE Bluray (Norg)', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE Bluray (Norg)', 'HONE', 'release_group', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE Bluray (Norg)', 'HONE', 'HONE (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE Bluray (Norg)', 'Bluray', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE Bluray (Norg)', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'DV HDR10', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR Web-DL (Norg)', 'DV HDR10', 'DV HDR10');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV HDR10Plus', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV HDR10Plus', 'Not DV HDR10Plus');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV HLG', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV SDR', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR Web-DL (Norg)', 'Not DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'HONE', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR Web-DL (Norg)', 'HONE', 'HONE (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR Web-DL (Norg)', 'WEB-DL', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE DV HDR Web-DL (Norg)', 'WEB-DL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'DV HDR10Plus', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'DV HDR10Plus', 'Not DV HDR10Plus');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'Not DV HLG', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'Not DV SDR', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'Not DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'HONE', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'HONE', 'HONE (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'WEB-DL', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE DV HDR10+ Web-DL (Norg)', 'WEB-DL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE NF (Norg)', 'Netflix', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE NF (Norg)', 'Netflix', 'Netflix');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE NF (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE NF (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE NF (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('HONE NF (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE NF (Norg)', 'HONE', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE NF (Norg)', 'HONE', 'HONE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE h265 (Norg)', 'HONE', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE h265 (Norg)', 'HONE', 'HONE (3)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('HONE h265 (Norg)', 'h265', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('HONE h265 (Norg)', 'h265', 'h265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Joy UTR (Norg)', 'Joy UTR', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Joy UTR (Norg)', 'Joy UTR', 'Joy UTR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Kallango (Norg)', 'Kallango', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Kallango (Norg)', 'Kallango', 'Kallango (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Kitsune (Norg)', 'Kitsune', 'release_group', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Kitsune (Norg)', 'Kitsune', 'Kitsune (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Kitsune Bluray (Norg)', 'Kitsune', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Kitsune Bluray (Norg)', 'Kitsune', 'Kitsune (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Kitsune Bluray (Norg)', 'Bluray', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Kitsune Bluray (Norg)', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('LEGi0N (Norg)', 'LEGi0N', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LEGi0N (Norg)', 'LEGi0N', 'LEGi0N');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('LostYears (Norg)', 'LostYears', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('LostYears (Norg)', 'LostYears', 'LostYears');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Multi-French (Norg)', 'MULTi (Radarr)', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Multi-French (Norg)', 'MULTi (Radarr)', 'MULTi (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Multi-French (Norg)', 'MULTi (Sonarr)', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Multi-French (Norg)', 'MULTi (Sonarr)', 'MULTi (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Multi-French (Norg)', 'Original Audio', 'language', 'all', 0, 1);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Multi-French (Norg)', 'Original Audio', 'Original', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Multi-French (Norg)', 'French Audio', 'language', 'all', 0, 1);
INSERT INTO condition_languages (custom_format_name, condition_name, language_name, except_language) VALUES ('Multi-French (Norg)', 'French Audio', 'French', 0);
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('NINJACENTRAL (Norg)', 'NINJACENTRAL', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('NINJACENTRAL (Norg)', 'NINJACENTRAL', 'NINJACENTRAL (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('NNMClub (Norg)', 'NNMClub', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('NNMClub (Norg)', 'NNMClub', 'NNMClub');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('NorthKorea (Norg)', 'NorthKorea', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('NorthKorea (Norg)', 'NorthKorea', 'NorthKorea');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Other x265 Groups (Norg)', 'Other x265 Groups', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Other x265 Groups (Norg)', 'Other x265 Groups', 'Other x265 Groups');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'PQ', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'PQ', 'PQ');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'Not DV', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'Not DV', 'Dolby Vision');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'Not HDR10', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'Not HDR10', 'Not HDR10');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'Not HDR10+', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'Not HDR10+', 'HDR10+ (GDH)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'Not HLG', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'Not HLG', 'HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('PQ (Norg)', 'Not SDR', 'release_title', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('PQ (Norg)', 'Not SDR', 'Not SDR (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('QxR Members (Norg)', 'QxR', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('QxR Members (Norg)', 'QxR', 'QxR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('QxR Members (Norg)', 'QxR Members', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('QxR Members (Norg)', 'QxR Members', 'QxR Members');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RARBG (Norg)', 'RARBG', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('RARBG (Norg)', 'RARBG', 'RARBG (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('ROVERS (Norg)', 'ROVERS', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('ROVERS (Norg)', 'ROVERS', 'ROVERS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RTW (Norg)', 'RTW', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('RTW (Norg)', 'RTW', 'RTW');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RandomBytes UHD Bluray (Norg)', 'RandomBytes', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('RandomBytes UHD Bluray (Norg)', 'RandomBytes', 'RandomBytes');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RandomBytes UHD Bluray (Norg)', 'BLURAY', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('RandomBytes UHD Bluray (Norg)', 'BLURAY', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RandomBytes UHD Bluray (Norg)', 'Not REMUX', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('RandomBytes UHD Bluray (Norg)', 'Not REMUX', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('RandomBytes UHD Bluray (Norg)', '2160p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('RandomBytes UHD Bluray (Norg)', '2160p', '2160p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Remux Tier 03 (Norg)', 'Remux', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Remux Tier 03 (Norg)', 'Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Remux Tier 03 (Norg)', 'Chotab', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Remux Tier 03 (Norg)', 'Chotab', 'Chotab');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Remux Tier 04 (Norg)', 'Remux', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Remux Tier 04 (Norg)', 'Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Remux Tier 04 (Norg)', 'NTb', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Remux Tier 04 (Norg)', 'NTb', 'NTb');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('SPHD (Norg)', 'SPHD', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('SPHD (Norg)', 'SPHD', 'SPHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('TAoE (Norg)', 'TAoE', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('TAoE (Norg)', 'TAoE', 'TAoE');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Tigole (Norg)', 'Tigole', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Tigole (Norg)', 'Tigole', 'Tigole');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Bluray Tier 04 (Norg)', 'SPHD', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UHD Bluray Tier 04 (Norg)', 'SPHD', 'SPHD');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Bluray Tier 04 (Norg)', 'WEBDV', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UHD Bluray Tier 04 (Norg)', 'WEBDV', 'WEBDV');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', 'Amazon', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UHD Streaming Cut (Norg)', 'Amazon', 'Amazon (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', 'HBO Max', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UHD Streaming Cut (Norg)', 'HBO Max', 'HBO Max');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', 'Stan', 'release_title', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UHD Streaming Cut (Norg)', 'Stan', 'Stan');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', 'WEBDL', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('UHD Streaming Cut (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', 'WEBRIP', 'source', 'sonarr', 0, 0);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('UHD Streaming Cut (Norg)', 'WEBRIP', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UHD Streaming Cut (Norg)', '2160p', 'resolution', 'sonarr', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('UHD Streaming Cut (Norg)', '2160p', '2160p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('UTR (Norg)', 'UTR', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('UTR (Norg)', 'UTR', 'UTR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Vertag (Norg)', 'Vertag', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Vertag (Norg)', 'Vertag', 'Vertag');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Vyndros (Norg)', 'TAoE', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Vyndros (Norg)', 'TAoE', 'TAoE (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Vyndros (Norg)', 'Vyndros', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Vyndros (Norg)', 'Vyndros', 'TAoE (2)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('W4NK3R (Norg)', 'W4NK3R', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('W4NK3R (Norg)', 'W4NK3R', 'W4NK3R');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('WEB-DL (Norg)', 'WEB-DL', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WEB-DL (Norg)', 'WEB-DL', 'WEB-DL');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('WEBDL (Norg)', 'WEBDL', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('WEBDL (Norg)', 'WEBDL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('WEBRip (Norg)', 'WEBRip (Radarr)', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('WEBRip (Norg)', 'WEBRip (Radarr)', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('WEBRip (Norg)', 'WEBRip (Sonarr)', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('WEBRip (Norg)', 'WEBRip (Sonarr)', 'webrip');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('WRS (Norg)', 'WRS', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('WRS (Norg)', 'WRS', 'WRS');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('h265 (Norg)', 'h265', 'release_title', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('h265 (Norg)', 'h265', 'h265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('h265 (Norg)', 'Not Remux', 'source', 'sonarr', 1, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('h265 (Norg)', 'Not Remux', 'bluray_raw');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('hallowed Bluray (Norg)', 'hallowed (Radarr)', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('hallowed Bluray (Norg)', 'hallowed (Radarr)', 'hallowed');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('hallowed Bluray (Norg)', 'BLURAY (Radarr)', 'source', 'radarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('hallowed Bluray (Norg)', 'BLURAY (Radarr)', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('hallowed Bluray (Norg)', 'BLURAY (Sonarr)', 'source', 'sonarr', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('hallowed Bluray (Norg)', 'BLURAY (Sonarr)', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('hallowed Bluray (Norg)', 'hallowed (Sonarr)', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('hallowed Bluray (Norg)', 'hallowed (Sonarr)', 'hallowed');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('iVy (Norg)', 'iVy (Radarr)', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('iVy (Norg)', 'iVy (Radarr)', 'iVy');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('iVy (Norg)', 'iVy (Sonarr)', 'release_group', 'sonarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('iVy (Norg)', 'iVy (Sonarr)', 'iVy (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t (Norg)', 'r00t', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t (Norg)', 'r00t', 'r00t');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR (Norg)', 'DV HDR10', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR (Norg)', 'DV HDR10', 'DV HDR10');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR (Norg)', 'Not DV HDR10Plus', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR (Norg)', 'Not DV HDR10Plus', 'Not DV HDR10Plus');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR (Norg)', 'Not DV HLG', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR (Norg)', 'Not DV SDR', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR (Norg)', 'Not DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR (Norg)', 'r00t', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR (Norg)', 'r00t', 'r00t');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR10+ (Norg)', 'DV HDR10Plus', 'release_title', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR10+ (Norg)', 'DV HDR10Plus', 'Not DV HDR10Plus');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR10+ (Norg)', 'Not DV HLG', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR10+ (Norg)', 'Not DV HLG', 'Not DV HLG');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR10+ (Norg)', 'Not DV SDR', 'release_title', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR10+ (Norg)', 'Not DV SDR', 'Not DV SDR');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('r00t DV HDR10+ (Norg)', 'r00t', 'release_group', 'radarr', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('r00t DV HDR10+ (Norg)', 'r00t', 'r00t');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('stuxb (Norg)', 'stuxb', 'release_group', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('stuxb (Norg)', 'stuxb', 'stuxb');

-- Descriptions, matching the upstream convention: a bold name, then the detail.
UPDATE custom_formats SET description = '**AndreMor**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(AndreMor)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'AndreMor (Norg)';
UPDATE custom_formats SET description = '**Anime EMBER**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime EMBER (Norg)';
UPDATE custom_formats SET description = '**Anime Judas**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime Judas (Norg)';
UPDATE custom_formats SET description = '**Anime LostYears**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime LostYears (Norg)';
UPDATE custom_formats SET description = '**Anime Web Tier 01 (General)**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `APEX|PAXA|PEXA|XEPA`, `FLUX`, `HONE`, `NTb`
- Source: web_dl, webrip, television

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime Web Tier 01 (General) (Norg)';
UPDATE custom_formats SET description = '**Anime Web Tier 02 (General)**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `dB`, `SMURF`
- Source: web_dl, webrip, television

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime Web Tier 02 (General) (Norg)';
UPDATE custom_formats SET description = '**Anime Web Tier 03 (General)**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `HHWEB`
- Source: web_dl, webrip, television

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Anime Web Tier 03 (General) (Norg)';
UPDATE custom_formats SET description = '**Audio Description**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Audio Description (Norg)';
UPDATE custom_formats SET description = '**BHDStudio Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `BHDStudio`
- Source: bluray

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BHDStudio Bluray (Norg)';
UPDATE custom_formats SET description = '**BTN**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(BTN)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BTN (Norg)';
UPDATE custom_formats SET description = '**BTN Bluray 1080p**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `BTN`
- Source: bluray
- Resolution: 1080p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BTN Bluray 1080p (Norg)';
UPDATE custom_formats SET description = '**BTN Remux 1080p**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `BTN`
- Source: bluray_raw
- Resolution: 1080p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BTN Remux 1080p (Norg)';
UPDATE custom_formats SET description = '**BTN SD/720p**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `BTN`
- Resolution: 720p, 480p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BTN SD/720p (Norg)';
UPDATE custom_formats SET description = '**BTN WebDL 1080p**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `BTN`
- Source: web_dl, webrip
- Resolution: 1080p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BTN WebDL 1080p (Norg)';
UPDATE custom_formats SET description = '**BiOMA**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(BiOMA)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'BiOMA (Norg)';
UPDATE custom_formats SET description = '**Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Source: bluray

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Bluray (Norg)';
UPDATE custom_formats SET description = '**CMRG**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `CMRG`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'CMRG (Norg)';
UPDATE custom_formats SET description = '**CR - Boost**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern
- Source: web_dl, webrip, television

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'CR - Boost (Norg)';
UPDATE custom_formats SET description = '**CRFW**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `CRFW`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'CRFW (Norg)';
UPDATE custom_formats SET description = '**CtrlHD Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `CtrlHD`
- Source: bluray, not bluray_raw
- Resolution: not 2160p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'CtrlHD Bluray (Norg)';
UPDATE custom_formats SET description = '**CtrlSD SD**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `CtrlSD`
- Resolution: 480p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'CtrlSD SD (Norg)';
UPDATE custom_formats SET description = '**DD+ 5.1**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 4 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DD+ 5.1 (Norg)';
UPDATE custom_formats SET description = '**DV**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 4 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DV (Norg)';
UPDATE custom_formats SET description = '**DV SDR**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 3 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DV SDR (Norg)';
UPDATE custom_formats SET description = '**DVD Tier 01**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `ABBiE`, `AJP69`, `APEX|PAXA|PEXA|XEPA`, `CasStudio`, `CRFW`, `CtrlHD`, `FLUX`, `HONE`, `KiNGS`, `monkee`, `NOSiViD`, `NTb`, `NTG`, `QOQ`, `RTN`, `SiC`, `T6D`, `TOMMY`, `ViSUM`
- Source: dvd

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DVD Tier 01 (Norg)';
UPDATE custom_formats SET description = '**DarQ**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `DarQ`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DarQ (Norg)';
UPDATE custom_formats SET description = '**DarQ h265**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `DarQ`
- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'DarQ h265 (Norg)';
UPDATE custom_formats SET description = '**Dual Audio**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 2 patterns
- Language: Japanese, Chinese, Korean, Spanish, French

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Dual Audio (Norg)';
UPDATE custom_formats SET description = '**EDGE2020**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `EDGE2020`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'EDGE2020 (Norg)';
UPDATE custom_formats SET description = '**EGEN**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `EGEN`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'EGEN (Norg)';
UPDATE custom_formats SET description = '**EPSiLON Remux**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `EPSiLON`
- Source: bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'EPSiLON Remux (Norg)';
UPDATE custom_formats SET description = '**FR HD Bluray Tier 01**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `ARK01`, `BONBON`, `FRATERNiTY`, `FTMVHD`, `HeavyWeight`, `Psaro`
- Source: bluray, not bluray_raw
- Resolution: not 2160p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'FR HD Bluray Tier 01';
UPDATE custom_formats SET description = '**FR LQ**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `\b((Cpasbien|CPB)|ANONA|AT|bigZT|Boheme|BOL|CINeHD|Cortex91|DOLL4R|Dread[ .-]?Team|Dropse|EZTV([ ._-]re)?|FGT|Firetown|FUN|HDMIDIMADRIDI|JetAnime|L-?O-?L|NewZT|NG|RARBG|STVFRV|SubZero|T9|Time2Watch|TIREXO|Torrent9|WebAnime|YIFY|YTS|ZONE|ZT)\b`, `\b(ACOOL|AlioZ|ASPHiXiAS|AViTECH|AZAZE|Balibalo|BLABLASTREAM|DDLFRENCH(ORG)?|FERVEX|FReeZeR|GHOSTSPiRiT|GHZ|GLaDOS|GZR|HEVCBay|JiHeff|KR4K3N|Matmatha|MKVXTEAM|Monchat|NLX5|NOMAD|NORRIS|PiCKLES|PREUMS|qctimb3rlandqc|ReBoT|ROLLED|SCREEN|SHiFT|SKRiN|TicaDow|Tokushi|Tonyk|TOXIC|TUTUTE|UNiKORN|Zombie)\b`, `\b(AKLHD|ARKRiL|BossBaby|Champion9|Copycomic|CR4ZYTiME|EASPORTS|EliteT|FUNKKY|FZTeam|GOBO2S|HD2|LION|LMPS|LNA3d|MACK4|MeMyl|METALLIKA|MGD|Moorea81|Moviz|Muxman|Mystic|MZC|MZi?SYS|N3TFL1X|NoelMaison|nutella|OMERTA|Papaya|PIKACHU|PULSE|Q7|RELiC|SANCTUAIRE|SHARKS|SP3CTR|Spow|STR4NGE|TeamSuW|TORRiD|TSN999|TVPSLO|Upmix|VATFER|Wakanim|WaNeZt|WINCHESTER|WITA)\b`, `\b(Bandix|CZ\d+|EXTREME|GA(Ï|I)A|HMiDiMADRiDi|Hush|KILLERMIX|LiBERTAD|LTa?TM|MONiCO|NEWCINE|R(PZ|ZP)|ShowFR|VERCLAM|ViKi47|Wawa-?(city|mania|porno)?|ZW)\b`' WHERE name = 'FR LQ';
UPDATE custom_formats SET description = '**FR Scene Groups**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `4FR`, `AiR3D|AiRDOCS|AiRFORCE|AiRLiNE|AiRTV|AMB3R|ANMWR|AVON|AYMO|AZR`, `BANKAi|BAWLS|BiPOLAR|BLACKPANTERS|BODIE|BOOLZ|BRiNK|BTT`, `CARAPiLS|CiELOS|CiNEMA|CMBHD|CoRa|COUAC|CRYPT0`, `D4KiD|DEAL|DiEBEX|DUPLI|DUSS`, `ENJOi|EUBDS`, `FHD|FiDELiO|FiDO|ForceBleue|FREAMON|FRENCHDEADPOOL2|FRiES|FUTiL|FWDHD`, `GHOULS|GiMBAP|GLiMMER|Goatlove`, `HERC|HiggsBoson|HiRoSHiMa|HYBRiS|HyDe`, `JMT|JoKeR|JUSTICELEAGUE`, `KAZETV`, `L0SERNiGHT|LaoZi|LeON|LOFiDEL|LOST|LOWIMDB|LUCKY|LYPSG`, `MAGiCAL|MANGACiTY|MAXAGAZ|MaxiBeNoul|McNULTY|MELBA|MiND|MORELAND|MUNSTER|MUxHD`, `N0Z00M|NERDHD|NERO|NrZ|NTK`, `OBSTACLE|OohLaLa|OOKAMI`, `PANZeR|PATHECROUTE|Penrose|PHoQUE|PiNKPANTERS|PKPTRS|PRiDEHD|PROPJOE|PURE|PUREWASTEOFBW`, `ROUGH|RUDE|Ryotox`, `SAFETY|SASHiMi|SEiGHT|SESKAPiLE|SharpHD|SHEEEiT|SHiNiGAMi(UHD)?|SiGeRiS|SILVIODANTE|SLEEPINGFOREST|SODAPOP|S4LVE|SPINE|SPOiLER|STRINGERBELL|Sunday26th|SUNRiSE`, `tFR|THENiGHTMAREiNHD|THiNK|THREESOME|TiMELiNE|TSuNaMi`, `UKDHD|UKDTV|ULSHD|Ulysse|(US)?UNSKiLLED|URY|USURY`, `VENUE|VFC|VoMiT`, `Wednesday29th`, `ZEST|ZiRCON`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'FR Scene Groups';
UPDATE custom_formats SET description = '**FastSUB**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'FastSUB';
UPDATE custom_formats SET description = '**Flights**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Flights`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Flights (Norg)';
UPDATE custom_formats SET description = '**FraMeSToR Remux**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `FraMeSToR`
- Source: bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'FraMeSToR Remux (Norg)';
UPDATE custom_formats SET description = '**GGEZ**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(GGEZ)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'GGEZ (Norg)';
UPDATE custom_formats SET description = '**German Bluray Tier 01**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `CNY`, `NIMA4K`, `PXL`, `TSCC`, `TvR`, `TVS`, `WalterBishop`, `WeebPinn`, `ZeroTwo`, `\b(BUTTERCUP|HARTZ02|XiSS|DOGPACK404|PRiNCESSDiANA|DiVA|D02KU|WAREZCX|BiTCHNUGGET)\b`
- Source: bluray, not bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German Bluray Tier 01';
UPDATE custom_formats SET description = '**German Bluray Tier 02**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `ABJ`, `MULTiPLEX`, `Oergel`, `SiXTYNiNE`, `VECTOR`
- Source: bluray, not bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German Bluray Tier 02';
UPDATE custom_formats SET description = '**German Bluray Tier 03**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `HDSource`, `HQC`, `RDR`, `RobertDeNiro`
- Source: bluray, not bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German Bluray Tier 03';
UPDATE custom_formats SET description = '**German LQ**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `1XBET`, `2dead`, `AIDA`, `AVTOMAT`, `Cancer58`, `CTFOH`, `EMVY`, `FORMBA`, `FRAGGERS`, `FSX`, `GETB8`, `HELD`, `iSSEYMiYAKE`, `kala`, `Kristallprinz`, `LAW`, `LizardSquad`, `LuRCH`, `MBA`, `MEGA`, `N2D2`, `OJ`, `omikron`, `ORCA88`, `P73`, `PaZ`, `Pendeti`, `PL`, `POE`, `PS`, `PsO`, `SD7`, `SHOWE`, `SHOWEHD`, `SunDry`, `TFARC`, `TVARCHiV`, `TVP`, `Tylor\.D`, `UTOPiA`, `Whistler`, `WOTT`, `ZaidaNulled`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German LQ';
UPDATE custom_formats SET description = '**German LQ (release title)**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release title: 3 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German LQ (release title)';
UPDATE custom_formats SET description = '**German Scene**

TRaSH Guides custom format. This database does not carry it upstream, because the French and German set was removed early in its history, so it is kept here as a copy of the TRaSH definition.

Matches:

- Release groups: `4KCONNECTiON`, `ACED`, `AWARDS`, `bi0hazard`, `CDD`, `CDP`, `CONTRiBUTiON`, `DETAiLS`, `DMPD`, `ENCOUNTERS`, `ENDSTATiON`, `euHD`, `EXCiTED`, `FENDT`, `FKKTV`, `GTVG`, `HAXE`, `HDARCHiV`, `iNTENTiON`, `JaJunge`, `MGE`, `MisFiTS`, `muhHD`, `OCA`, `OHD`, `PL3X`, `RiLE`, `RIPLEY`, `RSG`, `RUBBiSH`, `RWP`, `SAUERKRAUT`, `STARS`, `TMSF`, `TV4A`, `TVNATiON`, `W4K`, `WATCHABLE`, `WAYNE`, `WOMBAT`, `WvF`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'German Scene';
UPDATE custom_formats SET description = '**HANDJOB**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `HANDJOB`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HANDJOB (Norg)';
UPDATE custom_formats SET description = '**HONE**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `HONE`, `HONE|DiscoD|Weasley`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE (Norg)';
UPDATE custom_formats SET description = '**HONE Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `HONE|DiscoD|Weasley`
- Source: bluray

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE Bluray (Norg)';
UPDATE custom_formats SET description = '**HONE DV HDR Web-DL**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(HONE)\b`
- Release title: 4 patterns
- Source: web_dl

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE DV HDR Web-DL (Norg)';
UPDATE custom_formats SET description = '**HONE DV HDR10+ Web-DL**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(HONE)\b`
- Release title: 3 patterns
- Source: web_dl

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE DV HDR10+ Web-DL (Norg)';
UPDATE custom_formats SET description = '**HONE NF**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `HONE`
- Release title: 1 pattern
- Source: web_dl, webrip

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE NF (Norg)';
UPDATE custom_formats SET description = '**HONE h265**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `HONE|Weasley`
- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'HONE h265 (Norg)';
UPDATE custom_formats SET description = '**Joy UTR**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(Joy|UTR)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Joy UTR (Norg)';
UPDATE custom_formats SET description = '**Kallango**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Kallango`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Kallango (Norg)';
UPDATE custom_formats SET description = '**Kitsune**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Kitsune`' WHERE name = 'Kitsune (Norg)';
UPDATE custom_formats SET description = '**Kitsune Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Kitsune`
- Source: bluray

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Kitsune Bluray (Norg)';
UPDATE custom_formats SET description = '**LEGi0N**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `LEGi0N`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'LEGi0N (Norg)';
UPDATE custom_formats SET description = '**LostYears**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(LostYears)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'LostYears (Norg)';
UPDATE custom_formats SET description = '**Multi-French**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 2 patterns
- Language: Original, French

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Multi-French (Norg)';
UPDATE custom_formats SET description = '**NINJACENTRAL**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(NINJACENTRAL)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'NINJACENTRAL (Norg)';
UPDATE custom_formats SET description = '**NNMClub**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'NNMClub (Norg)';
UPDATE custom_formats SET description = '**NorthKorea**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `NorthKorea`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'NorthKorea (Norg)';
UPDATE custom_formats SET description = '**Other x265 Groups**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Other x265 Groups (Norg)';
UPDATE custom_formats SET description = '**PQ**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 6 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'PQ (Norg)';
UPDATE custom_formats SET description = '**QxR Members**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(Tigole|qxr|QxR|tigole|Ghost|ghost|MONOLITH|Silence|t3nzin|SAMPA|FreeTheFish|RZeroX|RCVR|Bandi|ImE|afm72|Garshasp|r00t|Panda|Kappa|YOGI|Bluespots|Langbard|Celdra)\b`
- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'QxR Members (Norg)';
UPDATE custom_formats SET description = '**RARBG**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(RARBG)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'RARBG (Norg)';
UPDATE custom_formats SET description = '**ROVERS**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `ROVERS`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'ROVERS (Norg)';
UPDATE custom_formats SET description = '**RTW**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `RTW`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'RTW (Norg)';
UPDATE custom_formats SET description = '**RandomBytes UHD Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `RandomBytes`
- Source: bluray, not bluray_raw
- Resolution: 2160p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'RandomBytes UHD Bluray (Norg)';
UPDATE custom_formats SET description = '**Remux Tier 03**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Chotab`
- Source: bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Remux Tier 03 (Norg)';
UPDATE custom_formats SET description = '**Remux Tier 04**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `NTb`
- Source: bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Remux Tier 04 (Norg)';
UPDATE custom_formats SET description = '**SPHD**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `SPHD`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'SPHD (Norg)';
UPDATE custom_formats SET description = '**TAoE**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'TAoE (Norg)';
UPDATE custom_formats SET description = '**Tigole**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Tigole`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Tigole (Norg)';
UPDATE custom_formats SET description = '**UHD Bluray Tier 04**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `SPHD`, `WEBDV`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'UHD Bluray Tier 04 (Norg)';
UPDATE custom_formats SET description = '**UHD Streaming Cut**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 3 patterns
- Source: web_dl, webrip
- Resolution: 2160p

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'UHD Streaming Cut (Norg)';
UPDATE custom_formats SET description = '**UTR**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `UTR`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'UTR (Norg)';
UPDATE custom_formats SET description = '**Vertag**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `Vertag`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Vertag (Norg)';
UPDATE custom_formats SET description = '**Vyndros**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(Vyndros)\b`
- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'Vyndros (Norg)';
UPDATE custom_formats SET description = '**W4NK3R**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `W4NK3R`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'W4NK3R (Norg)';
UPDATE custom_formats SET description = '**WEB-DL**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'WEB-DL (Norg)';
UPDATE custom_formats SET description = '**WEBDL**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Source: web_dl

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'WEBDL (Norg)';
UPDATE custom_formats SET description = '**WEBRip**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Source: webrip

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'WEBRip (Norg)';
UPDATE custom_formats SET description = '**WRS**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `WRS`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'WRS (Norg)';
UPDATE custom_formats SET description = '**h265**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern
- Source: not bluray_raw

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'h265 (Norg)';
UPDATE custom_formats SET description = '**hallowed Bluray**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `hallowed`
- Source: bluray

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'hallowed Bluray (Norg)';
UPDATE custom_formats SET description = '**iVy**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release groups: `iVy`, `\b(iVy)\b`

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'iVy (Norg)';
UPDATE custom_formats SET description = '**r00t**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release title: 1 pattern

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'r00t (Norg)';
UPDATE custom_formats SET description = '**r00t DV HDR**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(r00t)\b`
- Release title: 4 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'r00t DV HDR (Norg)';
UPDATE custom_formats SET description = '**r00t DV HDR10+**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `\b(r00t)\b`
- Release title: 3 patterns

*Sonarr and Radarr define this differently, so its conditions are scoped per app.*' WHERE name = 'r00t DV HDR10+ (Norg)';
UPDATE custom_formats SET description = '**stuxb**

Norg custom format. Maintained in this database rather than upstream TRaSH.

Matches:

- Release group: `stuxb`' WHERE name = 'stuxb (Norg)';
