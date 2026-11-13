---
title: Federal Procurement Intelligence Dashboard
type: GovCon Analytics Dashboard
template: govcon-analytics
summary: An earlier dashboard prototype, running on sample data modeled on USASpending.gov records. Explore agency spend, NAICS breakdowns, contractor leaderboards, award trends, and contract type mix across federal acquisitions.
tags: ["BI", "Procurement", "Dashboard", "Sample data"]
stack: ["React", "TypeScript", "Vite", "Recharts"]
impact: A first pass at the dashboard side of procurement analysis, on sample data. Recompete Radar is the version built on real records.
liveUrl: "https://govcon-analytics-dashboard.vercel.app"
---

A procurement dashboard prototype showing federal spending patterns, contractor rankings and acquisition trends. **It runs on sample data, not a live feed.** I built it before Recompete Radar, which does this work on real award records.

## What it includes

- Agency-level spend overview with drill-down
- NAICS code breakdown for industry analysis
- Contractor leaderboard by award volume and value
- Award trend timelines showing spending momentum
- Contract type mix (FFP, T&M, cost-plus) distribution

## Why this matters for analytics engineering

This prototype covers the dashboard layer: aggregation logic and coordinated interactive charts, built entirely on the client with no backend. The data is a sample, so the figures shown are illustrative.

## Technical approach

- Client-side data transformation and aggregation
- Responsive dashboard layout with coordinated views
- Built with React, TypeScript, and Recharts
