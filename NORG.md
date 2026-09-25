# Norg local additions

This repo tracks `Dictionarry-Hub/trash-pcd` upstream and adds Sonarr-side gap
fills on top. **No upstream custom format is ever modified.** Custom formats: bare names
are stock TRaSH and ours carry a `(Norg)` suffix. Quality profiles: bare names are
ours, and `[TRaSH]` / `[Dict]` mark profiles based on that database (see 909).

## Why these exist

TRaSH curates Sonarr and Radarr differently. For Sonarr it ships only
`HD Bluray Tier 01/02` and **no UHD Bluray tiers at all**, while Radarr gets
`HD 01-03` and `UHD 01-03`. These formats close that gap for Sonarr.

| format | score intent | contents |
|---|---|---|
| `HD Bluray Tier 03 (Norg)` | 1900 | Radarr HD T01 groups Sonarr's T01 omits, plus ATELiER |
| `HD Bluray Tier 04 (Norg)` | 1700 | Radarr HD T03 groups, incl. playHD |
| `UHD Bluray Tier 01 (Norg)` | 2100 | CtrlHD, MainFrame, W4NK3R, DON |
| `UHD Bluray Tier 02 (Norg)` | 2000 | HQMUX |
| `UHD Bluray Tier 03 (Norg)` | 1900 | hallowed, HONE, PTer, SPHD, WEBDV, BHDStudio |
| `BHDStudio (Norg)` | -250 | unguarded offset, mirrors Radarr `1080p Encode (TRaSH)` |
| `hallowed Bluray (Norg)` | **0** | present but unscored, see below |
| `HONE Bluray (Norg)` | **0** | present but unscored, see below |

The UHD scores sit +300 over TRaSH stock. That is deliberate: it is what makes
Bluray beat WEB in the 4K encode profiles, which stock scoring does not do
because TRaSH lets UHD T03 tie WEB T01 at 1700.

`hallowed Bluray` and `HONE Bluray` are intentionally scored **0**. HONE TV
encodes are sometimes very small, and a good WEB-DL is preferable to a poor HONE
encode, so ranking is left off until measured. The formats exist so enabling
them later is a one-number change.

## Sonarr vs Radarr enums

Conditions use PCD's symbolic values (`bluray`, `2160p`), so Profilarr handles
the per-app translation. Do **not** hand-port Radarr's integer enums: Radarr
`SourceSpecification 7` is WEBDL while Sonarr `7` is REMUX.

Requiring `source = bluray` already excludes WEB and Remux, which is why one
positive condition replaces Radarr's triple negation.

## Updating from upstream

```bash
git fetch upstream && git merge upstream/main
```

Local ops are numbered 900+ so they always replay after upstream.

## 901 / 902 -- the 1:1 import (2026-09-23)

`901.norg-local-custom-formats.sql` and `902.norg-quality-profiles.sql` import the live
Sonarr and Radarr configuration exactly as it runs today: 88 custom formats, 2 corrections,
and all 27 quality profiles (20 Sonarr, 7 Radarr) with 2,073 scores, 543 quality rows and
42 quality groups. Verified against the live Arr APIs: 27/27 profiles, 0 discrepancies.

**Naming.** A bare name means stock TRaSH. Ours are `<name> (Norg)` and `[Norg] <name>`.
(Superseded for PROFILES by 909: profiles dropped `[Norg]`. Custom formats still follow this.)
Only genuine deviations are tagged, so `(Norg)` never appears on something we did not author.

**What is tagged, and why.** Every candidate was compared *structurally* against every
upstream format (conditions, negation, required flags, and the symbolic source/resolution
/language/quality-modifier values) rather than by name:

- **86 formats are genuinely ours** and carry `(Norg)`. Of the 92 configarr `local-*.json`
  definitions only one, `CR - Boost`, is structurally identical to an upstream format (`CR`);
  it is kept separate on purpose, because it exists to stack a second score on the same match.
- **7 were NOT ours and are no longer tagged.** They are stock TRaSH that this PCD merely
  renamed, so they now reference the upstream format and keep tracking it:
  `HULU` -> `Hulu`, `INTERNAL` -> `Internal`, `x265` -> `x265 (Codec)` (both arrs),
  `HDR` -> `HDR10` (both arrs), `SDR` -> `SDR (2160p)`.
- **10 are TRaSH formats this PCD deleted** (op 2 dropped the whole French/German set, and
  `FastSUB` went with it). They keep their **bare TRaSH names**, because they are not our work
  and the PCD dropped them, so the names are free. Known limitation: they are frozen copies,
  not tracked, since there is nothing upstream here to track.
