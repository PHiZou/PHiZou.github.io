# Portfolio Site — Systems Specification

**Owner:** Peter Hagen | **Stack:** Astro, TypeScript, Tailwind | **Target:** Recruiter conversion for data/analytics/BI engineering roles

---

## 1. Goals

| Priority | Goal |
|---|---|
| 1 | Signal technical credibility to non-technical recruiters in < 30 seconds |
| 2 | Give engineering hiring managers depth to self-serve validation |
| 3 | Surface live, working projects as trust anchors |
| 4 | Drive one action: contact or resume download |

---

## 2. Target Audience

**Primary:** Technical recruiter sourcing for Data Engineer / Analytics Engineer / BI Engineer
**Secondary:** Engineering manager vetting a shortlist candidate
**Not optimized for:** Clients, general public, social sharing

Recruiter read time budget: ~90 seconds. Every page must orient within 5 seconds ("what does this person build?") and provide a clear exit action.

---

## 3. Information Architecture

```
/                   Home — credential overview + curated entry points
├── /projects       Catalog — full project inventory with "start here" guidance
│   └── /[slug]     Detail — one project, deep dive
├── /resume         Resume — best-fit roles, expertise summary, PDF
├── /about          Bio — background, focus areas
└── /blog           Writing (secondary; does not block conversion flow)
```

**Conversion path (recruiter):**

```
Home → Projects (start here) → Project Detail (live demo) → Resume → Contact
         ↑                                                      ↑
    "View key projects" CTA                          "Download PDF" CTA
```

---

## 4. Page Responsibilities

### `/` Home
- **Job:** Establish identity and filter fit in one scroll
- **Must answer:** What do you build? What roles? Where can I see it?
- **Key sections:** Hero tagline → Best-fit role cards → Skills overview → Featured projects → Live project links
- **Exit CTAs:** `/projects` and `/resume`

### `/projects` Catalog
- **Job:** Orient visitor to the right project quickly
- **Must answer:** What should I look at first?
- **Key sections:** "Start here" (5 curated) → Category-grouped full list → Live projects grid
- **Exit CTAs:** Individual project slugs, live demo links

### `/projects/[slug]` Detail
- **Job:** Demonstrate competence on one project
- **Must answer:** What problem, what did you build, does it work?
- **Key sections:** Context/problem → Approach → Stack + timeline + impact metadata → Live demo CTA

### `/resume`
- **Job:** Close the loop for a warm recruiter
- **Must answer:** What roles does this map to? Can I download the PDF?
- **Key sections:** Best-fit roles → Expertise cards → PDF embed + download

### `/about`
- **Job:** Add human context; validate background
- **Must answer:** Where did you come from, what's your focus?
- **Exit CTA:** LinkedIn

---

## 5. Content Model

```
Project {
  title        string   required
  type         enum     required   // display label (e.g. "AI Pipeline")
  template     enum     required   // controls which detail component renders
  summary      string   required   // 1–2 sentence recruiter-facing pitch
  tags[]       string[]            // skill/tech keywords
  domain       string              // industry context
  stack[]      string[]            // ordered by relevance
  timeline     string              // e.g. "3 weeks"
  impact       string              // outcome statement
  liveUrl      string              // deployed demo URL
  body         markdown            // full project narrative
}
```

**Template → Component mapping:**

| template | component | use case |
|---|---|---|
| `ai-pipeline` | AiPipelineProject | RAG, LLM workflows, NLP |
| `aws-data-pipeline` | AwsDataPipelineProject | Cloud ETL, orchestration |
| `govcon-analytics` | GovconAnalyticsProject | Dashboards, reporting, R Shiny |
| `quant-model` | QuantModelProject | Forecasting, modeling |
| `d3-visualization` | D3VisualizationProject | Interactive data vis |
| `game` | GameProject | Creative / product experiments |

**Blog** is a secondary collection. Posts can link externally (`externalUrl`). Not part of the primary conversion funnel.

---

## 6. Navigation

```
[ Peter Hagen ]   Home   About   Projects   Resume   Blog   [ GitHub ]
```

- Active page is visually indicated
- Mobile: hamburger collapse
- Footer: Email · LinkedIn · GitHub (always visible)
- No nav item for individual project slugs (breadcrumb only)

**Rule:** Nav depth ≤ 2. No dropdowns. Every destination reachable in one click from any page.

---

## 7. CTA Strategy

