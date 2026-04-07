---
title: Fraud Risk Analyzer — Bayesian Network
type: Quant Model
template: quant-model
summary: Interactive Bayesian Belief Network for transaction fraud detection. Models probabilistic relationships between transaction attributes to calculate fraud risk scores with explainable factor contributions.
tags: ["Bayesian Network", "Fraud Detection", "Risk Modeling", "Quantitative Analysis"]
stack: ["Python", "Bayesian Inference", "pgmpy", "Flask", "JavaScript"]
impact: Demonstrates probabilistic graphical modeling for real-world risk scoring—translating uncertain evidence into actionable fraud probabilities.
liveUrl: "https://fraud-bayesian-analyzer.vercel.app"
---

A Bayesian Belief Network implementation for financial fraud risk scoring. Unlike black-box ML models, this approach uses probabilistic graphical modeling to capture domain knowledge about fraud indicators and their interdependencies.

## What It Models

The network reasons about:
- **Account Age** — New accounts carry higher baseline risk
- **Past Fraud History** — Previous fraud is highly predictive
- **Transaction Amount** — High-value transactions warrant scrutiny
- **Time of Day** — Late-night activity correlates with fraud
- **Location** — International transactions increase risk
- **Transaction Velocity** — Rapid-fire transactions signal automation

## Technical Approach

- **Bayesian Inference** — Updates prior fraud beliefs with transaction evidence
- **Explainable Scoring** — Shows which factors drive the risk assessment
- **Scenario Testing** — Quick presets for common fraud patterns:
  - Routine Purchase (Low Risk ~2%)
  - Suspicious International (High Risk ~65%)
  - Late Night High-Value (Medium-High ~45%)
  - New Account Velocity Spike (Very High ~85%)

## Why Bayesian Networks for Fraud

Traditional ML models can achieve high accuracy but lack transparency. Bayesian networks explicitly model causal relationships and provide:
- Clear factor contribution breakdowns
- Natural handling of missing evidence
- Domain knowledge integration
- Uncertainty quantification

This project demonstrates the quant analyst skill of building interpretable risk models for high-stakes decisions.
