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

## Project Overview

Building production-grade AI systems requires more than just model integration—it demands thoughtful orchestration, reliable automation, and end-to-end ownership. This project demonstrates exactly that: a fully autonomous pipeline that transforms daily world news into engaging vertical video content, running unattended every morning at 8:00 AM EST.

The system ingests current events, leverages advanced prompt engineering to distill complex information into structured three-stanza poems, synthesizes natural-sounding narration using local text-to-speech, and assembles polished vertical videos optimized for modern content consumption. What makes this project stand out isn't just the AI components—it's the engineering rigor behind making it run reliably, day after day, without manual intervention.

This represents real production engineering: error handling, automated publishing workflows, version control integration, and the kind of systems thinking that hiring managers look for in data engineering, ML engineering, and AI product roles.

## Key Features

**Automated Daily Execution**: The pipeline runs unattended via cron scheduling, demonstrating operational reliability and hands-off automation. Each morning, the system wakes up, processes the latest news, and publishes fresh content without requiring any manual intervention.

**Intelligent News Summarization**: Using OpenAI's GPT-4o-mini, the system extracts salient facts from daily headlines and synthesizes them into coherent, structured narratives. This isn't simple summarization—it's a carefully engineered prompt system that maintains factual accuracy while creating engaging poetic structure.

**Advanced Prompt Engineering**: The poem generation relies on sophisticated prompt design that enforces three-stanza structure, maintains narrative flow, and anchors content to factual events. This demonstrates practical understanding of how to extract desired outputs from LLMs through systematic prompt design.

**Local Text-to-Speech Synthesis**: Rather than relying on cloud TTS services, the system uses Piper TTS for local voice synthesis, reducing costs, improving latency, and demonstrating infrastructure independence. The TTS integration handles text normalization, prosody, and audio file generation seamlessly.

**Professional Video Assembly**: MoviePy orchestrates the complex task of combining narration audio, synchronized captions, and visual elements into polished vertical MP4 videos. This requires precise timing, frame-rate management, and format optimization—real multimedia pipeline engineering.

**End-to-End Publishing Workflow**: The system doesn't just generate content—it automatically commits videos to version control, updates the project page, and triggers deployment. This demonstrates CI/CD thinking and full-stack ownership from generation to publication.

## Technical Architecture

The pipeline follows a modular, fault-tolerant design where each component handles a specific transformation stage:

```
┌─────────────┐
│ News Input  │  (Daily world events)
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│  Summarizer     │  (OpenAI API: Extract key facts)
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│  Poem Writer    │  (GPT-4o-mini: Structured 3-stanza generation)
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│  TTS Engine     │  (Piper: Local voice synthesis)
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│  Video Builder  │  (MoviePy: Audio + captions + visuals → MP4)
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│  Publisher      │  (Git workflow: Commit → Push → Deploy)
└─────────────────┘
```

Each stage includes error handling and logging, ensuring that failures are caught and reported rather than silently breaking the pipeline. The architecture prioritizes reliability and observability over complexity.

## System Design Breakdown

**Summarizer Module**: The summarizer component ingests daily news feeds and uses structured prompts to extract the most significant events. It filters noise, identifies key themes, and prepares structured data for the poem generation stage. Error handling includes API retry logic and fallback mechanisms for API failures.

**Poem Writer**: This is where prompt engineering shines. The poem writer uses carefully crafted prompts that enforce three-stanza structure while maintaining factual accuracy. The prompts include examples, constraints, and style guidelines that guide GPT-4o-mini to produce consistent, high-quality output. The module handles token limits, manages context windows, and implements temperature controls for creative consistency.

**TTS Engine**: The Piper TTS integration converts generated text into natural-sounding speech. This involves text normalization (handling numbers, abbreviations, punctuation), prosody control, and audio file generation. The system uses a pre-trained voice model optimized for clarity and naturalness. Local processing eliminates API costs and latency concerns while maintaining quality.

**Video Maker**: MoviePy handles the complex orchestration of combining audio tracks, synchronized text captions, background visuals, and transitions into a cohesive vertical video. This requires precise frame-level timing, audio-video synchronization, and format optimization for web delivery. The module manages memory efficiently for longer videos and handles encoding parameters for optimal file size and quality balance.

**Cron Automation**: The scheduling layer ensures the pipeline runs reliably every day. Cron configuration includes proper environment variable setup, logging redirection, and error notification. The system is designed to be resilient to temporary failures—if one day's run fails, the next day's execution proceeds normally.

**Publishing Workflow**: The final stage demonstrates full-stack thinking. The publishing workflow copies generated videos to the appropriate directory, updates the project markdown file, commits changes to git, and pushes to trigger GitHub Pages deployment. This requires careful file path management, git command orchestration, and handling of edge cases like duplicate entries or missing files.

