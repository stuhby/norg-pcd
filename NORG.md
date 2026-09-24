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
Sonarr and Radarr configuration into this database exactly as it runs today.

**What landed:** 94 custom formats (92 new + 2 corrections) and all 27 quality profiles
(20 Sonarr, 7 Radarr) with 2,073 custom-format scores, 543 quality rows and 42 quality
groups. Verified by replay against the live Arr APIs: 27/27 profiles match, 0 discrepancies.

**Naming.** A bare name always means stock TRaSH. Ours are `<name> (Norg)` for formats and
`[Norg] <name>` for profiles. Only genuine deviations are tagged.

**Where the formats came from.** Two sources: the 92 `local-*.json` files configarr manages,
and 19 formats that exist only inside Sonarr/Radarr, because the PCD either renamed them
(`HDR` -> `HDR10`, `SDR` -> `SDR (2160p)`) or deliberately deleted them (op 2 dropped the whole
French/German set). Each of the 20 candidates was compared *structurally* against every
upstream format rather than by name: only `HULU` matched one exactly, so it maps to the bare
upstream `Hulu` and the other 19 were imported as `(Norg)`.

**Four profile names exist in both Arrs** (`4K Remux`, `1080p Remux`, `1080p Encode`,
`4K Encode`) and their ladders genuinely differ, down to the quality vocabulary itself
(Sonarr `Bluray-2160p Remux` vs Radarr `Remux-2160p`). A PCD profile has ONE ladder, so those
four carry an app suffix. The other 23 do not: only disambiguate where there is a collision.

**Dual-defined formats become ONE format with per-arr conditions** via `arr_type`, which is
what that column is for. Several only *looked* different because the source enum differs per
app (Sonarr Bluray=6, Radarr Bluray=9; Sonarr WEBRip=4, Radarr WEBRip=8); PCD stores the
symbolic value, so those collapse to `arr_type='all'`. Genuinely different ones (the `HONE`
regex is `^(HONE|DiscoD|Weasley)$` on Sonarr and `^(HONE)$` on Radarr) keep one condition per
app, with the app appended to the condition name because `(format, condition)` is a UNIQUE key.

**Three decisions worth knowing, because they are not mechanical:**

1. **`HD Bluray Tier 04` becomes `HD Bluray Tier 03 (Norg)`.** The live Sonarr format named
   "Tier 04" holds the 18 groups that op 900 put in Tier 03, and it scores 1900, which is
   exactly what op 900 assigned Tier 03. The score follows the content, not the old name.
2. **op 900's `HD Bluray Tier 04 (Norg)` is left UNSCORED.** It is the gap-fill for groups
   with no Bluray tier at all, so scoring it would change today's results, and the standing
   instruction was that current scoring must not change. Scoring it is a separate decision.
   Note it overlaps `HONE Bluray (Norg)`, so scoring both would double-count HONE.
3. **`hallowed Bluray (Norg)` and `HONE Bluray (Norg)` are corrected here.** op 900 created
   them without the Bluray source guard that the real formats carry, and narrowed HONE's regex.
   op 901 deletes their whole condition set (the value tables too, or the re-insert trips the
   `condition_patterns` UNIQUE key) and rebuilds them to match the Arrs. Their live Sonarr
   scores (1200/1500/1500) are imported as-is; op 900's "score 0" was based on a wrong belief
   that they did not already exist in Sonarr.

**Regexes are reused by pattern, not recreated:** 988 of the 1,173 patterns resolve to an
existing upstream `regular_expressions` row, so a TRaSH fix to a release-group pattern
propagates into the Norg formats on the next `git merge upstream/main`. Only 185 are new.

**Upstream is untouched, and that is asserted rather than assumed:** all 1,982 upstream
condition rows and all 1,457 upstream profile scores are byte-identical to a pristine
trash-pcd replay.
