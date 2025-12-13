---
title: Daily AI News Poem Generator
type: AI Pipeline
template: ai-pipeline
summary: Automatically generated daily vertical videos summarizing world events as short poems, narrated with local TTS and assembled using MoviePy.
tags: ["AI/ML", "Automation", "Python", "OpenAI", "TTS"]
stack: ["Python", "OpenAI GPT-4o-mini", "Piper TTS", "MoviePy", "Cron"]
impact: Demonstrates end-to-end AI automation pipeline for daily content generation.
---

# Daily AI News Poem Generator

An autonomous AI pipeline that transforms daily world news into engaging vertical video poems, running unattended every morning at 8:00 AM EST.

## Latest Output (2025-12-12)

<div class="not-prose">
  <a
    href="https://daily-poem-xi.vercel.app/20251212_175550"
    target="_blank"
    rel="noopener noreferrer"
    class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-5 py-2 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-teal-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-950"
  >
    Watch the latest daily poem
    <span aria-hidden="true">↗</span>
  </a>
</div>

## Archive

Under this header, we will append new video entries daily.

## 2025-12-09

<video width="320" controls>
  <source src="/projects/poem-generator/videos/2025-12-09.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

## How It Works

**1. OpenAI generates news summary** → Extracts key events from daily headlines

**2. OpenAI converts summary → 3 stanzas** → Structures content into poetic format

**3. Piper TTS narrates each stanza** → Synthesizes natural-sounding speech locally

**4. MoviePy assembles a vertical video** → Combines audio, captions, and visuals into MP4

## Tech Stack

- Python
- OpenAI GPT-4o-mini
- Piper TTS
- MoviePy
- Cron scheduling
- GitHub Pages hosting

## Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   OpenAI    │ --> │   OpenAI    │ --> │ Piper TTS   │ --> │  MoviePy    │
│  Summary    │     │  3 Stanzas  │     │  Narration  │     │   Video     │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
```

## Why This Project Matters

- **Demonstrates end-to-end AI pipeline engineering** — From data ingestion to multimedia output
- **Real daily automation with scheduling + publishing** — Production-ready reliability and CI/CD integration
- **Production-quality multimodal output** — Text, audio, and video orchestration in a single system

## Source Code

<div class="mt-8">
  <a href="https://github.com/PHiZou/poem-short-generator-2-" target="_blank" rel="noopener noreferrer" class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-6 py-3 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-teal-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-950">
    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
    </svg>
    View Source Code on GitHub
  </a>
</div>
