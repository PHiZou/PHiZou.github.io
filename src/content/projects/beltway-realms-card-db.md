---
title: Beltway Realms Card Database
type: Game
template: game
summary: A FUTBin-style searchable card database for Beltway Realms — 700 cards with full-text search, side-by-side comparison, a synergy-aware loadout builder, community ratings, and win-rate stats. Built on SQLite FTS5 + Hono API + React.
tags: ["React", "TypeScript", "SQLite", "Hono", "Node.js", "Full-Stack", "Game"]
stack: ["React 19", "TypeScript", "Vite", "SQLite (FTS5)", "Hono.js", "better-sqlite3", "React Router 7"]
impact: Full-stack companion hub for Beltway Realms — browse, filter, compare, and theory-craft loadouts across 700 cards with live synergy feedback.
---

# Beltway Realms Card Database

A full-stack **FUTBin-style card database** for the Beltway Realms universe — 700 unique cards spanning 6 DC-metro regions, with full-text search, multi-card comparison, a synergy-aware loadout builder, community ratings, and win-rate analytics.

## Architecture

```
┌─────────────────────────────┐     ┌──────────────────────────────┐
│   React 19 + TypeScript     │     │   Hono.js API (Node.js)      │
│                             │     │                              │
│  CardListPage               │────▶│  GET /api/cards              │
│  CardDetailPage             │     │  GET /api/cards/:id          │
│  ComparePage                │     │  GET /api/cards/:id/similar  │
│  LoadoutBuilderPage         │     │  GET /api/cards/compare      │
│                             │     │  POST /api/loadouts          │
│  Components:                │     │  POST /api/cards/:id/rate    │
│  CardGrid / CardTable       │     │  GET /api/stats/popular      │
│  FilterSidebar              │     │  GET /api/stats/winrate      │
│  StatRadar (5-axis chart)   │     │                              │
│  CardPreview (popover)      │     └──────────────┬───────────────┘
└─────────────────────────────┘                    │
                                                   ▼
                                    ┌──────────────────────────┐
                                    │   SQLite (beltway.db)    │
                                    │                          │
                                    │  cards (700 rows)        │
                                    │  card_tags (many-many)   │
                                    │  card_variants           │
                                    │  card_ratings            │
                                    │  card_usage_stats        │
                                    │  loadouts                │
                                    │  regions                 │
                                    │  cards_fts (FTS5 index)  │
                                    └──────────────────────────┘
```

## Card Taxonomy

**6 card types** — Quest, Dialogue, Skill, Insight, Event, Artifact

**5 rarity tiers** — Common (40%) → Uncommon (30%) → Rare (18%) → Epic (9%) → Legendary (3%)

**6 regions** — Arlington, Reston, Tysons, Ashburn, DC/Citadel, Neutral

**Stats per card** — modifier (power level), versatility, synergy, reliability, ceiling

## Key Features

### Search & Filtering
Full-text search via **SQLite FTS5** with Porter stemming and unicode61 tokenization across card name, description, and flavor text. Filter sidebar supports type, rarity, region, modifier range, and tag autocomplete. URL-synced filter state means every search is shareable.

### Card Comparison Tool
Compare 2–4 cards side-by-side on a normalized stat block. Quick multi-select from the list view feeds directly into the compare page.

### Loadout Builder
The centerpiece feature — build a 3–5 card hand and get real-time synergy feedback:

| Combo | Effect |
|-------|--------|
| 2+ cards, same region | +1 modifier per card |
| 3+ cards sharing a tag | +1 modifier per card |
| All cards same rarity | +2 modifier per card |
| Artifact + matching Skill | Artifact triggers twice |
| Event + matching Quest | Event auto-triggers |

Completed loadouts save to SQLite and share via URL.

### Recommendation Engine
Each card detail page surfaces similar cards via a scoring algorithm: card type match (+2), same region (+2), same rarity (+1), modifier proximity (+1), shared tags (+1 each). Returns top 6 ranked candidates.

### Community & Stats
- Per-card **ratings** (1–5 stars with comments)
- **Usage stats** dashboard — most-played cards and highest win-rate (minimum 50 plays threshold)
- Aggregated avg rating and rating count on card detail pages

## Database Design

SQLite with WAL mode for concurrent reads. The schema uses proper foreign keys, indexes on hot filter columns (type, rarity, region_id, modifier), and a virtual **FTS5** table mirroring card text for full-text search. Cards are generated via seeded RNG with region-specific vocabulary, then curated to 700 final entries.

## Tech Stack

| Layer | Tools |
|-------|-------|
| Frontend | React 19, TypeScript, Vite 6, React Router 7 |
| Backend | Node.js, Hono.js, TypeScript |
| Database | SQLite, better-sqlite3, FTS5 |
| Dev tooling | tsx, Vite proxy |

## Source Code

<div class="mt-8">
  <a href="https://github.com/PHiZou/beltway-realms-card-db" target="_blank" rel="noopener noreferrer"
     class="inline-flex items-center gap-2 rounded-full bg-teal-400 px-6 py-3 text-sm font-semibold text-slate-950 shadow-sm transition-colors hover:bg-teal-300 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-teal-400 focus-visible:ring-offset-2 focus-visible:ring-offset-slate-950">
    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
      <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
    </svg>
    View Source Code on GitHub
  </a>
</div>
