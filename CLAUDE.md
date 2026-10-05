# phizou-site

Peter Hagen's portfolio, live at https://phizou.github.io (repo PHiZou/PHiZou.github.io).

## Stack & commands
- Astro 5 + Tailwind 4 (via `@tailwindcss/vite`), static output.
- `npm run dev` (localhost:4321), `npm run build`, `npm run preview`.
- Run `npm run build` before committing; it is the only check (no tests/linter).

## Deploy
- Push to `master` → `.github/workflows/deploy.yml` (`withastro/action`) builds from `src/` and deploys to GitHub Pages.
- `dist/`, `.astro/`, `node_modules/` are gitignored. Never edit `dist/` to change the live site.

## Where things live
- Nav items: `src/layouts/BaseLayout.astro` (`NAV_ITEMS` array near the top); shared head/footer there too.
- Pages: `src/pages/*.astro`; project detail route under `src/pages/projects/`.
- Project case studies: `src/content/projects/*.md`, schema in `src/content/config.ts` (`type`/`template` are enums — add to both when introducing a new kind). Rendered by `src/components/projects/ProjectArticle.astro`.
- Static assets, resume PDF (`public/pdf/`), and a hand-maintained `public/sitemap.xml` — update the sitemap when adding/removing pages.
- `archive/` and `public/archive/` hold the legacy pre-Astro site; leave them alone.
- Product/positioning spec: `SPEC.md` (with `SYSTEMS_SPEC.md`).

## Audience & positioning
- Primary: recruiters / hiring managers for data, analytics, and BI engineering roles. They should understand within 5 seconds what Peter builds, and the main CTA is resume or contact.
- Secondary: consulting / data-product clients (GovCon, defense & intel). Keep these pages, but they come after the hiring path in nav and CTAs.

## House rules
- Make no unsupported claims. Every metric, title, and "in production"/"live" claim must be backed by real work and match the resume (see commit 763bea3). If unsure, ask.
- Job titles and dates must match `public/pdf/Peter-Hagen-Resume.pdf` and `src/pages/resume.astro`.
- Design skills are available: `redesign-existing-projects` (audit) and `high-end-visual-design`.
- Check visual changes in a browser at desktop and mobile widths before pushing.
