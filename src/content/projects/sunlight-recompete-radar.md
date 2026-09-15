---
title: Sunlight — Federal Recompete Radar
type: GovCon Analytics Dashboard
template: govcon-analytics
summary: A federal contracting intelligence platform that forecasts contract recompetitions across six federal agencies. Surfaces explainable scores for recompete likelihood and incumbent strength — built on free public data, the kind of intelligence usually locked behind $20K+/seat commercial tools.
tags: ["GovCon", "BI", "Procurement", "Analytics Engineering", "Forecasting", "Recompete"]
stack: ["Postgres (Neon)", "dbt-core", "Python", "FastAPI", "Next.js 14", "TypeScript", "Tailwind", "GitHub Actions", "Fly.io", "Vercel"]
impact: "$56.0B in at-stake obligated value across 4,287 recompete candidates in six agencies (Sept 2026). Demonstrates a full analytics-engineering stack — ingestion, modeling, scoring, API, and frontend — plus a SQL analysis layer that stress-tests its own scoring."
liveUrl: "https://recompete-radar.vercel.app/"
repoUrl: "https://github.com/PHiZou/recompete-radar"
---

Sunlight is a federal contracting intelligence platform that analyzes USASpending.gov data to forecast contract recompetitions across HHS, VA, DHS, Treasury, Commerce, and SSA. It identifies which contracts are expiring soon and ranks them by a composite **recompete score** that weighs contract value, incumbent strength, and competitive opportunity.

The current scope covers IT and data services (NAICS 541511 / 541512 / 518210) across six agencies — about 65K awards with periods of performance from 1996 to 2034 — and surfaces $56.0B in at-stake obligated value across 4,287 recompete candidates (36-month window, as of September 2026).

## Recruiter signal

This is the project to start with if you are evaluating me for analytics engineering, data engineering, BI engineering, or GovCon-adjacent data roles.

- **Data engineering**: automated public-data ingestion, normalized award records, and repeatable weekly refresh logic
- **Analytics engineering**: dbt models, tested SQL transformations, scoring logic, and explainable metrics
- **BI / decision support**: contract-level ranking, portfolio views, and user-facing evidence behind each score
- **Product delivery**: FastAPI backend on Fly.io, Next.js frontend on Vercel, and a deployed live surface instead of a notebook-only prototype

## Why this matters

Procurement intelligence at this depth is normally locked behind commercial tools that charge $20K+/seat/year. Sunlight delivers comparable insights from free public data, with **transparent SQL-based scoring** — no black-box ML — so every score can be decomposed into the evidence that produced it.

## What the platform does

- Ranks contracts by explainable recompete and incumbent-strength scores
- Tracks contract portfolios across sub-agencies in six federal departments
- Surfaces award-level evidence behind every score (vendor entity resolution is in progress)
- Highlights active POP-end windows and at-stake obligated value
- Publishes an [Insights page](https://recompete-radar.vercel.app/insights) with the strongest findings from the SQL analysis layer

## What the SQL analysis found

I wrote a set of analysis queries against the warehouse to test what the data can actually support — including where my own scoring model falls short:

- **"Full and open" competition often draws one bidder**: 54–62% of full-and-open awards in every agency received a single offer — $39.0B where the competitive label describes the procedure, not the outcome
- **Offer counts have traps**: parent IDIQ vehicles report offers on the vehicle rather than the order, and at least one award type uses 999 as a placeholder, so every offer-based query filters them out
- **The incumbent-strength score saturates**: 54% of candidates tie at its structural maximum of 65, so the ranking needs recalibration
- **Mid-size specialists retain work best**: in a backtest with a placebo control, incumbents with roughly $20–90M in scope retained contracts most often (36%) and the largest primes least (27%) — the reverse of what a size-weighted score assumes. The pattern has held on three successively larger data scopes

## Case study shape

**Problem:** GovCon business-development and capture teams need to know which contracts are likely to recompete, but the raw public data is fragmented, hard to interpret, and usually turned into actionable intelligence by expensive commercial platforms.

**What I built:** A full-stack analytics product that ingests public federal award data, models the contracting landscape, scores recompete opportunities, and exposes the results through a live web application.

**Decision it supports:** Which expiring contracts are worth tracking, which incumbents look entrenched, and where public data suggests a plausible capture opportunity.

**Why it is credible:** The scoring is transparent and evidence-backed. A user can trace a score back to the award-level records and the business logic behind it — and the analysis layer documents where the scores are and aren't trustworthy.

## Technical architecture

The core analytical cell is **(Agency, NAICS, PSC, Time)** — every score is computed at that grain and traceable back to award-level records.

- **Ingestion**: Python jobs orchestrated via a weekly GitHub Actions refresh, pulling prime award summaries from USASpending.gov
- **Warehouse**: Postgres (Neon) as the analytical store
- **Transformation**: dbt-core for modeling, scoring logic, and tested SQL
- **API**: FastAPI service on Fly.io exposing scored candidates and underlying evidence
- **Frontend**: Next.js 14 + TypeScript + Tailwind, deployed on Vercel

## Data model and scoring

The project treats federal procurement data as an analytics-engineering problem rather than a static dashboard problem. The useful object is not a single award row; it is a scored contracting cell with enough historical context to support prioritization.

- **Recompete score**: estimates how attractive or time-sensitive a recompete opportunity is
- **Incumbent strength**: captures whether the current vendor appears difficult to displace
- **At-stake value**: aggregates obligated value so opportunity ranking is tied to contract dollars, not only counts

## What this project demonstrates

Sunlight is the clearest single example of how I think about analytics engineering end-to-end: ingestion → warehouse → modeling → API → product, applied to a real problem with a real user (GovCon BD and capture teams). The scoring is explicit and explainable, and I test it against the data rather than assuming it works — the kind of trust property that matters for actual decision support, not just dashboard theater.

## Roadmap

- Recalibrate incumbent-strength scoring using the retention backtest findings
- Integrate SAM.gov solicitation data for forward-looking signals
- Add forecasting and notification workflows for tracked contracts
