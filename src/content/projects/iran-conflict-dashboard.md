---
title: Iran Conflict Operational Intelligence Dashboard
type: D3 Visualization
template: d3-visualization
summary: Multi-view React dashboard for the 2026 Iran–US conflict. Escalation index, impact metrics, regional map, strategic chokepoints, event log, actor force posture, and scenario pathways — built for defense and intelligence-adjacent analysis.
tags: ["OSINT", "Dashboard", "Geopolitical", "Intelligence", "Multi-view"]
stack: ["React", "TypeScript", "Vite", "Recharts", "Mapbox"]
impact: Goes beyond the companion D3 conflict map by framing the same domain as an operational dashboard — the kind of multi-view intelligence product that defense analytics teams actually build.
liveUrl: "https://iran-conflict-portfolio.vercel.app"
---

A multi-view operational intelligence dashboard built to analyze the 2026 Iran–US conflict through structured analytical views rather than geographic storytelling.

## What it includes

- **Escalation Index:** composite score tracking conflict intensity over time
- **Impact Metrics:** economic, humanitarian, and military indicators
- **Regional Map:** geographic overlay of operations and chokepoints
- **Strategic Chokepoints:** Strait of Hormuz, Bab el-Mandeb, energy infrastructure
- **Event Log:** structured timeline of engagements and diplomatic events
- **Actor Force Posture:** military asset tracking by actor
- **Scenario Pathways:** branching analysis of escalation/de-escalation trajectories

## How this differs from the Iran–US Conflict Map

The existing conflict map is a D3-based scrollytelling piece — geographic, narrative-driven, journalism-grade. This dashboard is the analytical complement: structured views, KPIs, scenario modeling. Together they show two distinct ways to approach the same complex dataset.

## Technical approach

- React component architecture with coordinated multi-view layout
- Escalation index computed from weighted event categorization
- Scenario pathway modeling with branching probability estimates
- Responsive grid layout adapting to screen size
