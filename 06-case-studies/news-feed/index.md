---
layout: default
title: "News Feed System"
---

# News Feed System

Focus: feed generation, ranking, fan-out strategies, cache invalidation.

```text
Figure Name: Figure 1 - News Feed Fan-Out Architecture
Alt Text: News feed system showing write path, fan-out service, ranking pipeline, and read cache.
Create architecture comparing fan-out-on-write and fan-out-on-read with trade-off labels.
```

## Core Design

- Post write ingest
- Feed index generation
- Ranking and relevance service
- Read-time pagination and cache

