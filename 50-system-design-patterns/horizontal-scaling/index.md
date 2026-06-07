---
layout: default
title: "Horizontal Scaling"
date: 2026-06-07
category: Patterns
---

Add more machines to increase capacity; useful for stateless services where work parallelizes.

When to use:
- Web servers, API servers, and workers that can run in parallel.

Trade-offs:
- Needs load balancers and externalized state (sessions, caches).

Related: /50-system-design-patterns/

## Example
- Example: Run 10 identical web server instances behind an ELB; scale out to handle more traffic.

## Diagram
```mermaid
graph LR
  LB[Load Balancer] --> S1[Server 1]
  LB --> S2[Server 2]
  LB --> S3[Server 3]
```

