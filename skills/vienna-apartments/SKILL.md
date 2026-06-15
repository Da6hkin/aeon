---
name: Vienna Apartments
description: Daily sweep of commission-free Vienna rental listings in central districts, delivered to Telegram
var: "1,3,4,5,6,7,8,9"
tags: [housing, personal]
---
> **${var}** — Comma-separated Vienna district numbers to search. Defaults to central districts 1,3,4,5,6,7,8,9.

Searches for a couple looking for an apartment. Target criteria:
- **2+ rooms AND/OR 50 m²+**
- **Total rent ≤ €1,500/month warm** (incl. Betriebskosten)
- **Provisionsfrei preferred** (commission-free / no Makler)
- Districts from `${var}`

## Context

Read `memory/MEMORY.md` for context and the last 2 days of `memory/logs/` to avoid repeating listings already sent.

## Sources

willhaben.at and immobilienscout24.at **block automated fetching** — do NOT use them. Use these aggregators (they index the same listings and are fetchable). For each district number `N` in `${var}`, fetch the matching immosuchmaschine URL, e.g.:
- 1 → https://www.immosuchmaschine.at/Wien-1.Bezirk-Innere-Stadt/Mietwohnungen
- 3 → https://www.immosuchmaschine.at/Wien-3.Bezirk-Landstrasse/Mietwohnungen
- 4 → https://www.immosuchmaschine.at/Wien-4.Bezirk-Wieden/Mietwohnungen
- 5 → https://www.immosuchmaschine.at/Wien-5.Bezirk-Margareten/Mietwohnungen
- 6 → https://www.immosuchmaschine.at/Wien-6.Bezirk-Mariahilf/Mietwohnungen
- 7 → https://www.immosuchmaschine.at/Wien-7.Bezirk-Neubau/Mietwohnungen
- 8 → https://www.immosuchmaschine.at/Wien-8.Bezirk-Josefstadt/Mietwohnungen
- 9 → https://www.immosuchmaschine.at/Wien-9.Bezirk-Alsergrund/Mietwohnungen

Also fetch the private-landlord feed: https://www.ohne-makler.at/immobilien/wohnung-mieten/wien/

## Steps

1. For each district in `${var}`, fetch the immosuchmaschine page with **WebFetch** and extract listings: title, district, monthly rent, size m², rooms, and listing URL. Also fetch the ohne-makler Vienna page.
2. Filter to the criteria above (2+ rooms and/or 50 m²+, ≤ €1,500 warm, in the target districts). Prefer provisionsfrei.
3. Deduplicate against the last 2 days of `memory/logs/` — drop any listing URL already reported.
4. Select the freshest ~8–15 matches.
5. Send via `./notify` (under 4000 chars), formatted like:
```
*🏠 Vienna apartments — ${today}*

- *D5* €1,180 · 62 m² · 3 rooms — [title](url)
- *D9* €990 · 55 m² · 2 rooms — [title](url)

_Reminder: open Claude + your logged-in Facebook browser and ask me to run the full FB-group sweep (provision-free / no-income-check posts)._
```
6. Log the sent listings (with URLs) to `memory/logs/${today}.md` so tomorrow's run can dedupe.
7. If no new matches across all sources, log `VIENNA_APARTMENTS_OK` to the log and end without notifying.

## Sandbox note

The sandbox may block outbound `curl`. **Always use WebFetch** for these aggregator pages — it bypasses the sandbox. If a page fails to fetch, skip it and continue with the others. No auth is required for any of these sources.
