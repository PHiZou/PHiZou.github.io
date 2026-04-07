---
title: Macro System Dynamics — Causal Loop Explorer
type: Quant Model
template: quant-model
summary: Interactive causal loop diagram mapping 14 macroeconomic variables, 26 relationships, and 5 feedback loops in the current US economy. Apply scenario shocks and trace how disturbances propagate through monetary, fiscal, and labor systems.
tags: ["Macro", "Systems Dynamics", "Causal Loop", "Economics", "Scenario Analysis"]
stack: ["React", "TypeScript", "SVG", "Systems Dynamics", "Scenario Modeling"]
timeline: Current US macro regime (2025–2026)
impact: Makes macroeconomic feedback structure interactive and explorable — turns textbook systems dynamics into a hands-on analytical tool.
liveUrl: "https://macro-system-dynamics-phizou.vercel.app"
---

An interactive tool for exploring macroeconomic feedback structures in the current US economy. Built on systems dynamics methodology (Sterman, Meadows, Forrester), it models how variables like Fed policy, inflation, employment, credit, and consumer spending interact through reinforcing and balancing feedback loops.

## What it includes

- 14 macro variables with 26 causal relationships
- 5 identified feedback loops (e.g., wage-price spiral, credit-asset loop)
- Node inspection: click any variable to see drivers, polarity, transmission delays
- Loop highlighting: trace full feedback paths through the system
- 6 scenario shocks: oil spike, tariff escalation, Fed cuts, labor weakness, AI boom, fiscal expansion

## Methodology

- Grounded in systems dynamics theory (Sterman 2000, Meadows 2008)
- Polarity and delay classification for each causal link
- Explicit documentation of assumptions and simplifications
- Designed for analysts reasoning about macro regime shifts

## Technical approach

- Pure SVG + React (no D3 or graph library dependency)
- Hand-written layout and interaction logic for full control
- TypeScript with strict mode
- Dark analytical theme optimized for extended reading
