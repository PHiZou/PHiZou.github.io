---
title: "FlowState: Supply Chain Resilience Simulator"
type: D3 Visualization
template: d3-visualization
summary: Interactive supply chain simulator built on a colored Petri Net engine. Model 8-stage supply chains with animated token flow, inject disruption scenarios, and detect bottlenecks in real time.
tags: ["Simulation", "Systems Thinking", "Petri Net", "Operations", "Supply Chain"]
stack: ["React", "TypeScript", "Vite", "Colored Petri Net Engine", "SVG Animation"]
impact: Demonstrates systems-level operational thinking — modeling supply chains as state machines with flow dynamics, not just static dashboards.
liveUrl: "https://supply-chain-petri-net-phizou.vercel.app"
---

FlowState is an interactive simulator that models supply chain resilience using a colored Petri Net engine — a formal computational model for concurrent systems with state, flow, and resource constraints.

## What it includes

- 8-stage supply chain model (sourcing through delivery)
- Animated token flow showing material and information movement
- Disruption scenario injection (port closure, supplier failure, demand spike)
- Real-time metrics: throughput, cycle time, utilization, WIP
- Bottleneck detection with visual highlighting

## Why this matters

Supply chain modeling is fundamentally a data engineering problem: events flow through stages, state accumulates, bottlenecks emerge from capacity constraints. This project shows that I can reason about systems dynamics — not just query data, but model the processes that generate it.

## Technical approach

- Custom colored Petri Net engine handling tokens, transitions, and guard conditions
- SVG-based visualization with animated token movement
- Scenario system for injecting disruptions at specific supply chain stages
- Metrics computed from simulation state in real time