| Location | Primary CTA | Secondary CTA |
|---|---|---|
| Hero | View key projects → `/projects` | View resume → `/resume` |
| Project grid card | Project title link → `/projects/[slug]` | — |
| Project detail (has liveUrl) | Launch live project ↗ | — |
| Project detail (no liveUrl) | Back to projects | — |
| Resume page | Download PDF | — |
| About page | LinkedIn ↗ | — |
| Footer (every page) | Email | LinkedIn / GitHub |

**Rule:** One primary CTA per viewport region. Never two buttons with equal visual weight side-by-side unless they serve different audiences (resume vs. projects on hero is intentional).

---

## 8. Live Project Linking

Live URLs (`liveUrl` in frontmatter) are the strongest trust signal on the site.

**Behavior rules:**
- If `liveUrl` present → render prominent "Launch live project" button on detail page; show live badge on catalog card
- If no `liveUrl` → no broken link, no placeholder; detail page CTA omitted entirely
- Live projects section on `/projects` and home surfaces all `liveUrl` entries as a scannable grid

**Current live projects (7):**

| Project | Host |
|---|---|
| Obsidian RAG Chat | Streamlit |
| NOVA Data Center Energy | Vercel |
| Beltway Realms Card DB | Railway |
| Iran–US Conflict Map | Vercel |
| Futbol League Explorer | Shiny |
| Beltway Realms (game) | Vercel |
| Text prediction ML | Shiny |

---

## 9. "Start Here" Section Logic

The `/projects` page opens with a curated "Start here" block for recruiter orientation. Selection criteria:

1. **Role signal diversity** — cover at least: pipeline/ETL, analytics/BI, AI/ML
2. **Live demo preference** — projects with `liveUrl` are favored
3. **Complexity signal** — prefer end-to-end systems over standalone scripts
4. **Recency** — more recent work preferred

**Current "Start here" (5):**
- End-to-end AI pipeline for operational insights *(pipeline + AI)*
- GovCon analytics dashboard *(BI/analytics)*
- Quant model for risk-aware forecasting *(modeling/data)*
- AWS data pipeline for analytics at scale *(cloud ETL)*
- NOVA Data Center Energy *(live D3, interactive)*

**Rule:** Do not auto-generate this list from frontmatter flags at build time. Keep it as explicit markup in `projects.astro` so it requires a conscious editorial decision to change.

---

## 10. Project Detail Page Design Principles

1. **Problem first.** Open with the business/domain problem, not the tech stack.
2. **Stack is metadata, not the story.** Stack/timeline/impact live in a sidebar card, not in the narrative.
3. **One live CTA, high contrast.** If a demo exists, make it unmissable above the fold.
4. **Outcome over process.** `impact` field should quantify or clearly describe result, not describe effort.
5. **Template specialization is justified** when a project type needs domain-specific framing (e.g. quant model needs assumptions/limitations, AI pipeline needs retrieval architecture). Avoid adding new templates for cosmetic variation.

---

## 11. Implementation Priorities

```
P0 — Blocks recruiter conversion
  [ ] Every project has a non-empty `summary` (recruiter-facing 1-liner)
  [ ] Every project with liveUrl renders a working, high-contrast launch button
  [ ] Resume PDF link is not broken
  [ ] Mobile nav works; no layout overflow on 375px viewport

P1 — Improves signal quality
  [ ] All P0 projects have `impact` field populated with outcome statement
  [ ] `stack[]` ordered with most-relevant-to-role-target first
  [ ] "Start here" 5 projects have full body content (not stub markdown)
  [ ] OpenGraph meta tags on all pages (title, description, image)

P2 — Depth for engineering managers
  [ ] Projects with no liveUrl have architecture diagram or screenshot in body
  [ ] Blog section has at least one technical post relevant to target roles
  [ ] domain field used consistently to enable future filtering

P3 — Polish / nice-to-have
  [ ] Consistent timeline format (e.g. "2 weeks", "1 month")
  [ ] Live project cards show last-deployed or "active" status
  [ ] Analytics (Fathom / Plausible) to measure resume download conversion
```

---

## 12. Constraints

- **No CMS.** Content lives in markdown frontmatter. Acceptable for a single-author portfolio.
- **Static output.** All pages pre-rendered at build time. No server-side personalization.
- **Template coupling.** The `template` enum in the schema must stay in sync with `[slug].astro` switch logic. Adding a new project type requires: (1) new enum value, (2) new component, (3) new case in slug page.
- **Blog is a liability if sparse.** Two posts (one off-topic) hurts more than no blog. Publish or hide.
