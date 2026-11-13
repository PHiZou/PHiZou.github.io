# Portfolio site spec

**Owner:** Peter Hagen | **Stack:** Astro, TypeScript, Tailwind | **Live at:** https://phizou.github.io

Updated November 2026. This replaces the earlier recruiter-funnel spec (in git history).

## 1. Goal

Help Peter land a data or analytics role. A hiring manager should understand in 30 seconds what he does and see evidence for it.

**The takeaway:** a systems-minded analyst and builder who takes messy real-world data, tests it, finds where it breaks, and turns it into explainable reporting and tools. Backed by NAHB scale (114K+ member records, 500+ local associations) and an end-to-end Snowflake and dbt project, Recompete Radar.

**Framing to reuse:** "Federal contracting is the subject matter. The work is the transferable part."

## 2. Audience

**Primary:** hiring managers for Data / Senior Data Analyst, BI / Reporting, Data Quality / Governance, Operations / Program Analyst and Analytics Engineer roles. Employers include member associations and nonprofits, Snowflake teams, and small-to-midsize federal consultancies.

**Secondary:** potential contracting-data customers.

Do not position the site as GovCon-only or DHS-centered.

## 3. Pages

| Page | Job |
|---|---|
| `/` | The 30-second read, in five sections: hero, Recompete Radar proof, how it's built, about, contact |
| `/recompete-radar` | Hub: data stories, visual report, brief, how it's built, then the live app and what's next |
| `/projects/sunlight-recompete-radar` | Case study and the "four traps" brief |
| `/stories/*` | Data stories (static files in `public/stories/`) |
| `/recompete-radar/architecture/` | Interactive schematics (static file in `public/`) |
| `/projects` | Supporting projects. An explicit list in `projects.astro`; unlisted case studies keep their pages |
| `/resume` | Target roles, proof links, background, PDF |
| `/about` | Redirects to `/#about` |

**Nav:** Recompete Radar · Projects · About · Resume · Contact. The site name links home. About and Contact are homepage sections.

## 4. Calls to action

- Hero: one button, "See the work", with Resume as a text link beside it.
- The live app is always a secondary text link. Its Insights page shows an older five-agency analysis, so never link there.
- Contact section: email first, then LinkedIn and GitHub.

## 5. Recompete Radar scope and claims

- One product: federal contracts. Scope is 20 civilian agencies, no DoD, prime contracts, FY2008 onward, 484,242 awards.
- No Grants or Defense products exist. Federal grants may be mentioned once under "Up next".
- "How it's built" lives in `src/components/HowItsBuilt.astro`. Describe the project as it stands on Peter's local working branch of the recompete-radar repo, which is ahead of the public `main`. Every fact must trace to that branch.
- Scores are a ranking for prioritizing research, not win probabilities. Never say "no ML".
- Present it as a project Peter built, not production work at an employer.

## 6. Accuracy rules

- Every figure must trace to the recompete-radar repo or the published stories. If it cannot be traced, leave it out and ask.
- NAHB: Senior Data Analyst (Jul 2024 to Jul 2025), then Director, Membership Data (Feb 2023 to Jul 2024), in that order.
- DGCI: "DoD / DLA fuel-bid analysis", worded the same everywhere.
- Titles and dates must match `public/pdf/Peter-Hagen-Resume.pdf`.
- A "Live" badge on `/projects` means the link was checked. Recheck when editing that list.

## 7. Style

Warm, direct, plain English, led by evidence. Few dashes. No buzzwords and no walls of tech badges. Let the charts and the brief carry the credibility.

## 8. Constraints

- Static output on GitHub Pages. Content lives in markdown and `.astro` files.
- `type` and `template` in `src/content/config.ts` are enums. `type` is the label shown on a case study; `template` controls rendering.
- `public/sitemap.xml` is maintained by hand. It lists only pages reachable from the nav or the projects list.
