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

## 1. Project Overview

An automated AI pipeline that ingests daily world news, distills it into a structured three-stanza poem, narrates with Piper TTS, renders a vertical video via MoviePy, and publishes the output to this page every morning.

## 2. Key Features

- Automation: unattended daily runs
- AI summarization: concise news-to-poem synthesis
- Prompt engineering: stanza structure + factual anchors
- Voice synthesis: Piper TTS narration
- Video generation: vertical format via MoviePy
- Scheduling: cron-driven pipeline
- Reliability: end-to-end asset handoff and publishing

## 3. Technical Architecture Diagram (ASCII)

```
OpenAI -> Stanza Generator -> Piper TTS -> MoviePy Video Builder -> GitHub Pages Publisher
```

## 4. System Design Breakdown

- summarizer: gathers key headlines and extracts salient facts
- poem_writer: crafts a 3-stanza poetic recap with clear narrative flow
- TTS: converts stanzas to narration audio using Piper
- video_maker: assembles captions, audio, and visuals into a vertical MP4 via MoviePy
- cron automation: schedules the pipeline to run daily without manual intervention
- publishing workflow: copies the latest MP4 into the site and updates this page

## 5. Tech Stack

- Python
- OpenAI API (gpt-4o-mini)
- Piper TTS
- MoviePy
- Cron (automation)
- GitHub Pages hosting
- Git versioning + CI/CD (manual push automation)

## 6. Why This Project Matters for Employers

- Demonstrates autonomous AI system design, not just one-off scripts
- Shows practical multimedia pipeline engineering (text → audio → video)
- Real text-to-speech + video orchestration with daily outputs
- Daily automation proves operational reliability and robustness
- Evidence of production-minded engineering over toy notebooks

## 7. Daily Output Feed

Below are the automatically-generated videos. This feed updates daily at 8:00 AM EST.

Under this header, we will append new video entries daily.

## 2025-12-09

<video width="320" controls>
  <source src="/projects/poem-generator/videos/2025-12-09.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

## 8. Future Improvements

- Topic-specific summarization
- Multi-language output
- Dynamic transitions
- Background music
- Audio normalization
- OpenAI Realtime API integration
- AWS Lambda deployment
- Dockerization

## 9. Link to GitHub Repo

<p><a class="btn" href="https://github.com/PHiZou/poem-short-generator-2-" target="_blank">View Source Code on GitHub</a></p>