- Only `BiOMA` and `AndreMor` were hand-made outside configarr, confirmed absent as top-level
  formats from the TRaSH Guides repo.

**Four profile names exist in both Arrs** (`4K Remux`, `1080p Remux`, `1080p Encode`,
`4K Encode`) and their ladders genuinely differ, down to the vocabulary (Sonarr
`Bluray-2160p Remux` vs Radarr `Remux-2160p`). A PCD profile has ONE ladder, so those four
carry an app suffix. The other 23 do not: disambiguate only where there is a collision.

**Dual-defined formats become ONE format with per-arr conditions.** Several only looked
different because the source enum differs per app (Sonarr Bluray=6, Radarr Bluray=9; Sonarr
WEBRip=4, Radarr WEBRip=8) and the PCD stores the symbolic value, so those collapse to
`arr_type='all'`. Genuinely different ones keep one condition per app, with the app appended
to the condition name because `(format, condition)` is a UNIQUE key.

**Descriptions** are generated for all 96 of our formats and all 27 profiles, in the upstream
style: a bold name, provenance, then the matched groups, sources, resolutions and languages
read from the format's own conditions. Profiles use the upstream
"Quality Profile that covers:" list, built from the qualities actually enabled.

**Two scoring decisions:**

1. **`HD Bluray Tier 04` becomes `HD Bluray Tier 03 (Norg)`.** The live Sonarr format under
   that name holds the 18 groups op 900 put in Tier 03, scored 1900, which is exactly what
   op 900 assigned Tier 03. The score follows the content, not the old name.
2. **op 900's `HD Bluray Tier 04 (Norg)` is left unscored**, so today's scoring is unchanged.
   It overlaps `HONE Bluray (Norg)`, so scoring both would double-count HONE.

**`hallowed Bluray (Norg)` and `HONE Bluray (Norg)` are corrected here.** op 900 created them
without the Bluray source guard the real formats carry and narrowed HONE's regex. op 901
deletes their whole condition set, the value tables included, or the re-insert trips the
`condition_patterns` UNIQUE key, then rebuilds them to match the Arrs.

**Regexes are reused by pattern:** 988 of 1,173 resolve to an existing upstream
`regular_expressions` row, so a TRaSH fix to a release-group pattern propagates into our
formats on the next `git merge upstream/main`. Only 185 are new.

**(!) REPLAY THIS DATABASE WITH `PRAGMA foreign_keys=ON`.** The schema carries 32
`ON UPDATE CASCADE` clauses and the upstream rename ops depend on them, but the `sqlite3`
CLI defaults foreign keys OFF. Replaying without it silently strips the conditions from every
renamed format (`HDR10`, `SDR (2160p)`, `x265 (Codec)`, `Internal`, `Hulu` all came back
empty) and leaves 564 orphaned condition rows behind. That produces convincing but wrong
answers: four upstream ops appear to fail on a UNIQUE constraint, and formats that DO exist
upstream look absent, which is what made 7 formats get wrongly tagged `(Norg)` on the first
attempt. With the pragma on, the full 149-op replay is clean: 0 errors, 0 orphans.

**Upstream is untouched, asserted not assumed:** all 1,442 upstream condition rows and all
1,457 upstream profile scores are identical to a pristine trash-pcd replay.
## Arr-scoped format resolution (2026-09-23)

A `(Norg)` format supersedes the bare upstream one **only for the arr it actually carries
conditions for**. Sonarr's hand-built UHD Bluray tiers and Remux Tier 03 became `(Norg)`;
Radarr's are stock upstream. Resolving by name alone pointed four Radarr profiles at
`UHD Bluray Tier 01/02 (Norg)`, `HD Bluray Tier 03 (Norg)` and `Remux Tier 03 (Norg)`,
which carry **zero** radarr-scoped conditions, so those formats would have matched nothing
in Radarr while still looking correctly scored.

**(!) A SCORE-ONLY VERIFICATION CANNOT CATCH THIS.** Both sides of that check used the same
mapping, so it is circular and reported 27/27 with 0 discrepancies throughout. What found it
was comparing each format's CONDITIONS against the live Arr. Always diff the definition, not
just the score.

Scope is derived from the database (`GROUP_CONCAT(DISTINCT arr_type)` per `(Norg)` format,
expanding `all`), never assumed, because formats created by an earlier op are absent from the
current op's own map. Unknown scope falls back to the bare name, which fails safe.

