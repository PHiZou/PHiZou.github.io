---
title: The Yield Curve — An Interactive History
type: D3 Visualization
template: d3-visualization
summary: Interactive D3.js visualization tracing 34 years of US Treasury yield curve history. Explore how the curve has shifted through recessions, expansions, and pivotal economic moments.
tags: ["D3.js", "Finance", "Economics", "Time Series", "Data Visualization"]
stack: ["D3.js", "JavaScript", "HTML5", "CSS3"]
impact: Transforms complex macroeconomic data into an explorable narrative—making 34 years of yield curve history accessible and intuitive.
liveUrl: "https://yield-curve-history.vercel.app"
---

An interactive journey through the US Treasury yield curve from 1990 to 2024. The yield curve—inverting before every recession since 1955—is one of the most watched indicators in macroeconomics. This visualization makes its history explorable.

## What It Shows

- **34 Years of Data** — Monthly yield curves across Treasury maturities (3-month to 30-year)
- **Recession Overlays** — Gray bands mark official NBER recession periods
- **Interactive Scrubbing** — Drag through time to watch the curve evolve
- **Key Events** — Annotations for major economic moments

## The Yield Curve as Signal

The visualization demonstrates:
- **Normal Curve** — Upward sloping (long-term rates > short-term rates)
- **Flat Curve** — Similar yields across maturities
- **Inverted Curve** — Downward sloping (short-term > long-term), historically predictive of recession

## Notable Patterns Visible in the Data

- The steep inversion before the 2001 dot-com crash
- The dramatic 2007-2008 inversion preceding the financial crisis
- The brief 2019 inversion before the COVID recession
- The deepest inversion in 40+ years in 2023

## Technical Implementation

- D3.js for dynamic SVG curve rendering
- Smooth transitions between time periods
- Responsive design for various screen sizes
- Optimized data loading for 400+ monthly observations

This project demonstrates the ability to turn dense time-series macro data into clear, explorable visual narratives.
