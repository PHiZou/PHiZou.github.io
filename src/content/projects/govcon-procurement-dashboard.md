---
title: Federal Procurement Intelligence Dashboard
type: GovCon Analytics Dashboard
template: govcon-analytics
summary: Interactive procurement analytics dashboard powered by the USASpending.gov API. Explore agency spend, NAICS breakdowns, contractor leaderboards, award trends, and contract type mix across federal acquisitions.
tags: ["GovCon", "BI", "API", "Procurement", "Dashboard"]
stack: ["React", "TypeScript", "Vite", "USASpending API", "Recharts"]
impact: Transforms raw federal procurement data into actionable intelligence — the kind of tool a GovCon BD team or analytics engineer would actually build and use.
liveUrl: "https://govcon-analytics-dashboard.vercel.app"
---

A live procurement intelligence dashboard that queries the USASpending.gov API to surface federal spending patterns, contractor rankings, and acquisition trends.

## What it includes

- Agency-level spend overview with drill-down
- NAICS code breakdown for industry analysis
- Contractor leaderboard by award volume and value
- Award trend timelines showing spending momentum
- Contract type mix (FFP, T&M, cost-plus) distribution

## Why this matters for analytics engineering

This project demonstrates the full BI stack in a single application: API data ingestion, transformation, aggregation logic, and interactive visualization — built without a backend, entirely on the client. It reflects the kind of analytical product that procurement intelligence teams, federal consultancies, and GovCon BD shops rely on.

## Technical approach

- Direct integration with USASpending.gov REST API
- Client-side data transformation and aggregation
- Responsive dashboard layout with coordinated views
- Built with React, TypeScript, and Recharts for production-quality charting