## 903 -- scoring HD Bluray Tier 04 (2026-09-23)

`HD Bluray Tier 04 (Norg)` scores **1850** in `[Norg] 1080p Encode (Sonarr)` and nowhere else.
That profile runs 2000 / 1950 / 1900 for Tier 01 / 02 / 03 in 50-point steps; the other 13
Sonarr profiles that score the HD Bluray tiers stop at Tier 02, so a fourth rung there would
be inventing two tiers they never had.

**What it really changes.** In that profile the top quality group is
`Bluray-1080p Remux + Bluray-1080p`, and inside a group the custom format score is the ONLY
tiebreak. So the eight Tier 04 groups move from below every Remux tier (1000-1150) to above
it. Six of them (BHDStudio, hallowed, HiFi, LoRD, SPHD, W4NK3R) previously scored 150,
baseline only. It also restores playHD, which scored 1900 through the old hand-built
"HD Bluray Tier 04" and would otherwise have dropped to baseline, since op 901 moved it out
of Tier 03 to match Radarr.

**(!) HONE ALREADY OUTSCORES EVERY OTHER GROUP ON BLURAY, AND THIS IS NOT OUR DOING.**
Measured against the LIVE Sonarr before any of this: a HONE 1080p Bluray encode scores 3058
while the best Tier 01 group scores 2050. The driver is `WEB Tier 01` (1700): its two source
conditions (WEBDL, WEBRIP) are OPTIONAL and sit alongside an optional group list, so under Arr
semantics a group match alone satisfies it and it applies to a Bluray release. Stacked with
`HONE Bluray` (1200) and `HONE` (8) that puts HONE on top. op 903 widens the lead to 4908.
If HONE should not lead, the levers are `HONE Bluray` and that WEB Tier 01 quirk, not Tier 04.

**Tiers cannot stack:** Remux tiers require `bluray_raw`, the HD Bluray tiers require `bluray`
and negate `bluray_raw`, so a release matches one side or the other, never both.

Verification now expects exactly ONE difference against the live Arrs, this deliberate row.

## 904 -- HONE not leading (2026-09-23)

op 903 put HONE into `HD Bluray Tier 04 (Norg)` at 1850 while `HONE Bluray (Norg)` was
already scoring it 1200 in the same profile. The two stacked and HONE reached 3108 against
1950 for the Tier 03 groups, topping the profile, which is the opposite of the intent.
op 904 drops the `HONE Bluray` row from `[Norg] 1080p Encode (Sonarr)` only.

**(!) A PREVIOUS ANALYSIS HERE WAS WRONG AND IS RETRACTED.** It claimed HONE already led at
3058 because `WEB Tier 01` applied to Bluray releases, reasoning that the format has ZERO
required specs so any one of its 24 optional specs satisfies it. Sonarr does not work that
way: optional conditions are OR'd **within an implementation type** and AND'd **across**
types, so WEB Tier 01 means (one of 22 groups) AND (WEBDL or WEBRIP), and a Bluray fails the
source clause. Proven with Sonarr's own `/api/v3/parse`: a `1080p.BluRay.x264-HONE` title
matches `HONE`, `HONE Bluray`, `x265 (HD)` and friends, and does NOT match `WEB Tier 01`; a
WEBDL from a group not on the list does not match it either.

**USE `/api/v3/parse` TO SETTLE ANY MATCHING QUESTION.** It returns the exact custom formats
Sonarr assigns to a title, so it replaces reasoning about required/optional semantics
entirely. Measured on `1080p.BluRay.x264-<group>` before these ops: CRiSC/BBQ/playHD 1950,
HONE 1258, hallowed/SPHD/BHDStudio 50 (baseline only). HONE did NOT lead beforehand.

Resulting ladder for a 1080p Bluray encode:

    Tier 01 groups         2050
    Tier 02 groups         2000
    Tier 03 (Norg) groups  1950
    HONE                   1908   (tier 1850 + HONE (Norg) 8 + 1080p 50)
    Tier 04 (Norg) peers   1900

**(!) `HONE Bluray (Norg)` is deliberately UNTOUCHED elsewhere**: 1500 in `[Norg] Anime` and
`[Norg] Anime (CR)` (neither scores an HD Bluray tier, so nothing stacks), and 4000/4000/5000
across the three Radarr profiles, where HONE and hallowed are meant to lead.

