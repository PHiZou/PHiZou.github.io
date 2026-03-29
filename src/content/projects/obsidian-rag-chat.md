---
title: Obsidian RAG Chat
type: AI Pipeline
template: ai-pipeline
summary: "RAG pipeline that turns an Obsidian vault into a searchable, citation-grounded knowledge system using semantic chunking, embeddings, vector retrieval, and a streaming chat interface."
tags: ["RAG", "AI/ML", "Python", "OpenAI", "ChromaDB", "Streamlit", "Vector Search"]
stack: ["Python", "OpenAI GPT-4o-mini", "text-embedding-3-small", "ChromaDB", "Streamlit"]
impact: "Shows the full shape of a useful RAG system: ingestion, chunking strategy, retrieval, citation grounding, and a user-facing interface."
liveUrl: https://obsidian-rag-7fzsf7xqbrkgxqw3c7xh2g.streamlit.app/
---

This project turns a personal Obsidian vault into a live question-answering tool. Instead of searching notes manually, a user types a question and gets a grounded answer — with citations pointing back to the exact source notes the response is built from.

## How it works

The pipeline runs in four stages:

- **Ingestion** — Markdown files are loaded from the vault and cleaned of Obsidian-specific syntax
- **Chunking** — Notes are split using heading-aware boundaries with overlap, so retrieved chunks retain their structural context
- **Retrieval** — Chunks are embedded with `text-embedding-3-small` and stored in ChromaDB; at query time, top-k semantic matches are fetched
- **Response** — GPT-4o-mini generates an answer from the retrieved context, and the Streamlit interface surfaces the source notes so the output is always inspectable

## Design decisions

Retrieval quality was the central design challenge. Splitting notes naively on character count discards the heading hierarchy that gives a note its meaning. Heading-aware chunking keeps related content together, which meaningfully improves what gets surfaced for a given query.

Citation grounding was equally deliberate. The goal was an answer you can verify, not just one that sounds right — so every response links back to its source chunks in the UI.

## What this demonstrates

Building this end-to-end — from ingestion through a deployed Streamlit interface — shows how the components of a RAG system interact in practice: chunking strategy affects retrieval, retrieval quality constrains what the LLM can do, and the interface determines whether the output is actually trustworthy.

## Source Code

<a href="https://github.com/PHiZou/obsidian-rag" target="_blank" rel="noopener noreferrer" class="inline-flex items-center justify-center rounded-full bg-teal-400 px-4 py-2 text-xs font-semibold text-slate-950 shadow-sm transition hover:bg-teal-300 no-underline">
  View source code on GitHub ↗
</a>
