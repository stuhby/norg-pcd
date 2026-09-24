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