## 905 -- drop the HONE nudge in 1080p Encode (2026-09-23)

`HONE (Norg)` is the imported local Sonarr format matching `^(HONE|DiscoD|Weasley)$` with
**no source or resolution guard**, so it stacked on top of the tier and left HONE 8 points
clear of its own peers. Removed from `[Norg] 1080p Encode (Sonarr)` only. HONE now sits level
with hallowed, SPHD, LoRD, HiFi, W4NK3R, playHD and BHDStudio at 1900.

**(!) The format is unguarded, so this also drops the same 8 from DiscoD and Weasley** in
this profile (58 -> 50 on a 1080p Bluray). Neither is in any Bluray tier, so that nudge was
the only thing scoring them there.

Left alone everywhere else: 8 in 1080p x265, 4K Encode, 4K Encode (TrueHD), Anime, Anime (CR);
12 in the four 480p x265 profiles; 51 in 4K Remux and 1080p Remux; 12/51 on the Radarr side.

Running total of deliberate deviations from the live Arrs, all in `1080p Encode (Sonarr)`:
Tier 04 added at 1850, `HONE Bluray` removed, `HONE` removed.

## 906 -- the per-profile language (2026-09-23)

The 1:1 import missed `quality_profile_languages` entirely. All seven live Radarr profiles
are set to **Original**, and upstream trash-pcd sets the same on its own profiles, but op 902
emitted no language rows. Pushing a Radarr profile with no language would let it fall back to
Profilarr's default, and Original vs English or Any changes which releases are accepted.

Sonarr is unaffected: Sonarr v4 has no per-profile language, all 20 report none.

**(!) AUDIT THE WHOLE FIELD SET, NOT JUST THE ONES YOU BUILT AGAINST.** This was found by
diffing every key on a live Arr profile against the list the generator consumes, not by any
test. The score check could never see it, because scores were never involved. The only key
now deliberately unimported is `id`, which the Arr assigns. The four numeric fields
(`upgradeAllowed`, `minFormatScore`, `cutoffFormatScore`, `minUpgradeFormatScore`) were
re-audited across all 27 profiles at the same time: 0 mismatches.

## 907 -- live media management, because Profilarr refuses to sync without it (2026-09-24)

**Profilarr will not sync quality profiles until a naming config, a quality-definitions config,
a media-settings config AND a delay profile are all selected for the instance.** Both Sync runs
on 2026-09-24 finished as `skipped` for exactly this reason, with no error anywhere: the only
signal is a yellow line in the UI and `status=skipped` in `job_run_history`.

**(!) EVERY PRE-EXISTING OPTION WOULD HAVE CHANGED LIVE BEHAVIOUR**, measured against the running
Arrs rather than assumed:

- All **9** Sonarr naming configs differ, including `series_folder_format`: live is
  `{Series TitleYear} {imdb-{ImdbId}}`, every option is `{Series CleanTitleWithoutYear} {(Series Year)}...`.
  Sonarr does not retro-rename, but NEW imports would land in differently-named folders.
- **100%** of the quality definitions differ (20/20, 14/14, 21/21, 14/14, 9/9, 8/8). These govern
  accepted file SIZES.
- The `Default` delay profile is `prefer_torrent` with 0/0 delays against a live usenet-preferred
  15/60.

So op 907 mirrors the LIVE settings 1:1 as **`Norg (live)`** (and `Norg Sonarr/Radarr (live)` for
the delay profiles). Selecting these satisfies the requirement and pushes byte-identical values.
Verified after replay: naming identical both arrs, all 52 quality definitions identical.

**(!) TWO SCHEMA TRAPS.** Quality definitions are keyed on the PCD's CANONICAL quality name with a
foreign key, not the Arr's `api_name` (Sonarr reports `Bluray-1080p Remux`, the PCD wants
`Remux-1080p`), so they must be mapped through `quality_api_mappings` or the insert dies on the FK.
And `minimum_custom_format_score` must be **NULL** unless `bypass_if_above_custom_format_score` is
1. That mirrors the Arr, where the threshold is inert while the toggle is off, so live's stored
3341 (Sonarr) / 3000 (Radarr) does nothing and NULL is the faithful value, not a loss of a gate.

**The media-settings configs are a no-op:** the pre-existing `Default` already matched live exactly
(`doNotPrefer` / media info on) for both arrs. `Norg (live)` is added only so all four dropdowns
name the same source.

## 908 -- undoing a regression op 900 introduced (2026-09-24)