## Tech Stack

**AI & Machine Learning**:
- **Python**: Core language for all pipeline components, chosen for its rich ecosystem of AI/ML libraries and straightforward automation scripting
- **OpenAI API (GPT-4o-mini)**: Cost-effective LLM for text generation, selected for its balance of capability and API pricing
- **Prompt Engineering**: Custom prompt design patterns that enforce structure and maintain quality

**Media Processing**:
- **Piper TTS**: Local text-to-speech synthesis engine, chosen for quality, speed, and cost-effectiveness compared to cloud services
- **MoviePy**: Python library for video editing and assembly, selected for its programmatic control and Python-native API

**Infrastructure & Automation**:
- **Cron**: Unix job scheduler for daily automation, providing reliable, system-level scheduling
- **Git**: Version control for tracking generated content and managing deployments
- **GitHub Pages**: Static site hosting with automatic deployment via GitHub Actions
- **GitHub Actions**: CI/CD pipeline that builds and deploys the site on every push

The technology choices reflect a focus on reliability, cost-effectiveness, and maintainability. Each component was selected not just for its capabilities, but for how it fits into a production-ready system.

## Why This Project Matters for Employers

For **Data Engineering** roles, this project demonstrates the ability to design and implement reliable ETL pipelines. The system handles data ingestion (news feeds), transformation (summarization and poem generation), and loading (video publishing) in a fully automated workflow. The error handling, logging, and monitoring patterns shown here translate directly to production data pipelines.

For **ML Engineering** positions, this showcases practical AI system design beyond notebook experimentation. The project demonstrates prompt engineering at scale, model integration patterns, and the orchestration of multiple AI services into a cohesive system. The focus on reliability, cost optimization (using GPT-4o-mini instead of GPT-4), and local processing shows production-minded ML engineering.

For **AI Product Engineering** roles, this project illustrates end-to-end product thinking. It's not just about the AI components—it's about building a complete system that delivers value autonomously. The daily execution proves operational reliability, the automated publishing demonstrates CI/CD thinking, and the focus on user experience (vertical video format, natural narration) shows product awareness.

What sets this apart from typical portfolio projects is the emphasis on **operational excellence**. This isn't a one-off demo or a notebook experiment—it's a system that runs daily, handles errors gracefully, and demonstrates the kind of engineering rigor that hiring managers look for. The fact that it's been running reliably and producing daily outputs shows real engineering capability, not just theoretical knowledge.

The project also demonstrates **full-stack ownership**: from API integration to media processing to deployment automation. This breadth of capability is increasingly valuable in modern engineering roles where boundaries between data, ML, and infrastructure are blurring.

## Daily Output Feed

The videos below represent the daily output of this automated pipeline. Each video is generated automatically every morning at 8:00 AM EST, demonstrating the system's consistent operational reliability. The feed updates automatically as new videos are published, showcasing real-world automation in action.

Under this header, we will append new video entries daily.

## 2025-12-09

<video width="320" controls>
  <source src="/projects/poem-generator/videos/2025-12-09.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

## Future Improvements

**Content Enhancement**:
- **Topic-specific summarization**: Allow filtering by news category (technology, finance, geopolitics) to create targeted content streams
- **Multi-language output**: Extend the pipeline to generate videos in multiple languages, demonstrating internationalization capabilities
- **Dynamic transitions**: Implement more sophisticated video transitions and visual effects to improve production quality

**Technical Enhancements**:
- **Audio normalization**: Add automatic gain control and noise reduction to ensure consistent audio quality across all outputs
- **OpenAI Realtime API integration**: Explore the Realtime API for more natural, conversational narration with improved prosody
- **Background music**: Integrate royalty-free music tracks with automatic volume ducking during narration

**Infrastructure & Scalability**:
- **AWS Lambda deployment**: Migrate to serverless architecture for better scalability and cost optimization, demonstrating cloud engineering skills
- **Dockerization**: Containerize the pipeline for consistent execution across environments and easier deployment
- **Monitoring & alerting**: Add comprehensive logging, metrics collection, and alerting for production-grade observability

These improvements reflect a forward-thinking engineering mindset focused on scalability, quality, and operational excellence. Each enhancement addresses real limitations while demonstrating understanding of production system requirements.

## Source Code

<div class="mt-8">
  <a href="https://github.com/PHiZou/poem-short-generator-2-" target="_blank" rel="noopener noreferrer" class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-6 py-3 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-teal-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-950">
    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
    </svg>
    View Source Code on GitHub
  </a>
</div>
