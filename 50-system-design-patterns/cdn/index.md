---
layout: default
title: "CDN (Content Delivery Network)"
date: 2026-06-07
category: Patterns
---

Serve static assets from edge servers worldwide so users hit a nearby cache, reducing latency and origin load.

When to use:
- Global audiences and heavy static content (images, videos, JS/CSS).

Trade-offs:
- Cache invalidation delays and bandwidth costs.

Related: /50-system-design-patterns/

## Example
- Example: Host image assets on CloudFront so users fetch from edge locations close to them.

## Diagram
```mermaid
flowchart LR
  User --> Edge[CDN Edge]
  Edge --> Origin[Origin Server]
```
