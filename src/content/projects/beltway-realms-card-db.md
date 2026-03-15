---
title: Beltway Realms Card Database
type: Game
template: game
summary: A FUTBin-style searchable card database for Beltway Realms — ~700 cards with filtering, comparison, and loadout builder. SQLite + Node/Hono API + React frontend.
tags: ["React", "TypeScript", "SQLite", "Hono", "API", "Game"]
stack: ["React", "TypeScript", "Vite", "SQLite", "Hono", "better-sqlite3"]
impact: Companion data hub for the Beltway Realms game — browse, filter, compare cards, and theory-craft loadouts before encounters.
---

A FUTBin-style searchable card database for **Beltway Realms** — roughly 700 cards covering every region, encounter, and mechanic in the game. Think of it as the community hub where players browse, filter, compare, and theory-craft card loadouts before diving into encounters.

## Approach

The project borrows concepts from FUTBin (the gold standard for game-card databases) and adapts them for Beltway Realms:

| FUTBin Feature | Our Equivalent |
|---|---|
| Player cards with stats | Cards with attributes (modifier, affinity, rarity, etc.) |
| Position / league / nation filters | Type / region / tier / keyword filters |
| Card comparison tool | Side-by-side card compare |
| SBC solutions (squad-building) | **Loadout builder** — pick a hand of cards for an encounter |
| Price tracking over time | **Usage stats** and **win-rate per card** |
| Card "versions" (TOTW, TOTY) | Card **variants** — base, upgraded, legendary |

## Card Taxonomy

- **6 card types:** Quest, Dialogue, Skill, Insight, Event, Artifact
- **5 rarity tiers:** Common → Legendary
- **Attributes per card:** modifier, versatility, synergy, reliability, ceiling

## Technical Details

- **Database:** SQLite via `better-sqlite3` — zero config, fast reads, single file
- **API:** Node.js + Hono — lightweight, TypeScript-native
- **Frontend:** React + Vite (same stack as main game)
- **Search:** SQLite FTS5 full-text search

## Features

- Card list with table view and grid view
- Filter sidebar: type, rarity, region, modifier range
- Full-text search across name, description, tags
- Card detail page with stat block and radar chart
- Side-by-side comparison tool
- Loadout builder — optimize a 3–5 card hand for encounters
- Synergy system — cards from same region or with matching tags boost each other

## Planned Features

- Shareable card URLs
- Save/share loadouts via URL
- User accounts (OAuth — GitHub/Google)
- Card ratings and comments
- Usage stats dashboard (most played, highest win-rate)
