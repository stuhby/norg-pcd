# Norg local additions

This repo tracks `Dictionarry-Hub/trash-pcd` upstream and adds Sonarr-side gap
fills on top. **No upstream custom format is ever modified.** Bare names are
stock TRaSH; everything local carries a `(Norg)` suffix.

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