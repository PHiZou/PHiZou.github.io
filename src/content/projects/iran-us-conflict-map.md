---
title: Iran–US Conflict Map
type: D3 Visualization
template: d3-visualization
summary: Interactive D3.js map tracking key events, military operations, economic disruptions, and humanitarian impacts of the 2026 Iran–US conflict. Scrollable timeline animates the war day by day.
tags: ["D3.js", "Visualization", "Geospatial", "Timeline", "Data Journalism"]
stack: ["D3.js", "TypeScript", "Vite", "TopoJSON"]
impact: Turns complex conflict data into an explorable atlas — zoom from macro (global oil disruption) to micro (individual strikes, ship attacks) with source-cited, journalism-grade visualization.
legacyUrl: "https://iran-us-conflict-map.vercel.app"
---

An interactive D3.js map visualization tracking the key events, military operations, economic disruptions, and humanitarian impacts of the 2026 Iran–US conflict. Think of it as a living, layered atlas — zoom from the macro (global oil disruption) down to the micro (individual strikes, ship attacks, base locations) with a scrollable timeline that animates the war day by day.

## Data Layers

| Layer | What It Shows |
|---|---|
| **Strike locations** | US/Israeli strikes inside Iran, Iranian retaliatory strikes on bases across the Gulf |
| **Strait of Hormuz** | Shipping blockade, mine locations, ship attacks, naval engagements |
| **Oil & energy** | Disrupted infrastructure, global oil price overlay |
| **Military assets** | US base locations, carrier strike groups, missile/drone launch sites |
| **Humanitarian** | Displacement flows, casualty counts by country |
| **Timeline** | Day-by-day progression from pre-war through present |

## Approach

- **Data-first** — every visual element encodes real information; no gratuitous effects
- **Time as primary axis** — timeline scrubber is the main control; scrub forward to watch the war unfold spatially
- **Layered complexity** — toggle naval, oil, humanitarian layers as needed
- **Source everything** — every data point links to a source (ISW, CENTCOM, Reuters, etc.)
- **Respectful** — muted palette, no gamification of casualties, clear labeling of unconfirmed vs. confirmed events

## Technical Details

- **Map rendering:** D3.js v7 + d3-geo — full control over projections, transitions, custom layers
- **Geography:** TopoJSON (Natural Earth) — compact vector boundaries
- **Stack:** Vite, TypeScript, vanilla CSS
- **Data:** Static JSON — no backend; all data curated and versioned

## Features

- Base map with country borders, zoom, pan
- Strike event markers color-coded by actor (US, Israel, Iran)
- Play/pause/scrub timeline with day-by-day playback
- Filter by category (strike, naval, oil, diplomatic, humanitarian, cyber)
- Oil price line chart synced with timeline
- Casualty counter by country
- Tooltips and legend
