---
title: Sunlight — Federal Recompete Radar
type: GovCon Analytics Dashboard
template: govcon-analytics
summary: A federal contracting intelligence platform that forecasts contract recompetitions across DHS. Surfaces explainable scores for recompete likelihood, incumbent strength, and market concentration — built on free public data, the kind of intelligence usually locked behind $20K+/seat commercial tools.
tags: ["GovCon", "BI", "Procurement", "Analytics Engineering", "Forecasting", "Recompete"]
stack: ["Postgres (Neon)", "dbt-core", "Python", "FastAPI", "Next.js 14", "TypeScript", "Tailwind", "GitHub Actions", "Vercel"]
impact: "$1.25B in identified at-stake obligated value across 191 candidate DHS contracts. Demonstrates a full analytics-engineering stack — ingestion, modeling, scoring, API, and frontend — applied to a real procurement intelligence problem."
liveUrl: "https://sunlight-pi.vercel.app/"
repoUrl: "https://github.com/PHiZou/recompete-radar"
---

Sunlight is a federal contracting intelligence platform that analyzes USASpending.gov data to forecast contract recompetitions across the Department of Homeland Security. It identifies which contracts are expiring soon and ranks them by a composite **recompete score** that weighs contract value, incumbent strength, and competitive opportunity.

The MVP focuses on DHS IT services (NAICS 541511 / 541512) over FY2020–2025 and surfaces $1.25B in obligated value across 191 candidate contracts.

## Recruiter signal

This is the project to start with if you are evaluating me for analytics engineering, data engineering, BI engineering, or GovCon-adjacent data roles.

- **Data engineering**: automated public-data ingestion, normalized award records, and repeatable refresh logic
- **Analytics engineering**: dbt models, tested SQL transformations, scoring logic, and explainable metrics
- **BI / decision support**: contract-level ranking, portfolio views, and user-facing evidence behind each score
- **Product delivery**: FastAPI backend, Next.js frontend, and a deployed live surface instead of a notebook-only prototype

## Why this matters

Procurement intelligence at this depth is normally locked behind commercial tools that charge $20K+/seat/year. Sunlight delivers comparable insights from free public data, with **transparent SQL-based scoring** — no black-box ML — so every score can be decomposed into the evidence that produced it.

## What the platform does

- Ranks contracts by recompete likelihood (0–100), incumbent strength (0–100), and market concentration (HHI, 0–10000)
- Tracks contract portfolios across 10 DHS sub-agencies
- Surfaces award-level evidence behind every score, with vendor entity resolution
- Highlights active POP-end windows and at-stake obligated value
- Provides historical obligation context (FY2020–FY2025)

## Case study shape

**Problem:** GovCon business-development and capture teams need to know which contracts are likely to recompete, but the raw public data is fragmented, hard to interpret, and usually turned into actionable intelligence by expensive commercial platforms.

**What I built:** A full-stack analytics product that ingests public federal award data, models the contracting landscape, scores recompete opportunities, and exposes the results through a live web application.

**Decision it supports:** Which expiring contracts are worth tracking, which incumbents look entrenched, where competition is concentrated, and where public data suggests a plausible capture opportunity.

**Why it is credible:** The scoring is transparent and evidence-backed. A user can trace a score back to the award-level records and the business logic behind it.

## Technical architecture

The core analytical cell is **(Agency, NAICS, PSC, Time)** — every score is computed at that grain and traceable back to award-level transactions.

- **Ingestion**: Python jobs orchestrated via GitHub Actions, pulling prime award transactions from USASpending.gov
- **Warehouse**: Postgres (Neon) as the analytical store
- **Transformation**: dbt-core for modeling, scoring logic, and tested SQL
- **API**: FastAPI service exposing scored cells and underlying evidence
- **Frontend**: Next.js 14 + TypeScript + Tailwind, deployed on Vercel

## Data model and scoring

The project treats federal procurement data as an analytics-engineering problem rather than a static dashboard problem. The useful object is not a single award row; it is a scored contracting cell with enough historical context to support prioritization.

- **Recompete score**: estimates how attractive or time-sensitive a recompete opportunity is
- **Incumbent strength**: captures whether the current vendor appears difficult to displace
- **Market concentration**: uses HHI-style concentration logic to show whether a space is crowded or dominated
- **At-stake value**: aggregates obligated value so opportunity ranking is tied to contract dollars, not only counts

## What this project demonstrates

Sunlight is the clearest single example of how I think about analytics engineering end-to-end: ingestion → warehouse → modeling → API → product, applied to a real problem with a real user (GovCon BD and capture teams). The scoring is explicit and explainable, which is the kind of trust property that matters for actual decision support — not just dashboard theater.

## Roadmap

- Expand beyond DHS IT services to additional agencies and NAICS codes
- Integrate SAM.gov solicitation data for forward-looking signals
- Add forecasting and notification workflows for tracked contracts