**(!) op 900 CREATED A TIER OVERLAP THAT DID NOT EXIST BEFORE.** The hand-built Sonarr UHD tiers
were cleanly separated: Tier 01 CtrlHD/DON/MainFrame/W4NK3R, Tier 02 HQMUX, Tier 03
hallowed/HONE/PTer, Tier 04 SPHD/WEBDV. op 900 added BHDStudio, **SPHD and WEBDV** to Tier 03 "to
match Radarr" without checking Tier 04, so SPHD and WEBDV collected BOTH: a 2160p BluRay from SPHD
scored **5300**, beating CtrlHD (a real Tier 01 group) at 3700.

**THE LESSON: when porting a tier list from the other arr, diff against EVERY tier on this side,
not just the one being edited.** Radarr is the reference and it keeps every group in exactly one
tier; that invariant is what op 900 broke and this restores.

Also fixed here: **Tier 04 was UNGUARDED**, the same defect op 900 corrected on Tier 01/02 but
missed on 04 because 04 was outside its scope. Unguarded it paid +1800 on any source at any
resolution, so inside the 4K profiles a 1080p WEB-DL from SPHD scored 1850 and a 720p HDTV from
WEBDV scored 1805.

BHDStudio STAYS in Tier 03 (it was in no UHD tier at all, so it scored 0 at 2160p, a genuine gap,
and Radarr places it there too) but now carries a **-250** offset on the Sonarr side in the three
profiles where it earns a tier score, mirroring Radarr's -75/-100/-250. Without it BHDStudio tied
hallowed and HONE exactly.

HiDt was added to Tier 04 rather than to a TRaSH tier, per the standing rule not to alter TRaSH
formats to add a group. Radarr ranks it a rung higher (its UHD Tier 02), so 1800 here is slightly
low; move it if that shows in practice.

## 909 -- profile naming (2026-09-24)

The `[Norg] ` prefix is gone from every quality profile. It sat on all 27 profiles anyone
actually picks, so it carried no information. The convention for **profiles** is now:

| form | meaning | examples |
|---|---|---|
| bare name | ours | `1080p WebDL`, `Anime`, `4K Encode (Radarr)` |
| `[TRaSH] <name>` / `[Dict] <name>` | based on that database's profile, stock or customised | `[TRaSH] Anime`, `[TRaSH] 4K SQP-2`, `[Dict] 2160p Quality` |
| trailing `(Word)` | a child variant of a main profile | `1080p WebDL (AMZN)`, `Anime (CR)`, `4K Encode (HONE)` |

The three former `(TRaSH)` profiles moved to the prefix: `Anime (TRaSH)` -> `[TRaSH] Anime`,
`4K SQP-2 (TRaSH)` -> `[TRaSH] 4K SQP-2`, `1080p Encode (TRaSH)` -> `[TRaSH] 1080p Encode`.
`[Dict]` comes from the local op on the Dictionarry database, not from this repo.

**`(Sonarr)` / `(Radarr)` is NOT a child marker and cannot be dropped.** `quality_profiles.name`
is UNIQUE and a profile carries ONE quality ladder and one set of score thresholds for every arr
it is pushed to (only the format SCORES can differ per arr). The four pairs that carry the
suffix were compared live and all genuinely differ: `4K Remux` (minimum score 0 vs 2500, and
different groupings), `1080p Remux` (Radarr is remux-only), `1080p Encode` and `4K Encode`
(different ladders and cutoffs; Sonarr's 4K Encode also accepts HDTV). Merging a pair would
change what gets grabbed.

**Custom formats are unchanged:** bare = stock TRaSH, `(Norg)` = ours. Stock is the common case
there, so the bare name still means the common case in both lists.

**(!) Profilarr matches arr profiles by EXACT NAME and CREATES any name it does not find.** So
the live Sonarr and Radarr profiles were renamed in place (same ids, every series and movie
still attached) BEFORE this op was published, and Profilarr's per-instance sync selections
(`arr_sync_quality_profiles.profile_name`) were renamed to match. Renaming only here would have
made the next sync create 27 empty duplicates beside the originals.

Verified by replaying the database with and without this op and diffing every profile table
with the rename applied: 0 differences across 3,534 scores, 1,114 ladder rows, 124 groups,
342 group members, 27 languages and 22 tags, plus one custom-format description
(`BHDStudio (Norg)`) that named a renamed profile. The diff was positive-controlled with a
one-point score change, which it caught.

Sections above this one are historical and keep the names that were current when written.
