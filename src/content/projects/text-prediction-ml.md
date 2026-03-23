---
title: Text prediction application with machine learning
type: AI Pipeline
template: ai-pipeline
summary: Built an end-to-end NLP application that turned a large text corpus into a predictive language model and deployed it as an interactive Shiny app.
tags: ["AI/ML", "NLP", "Shiny", "R", "Language Modeling"]
stack: ["R", "Shiny", "NLP", "Machine Learning"]
impact: "Shows early end-to-end ML product thinking: data preparation, model design, evaluation, and a user-facing interface for real-time interaction."
legacyUrl: "https://ph13.shinyapps.io/shiny/"
---

# Text prediction application with machine learning

This project started with a classic machine-learning question — how do you predict the next word in a sequence — but the more important part for me was building the full system around that question.

Instead of stopping at model experimentation, I wanted to turn the work into a usable application: something that takes text input, produces predictions in real time, and lets a user interact with the model through a simple interface.

## What I built

- A text-processing workflow for preparing and cleaning a large language corpus
- Feature engineering around n-gram language patterns
- A predictive model for next-word suggestion
- An interactive **Shiny** application that exposed the model through a live interface

## Why it matters

This project is one of the earlier examples in my portfolio of thinking beyond pure analysis. It combines:

- data preparation
- applied NLP
- model evaluation
- deployment into a user-facing tool

That end-to-end shape is still how I like to think about ML work now: not just whether a model can be trained, but whether the full workflow is understandable, repeatable, and useful.

## What this project shows

- practical NLP and language-modeling foundations
- experience moving from raw text data to an interactive application
- willingness to ship a usable interface rather than keep the work stuck in notebooks
- an early throughline toward the AI workflow and RAG-style systems work in my more recent projects

## Takeaway

This project is less about cutting-edge LLM work and more about a pattern that still matters in my portfolio: building complete systems that move from data to model to interface in a way a real user can actually touch.
