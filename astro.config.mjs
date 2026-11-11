// @ts-check
import { defineConfig } from 'astro/config';
import { existsSync } from 'node:fs';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  site: "https://phizou.github.io",
  base: "/",
  markdown: {
    shikiConfig: {
      theme: 'github-dark',
    },
  },
  vite: {
    plugins: [
      tailwindcss(),
      {
        name: 'story-directory-index',
        apply: 'serve',
        configureServer(server) {
          // Vite serves exact public files, but skips directory index URLs.
          // Resolve story links in dev just as the static host does.
          server.middlewares.use((request, _response, next) => {
            const url = new URL(request.url ?? '/', 'http://localhost');
            const story = url.pathname.match(/^\/stories\/([a-z0-9-]+)\/?$/);
            if (story && existsSync(new URL(`./public/stories/${story[1]}/index.html`, import.meta.url))) {
              request.url = `/stories/${story[1]}/index.html${url.search}`;
            }
            next();
          });
        },
      },
    ]
  }
});
