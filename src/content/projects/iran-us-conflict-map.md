---
title: Iran–US Conflict Map
type: D3 Visualization
template: d3-visualization
summary: Interactive D3.js map tracking key events, military operations, economic disruptions, and humanitarian impacts of the 2026 Iran–US conflict. Scrollable timeline animates the war day by day.
tags: ["D3.js", "Visualization", "Geospatial", "Timeline", "Data Journalism"]
stack: ["D3.js", "TypeScript", "Vite", "TopoJSON"]
impact: Turns complex conflict data into an explorable atlas — zoom from macro (global oil disruption) to micro (individual strikes, ship attacks) with source-cited, journalism-grade visualization.
legacyUrl: "https://iran-us-conflict-map2.vercel.app/"
---

An interactive D3.js map built to track the 2026 Iran–US conflict through geography, time, and layered context. The project combines military events, shipping disruption, energy impacts, and humanitarian data in a scrollable timeline so users can move from broad regional patterns to specific incidents.

## What it includes

- Strike locations and retaliatory events across Iran and the Gulf
- Strait of Hormuz disruption, ship attacks, and naval activity
- Oil and energy overlays tied to infrastructure disruption
- Military assets such as bases, carrier groups, and launch sites
- Humanitarian indicators including displacement and casualty counts
- A day-by-day timeline for following the conflict as it evolves

## Approach

- **Data-first:** visual elements are tied to reported events and structured datasets
- **Time-driven:** the timeline is the main way to explore how the conflict unfolds
- **Layered:** users can toggle military, economic, and humanitarian views as needed
- **Source-aware:** events are tied back to reporting and source material
- **Respectful:** the design avoids sensationalism and treats casualty data carefully

## Technical details

- **Map rendering:** D3.js + d3-geo
- **Geography:** TopoJSON / Natural Earth boundaries
- **Stack:** Vite, TypeScript, vanilla CSS
- **Data:** curated static JSON with no backend

## Key features

- Zoomable base map with country boundaries
- Timeline playback and scrubbing controls
- Category filters for military, naval, oil, diplomatic, humanitarian, and cyber events
- Synchronized overlays including oil-price context and casualty summaries
- Tooltips and legend for quick interpretation
