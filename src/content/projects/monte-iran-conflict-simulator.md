---
slug: monte-iran-conflict-simulator
title: Monte Carlo Iran conflict scenario simulator
type: Quant Model
template: quant-model
summary: Research-oriented Monte Carlo simulation with a polished Streamlit UI for exploring escalation paths, Hormuz disruption, oil-price outcomes, volatility spillover, and sector effects in a way a non-quant reader can actually interpret.
stack:
  - Python
  - Monte Carlo Simulation
  - Streamlit
  - Plotly
  - Scenario Analysis
  - Geopolitical Risk Modeling
timeline: Near-term conflict path and market-spillover scenarios
impact: Turns a messy geopolitical question into interpretable scenario cards, distributions, and plain-English takeaways without pretending to predict the future.
---
## What this project is

This project explores the Iran conflict as a **scenario-analysis problem**, not a deterministic forecast. Instead of pretending there is one "right" future, it models multiple paths such as diplomatic cooling, frozen tension, proxy escalation, limited strikes, and broader regional conflict, then simulates how those paths could affect oil, shipping disruption, volatility, duration, and sector stress.

The goal was to make geopolitical uncertainty easier to reason about for a human reader, not just for a spreadsheet.

## What the simulator shows

The local app is built around a Monte Carlo engine plus a high-trust UI. It highlights:

- headline scenario probabilities
- Hormuz disruption risk and severity
- oil-price distributions rather than single-point guesses
- volatility and spillover ranges
- sector-level directional sensitivity
- plain-English takeaways about what changed when assumptions shift

## Why the UI matters

A lot of risk tools become unreadable as soon as the math starts. This one was intentionally designed to stay interpretable.

The interface leads with:

- top-level scenario cards
- narrative summaries
- simple controls for scenario weights and baseline assumptions
- charts that answer "so what?" instead of just dumping distributions

That makes it useful as a **thinking tool** for geopolitical and market uncertainty, even if you are not a quant.

## Research framing

This is a **research and educational tool only**. It is meant for scenario analysis, not operational planning and not investment advice.

## Live demo

- App: <https://t6x2tnpzu5rtxedqdcvgfh.streamlit.app/>
- Code: <https://github.com/PHiZou/monte-iran>

## Current status

The project is now live as a public Streamlit application, with the GitHub repo available for review and extension.
