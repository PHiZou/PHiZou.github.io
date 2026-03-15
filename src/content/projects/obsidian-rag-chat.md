---
title: Obsidian RAG Chat
type: AI Pipeline
template: ai-pipeline
summary: End-to-end RAG pipeline that lets you chat with an Obsidian knowledge base — semantic chunking, OpenAI embeddings, ChromaDB vector search, and a streaming Streamlit UI with source citations.
tags: ["RAG", "AI/ML", "Python", "OpenAI", "ChromaDB", "Streamlit", "Vector Search"]
stack: ["Python", "OpenAI GPT-4o-mini", "text-embedding-3-small", "ChromaDB", "Streamlit"]
impact: Demonstrates full RAG architecture from vault ingestion through streamed, citation-grounded answers.
liveUrl: https://obsidian-rag-7fzsf7xqbrkgxqw3c7xh2g.streamlit.app/
---

# Obsidian RAG Chat

A full end-to-end **Retrieval-Augmented Generation (RAG)** pipeline that turns a folder of Obsidian markdown notes into a conversational knowledge base. Ask a question in natural language — the system retrieves the most relevant note chunks and generates a grounded, cited answer in real time.

## Live Demo

<div class="my-6">
  <a href="https://obsidian-rag-7fzsf7xqbrkgxqw3c7xh2g.streamlit.app/" target="_blank" rel="noopener noreferrer"
     class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-6 py-3 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300">
    Launch Live Demo ↗
  </a>
</div>

## Architecture

```
Obsidian Vault (.md files)
        │
        ▼
  [ingest.py]
  ┌──────────────────────────────────────┐
  │  1. Walk vault, read .md files       │
  │  2. Strip Obsidian syntax            │
  │  3. Split by headings + sliding      │
  │     window chunking (~600 tokens)    │
  │  4. Embed: text-embedding-3-small    │
  │  5. Store in ChromaDB (persistent)   │
  └──────────────────────────────────────┘
        │
        ▼
   ChromaDB vector store
        │
        ▼
  [app.py — Streamlit UI]
  ┌──────────────────────────────────────┐
  │  1. User types question              │
  │  2. Embed query (same model)         │
  │  3. Cosine similarity → top-k chunks │
  │  4. Chunks + question → GPT-4o-mini  │
  │  5. Stream answer to UI              │
  │  6. Expand source note citations     │
  └──────────────────────────────────────┘
```

## Key Features

- **Heading-aware chunking** — Notes are split at H1/H2/H3 boundaries to preserve semantic coherence, with configurable overlap between chunks
- **Incremental ingestion** — Re-running `ingest.py` only embeds new or changed chunks (content-hash deduplication), keeping costs minimal
- **Streamed responses** — GPT-4o-mini answers stream token-by-token so there's no waiting
- **Source citations** — Every answer expands to show which notes and sections were retrieved, with a snippet preview
- **Configurable retrieval** — Sidebar slider controls how many source chunks to retrieve (2–10)
- **Sample vault included** — 12 notes across GovCon, Data Engineering, AI/ML, and Quant topics for an out-of-the-box demo

## Chunking Strategy

One of the interesting engineering decisions in this project is how to split long markdown notes into good retrieval chunks. The approach:

1. **Strip Obsidian syntax** — Remove frontmatter, convert `[[wiki links]]` to plain text, strip `#tags`
2. **Split by headings** — Each H1/H2/H3 section becomes a candidate chunk, preserving the document's semantic structure
3. **Sliding window fallback** — Sections longer than ~600 tokens are further split with a configurable overlap (default: 80 tokens) to avoid cutting context mid-thought
4. **Filter stubs** — Chunks shorter than 60 characters are discarded (usually just heading lines)

This produces ~20 chunks per 500-word note on average, with natural semantic boundaries.

## Tech Stack

| Component | Tool |
|-----------|------|
| Embeddings | OpenAI `text-embedding-3-small` |
| Chat model | OpenAI `gpt-4o-mini` |
| Vector store | ChromaDB (local persistent) |
| UI | Streamlit |
| Note format | Markdown (Obsidian-compatible) |

## Cost

Ingesting the 12-note sample vault costs approximately **$0.001** in embedding calls. Each chat query costs **$0.001–0.003** depending on response length. The full demo is essentially free to run.

## Source Code

<div class="mt-8">
  <a href="https://github.com/PHiZou/obsidian-rag" target="_blank" rel="noopener noreferrer"
     class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-6 py-3 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-teal-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-950">
    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
    </svg>
    View Source Code on GitHub
  </a>
</div>
