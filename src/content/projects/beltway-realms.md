---
title: Beltway Realms
type: Game
template: game
summary: A game-inspired portfolio set in a parchment-style fantasy / cyberpunk reinterpretation of Northern Virginia and Washington, D.C. Explore regions, complete quests, and roll the dice.
tags: ["React", "TypeScript", "Vite", "Game", "Interactive"]
stack: ["React", "TypeScript", "Vite", "React Router", "localStorage"]
impact: Turns a professional portfolio into an explorable, playful experience that showcases systems thinking and creative front-end engineering.
legacyUrl: "https://beltway-realms.vercel.app"
---

**Beltway Realms** is a small, local-only web app that reimagines a data engineer's portfolio as a fantasy RPG overworld. Northern Virginia and Washington, D.C. become a parchment-style map of realms, quests, and encounters.

## Approach

The project blends portfolio case studies with game mechanics: a world map with clickable regions, quest pages that expand into full case studies, a card hand for story encounters, and a d20 roller for light RPG flavor. All content lives in simple TypeScript data under `client/src/data/`, making it easy to extend or reskin.

## Key screens

- **Landing / intro** – Explains the Beltway Realms concept and how to use the prototype
- **World map** – Parchment-style SVG map with clickable regions
- **Region page** – Describes a realm and lists its quests
- **Card table / encounter** – A hand of cards and d20 roller for story encounters
- **Quest detail / lore panel** – Lore entries that expand into full case studies

## Technical details

- **Frontend:** React + TypeScript + Vite
- **Routing:** react-router-dom
- **Persistence:** local state + localStorage (no backend, no auth, no API)
- **Content:** TypeScript data files for easy extension

## Planned upgrades

- Interactive skill tree with graph layout and unlock visualization
- Completed badges on region quest lists
- Boss pages
- AI companion ("Atlas") with portfolio-aware chat
