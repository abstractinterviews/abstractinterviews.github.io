---
layout: default
title: "Lambda Architecture"
date: 2026-06-07
category: Patterns
---

Combine a batch layer for accurate results and a stream layer for low-latency approximations, merging them in the serving layer.

When to use:
- Systems needing both correctness and freshness in analytics.

Trade-offs:
- Maintaining two pipelines doubles engineering effort and can duplicate logic.

Related: /50-system-design-patterns/

## Example
- Example: An analytics platform uses batch ETL for daily accuracy and a stream pipeline for live metrics, merged in the serving layer.

## Diagram
```mermaid
flowchart LR
  Data --> Batch[Batch Layer]
  Data --> Stream[Speed Layer]
  Batch --> Serving
  Stream --> Serving
```
