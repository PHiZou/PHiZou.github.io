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

# Obsidian RAG Chat

This project turns a folder of Obsidian notes into a conversational knowledge system. A user asks a question, the app retrieves the most relevant note chunks, and the interface returns a grounded answer with visible source citations.

## What I built

- Markdown vault ingestion and note cleanup
- Heading-aware chunking with overlap
- ChromaDB vector storage and top-k retrieval
- Streamlit chat interface with source citations

## Why it matters

What makes this project valuable is that it treats retrieval as a real systems problem, not just an LLM demo. The key questions were:
- how to preserve enough note structure for better retrieval
- how to keep answers inspectable
- how to build the full loop from ingestion to interface

## What this project shows

- practical RAG system design
- document-structure and retrieval-quality thinking
- ability to build a usable AI workflow end to end
- interest in grounded, inspectable AI systems rather than black-box output

## Source Code

[View Source Code on GitHub](https://github.com/PHiZou/obsidian-rag)
