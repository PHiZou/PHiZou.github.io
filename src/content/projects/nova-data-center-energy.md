---
title: NOVA Data Center Energy Usage
type: D3 Visualization
template: d3-visualization
summary: Interactive D3.js visualization analyzing energy consumption, environmental impact, and infrastructure strain from data center growth in Northern Virginia — the largest data center market on Earth.
tags: ["D3.js", "Visualization", "Energy", "Scrollytelling", "Data Journalism"]
stack: ["D3.js", "TypeScript", "Vite", "TopoJSON", "d3-sankey"]
impact: Turns utility filings and environmental reports into a visceral, interactive experience — demand timelines, facility maps, grid stress gauges, water heatmaps, and tax revenue analysis.
legacyUrl: "https://nova-data-center-energy.vercel.app"
---

An interactive D3.js data visualization analyzing the energy consumption, environmental impact, and infrastructure strain caused by the explosive growth of data centers in Northern Virginia — the largest data center market on Earth. Northern Virginia hosts **13% of all global data center capacity** and **25% of capacity in the Americas**.

## Why This Matters

The numbers are staggering: 354 facilities in Virginia, 37,876 MW total capacity, 24% of Virginia electricity sales (2024). A single 100 MW data center uses as much electricity as **80,000 homes**. Dominion Energy's total generation is ~22 GW for all of Virginia — and the data center pipeline alone exceeds 47 GW.

## Visualizations

| Visualization | What It Reveals |
|---|---|
| **Demand Growth Timeline** | How data center power demand exploded from 2015 to 2026, with projections to 2035 |
| **Facility Map** | Every data center in NOVA, sized by MW capacity, colored by operator |
| **Grid Stress Gauge** | Current load vs. Dominion's generation capacity |
| **Household Equivalence** | 1 data center icon = X thousand homes — making scale visceral |
| **Energy Source Sankey** | Where the power comes from: natural gas, nuclear, coal, renewables |
| **Water Consumption Heatmap** | Daily water usage vs. Potomac River flow — the summer crunch |
| **Tax Revenue vs. Cost** | What data centers pay ($895M+) vs. what they cost the county |
| **Company Treemap** | AWS vs. Microsoft vs. Google vs. Meta — who uses the most |
| **Connection Queue** | The years-long wait for new power connections |

## Approach

- **Narrative first** — scrollytelling structure; every chart serves the argument
- **Comparisons make it real** — MW into homes, gallons into swimming pools
- **Honest complexity** — show the trade-offs, not a one-sided take
- **Source everything** — Dominion filings, JLARC reports, county budgets, ICPRB data

## Technical Details

- **Charts & maps:** D3.js v7 — demand timeline, facility map, Sankey, heatmap, gauges
- **Geography:** TopoJSON (NOVA county boundaries)
- **Stack:** Vite, TypeScript, d3-sankey
- **Data:** Static JSON from Dominion IRP filings, JLARC, Loudoun County budget, ICPRB
