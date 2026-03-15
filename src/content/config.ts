import { defineCollection, z } from "astro:content";

const projects = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    type: z.enum([
      "AI Pipeline",
      "Quant Model",
      "AWS Data Pipeline",
      "GovCon Analytics Dashboard",
      "D3 Visualization",
      "Game",
    ]),
    template: z.enum([
      "ai-pipeline",
      "quant-model",
      "aws-data-pipeline",
      "govcon-analytics",
      "d3-visualization",
      "game",
    ]),
    summary: z.string(),
    tags: z.array(z.string()).default([]),
    domain: z.string().optional(),
    stack: z.array(z.string()).default([]),
    timeline: z.string().optional(),
    impact: z.string().optional(),
    legacyUrl: z.string().optional(),
  }),
});

const notes = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    summary: z.string().optional(),
    tags: z.array(z.string()).default([]),
    publishedAt: z.string().optional(),
  }),
});

export const collections = {
  projects,
  notes,
};


