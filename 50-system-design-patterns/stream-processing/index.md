---
layout: default
title: "Stream Processing"
date: 2026-06-07
category: Patterns
---

Process events continuously with low latency using frameworks like Flink or Kafka Streams for real-time analytics and transformations.

When to use:
- Fraud detection, live metrics, and real-time recommendation updates.

Trade-offs:
- Operational complexity and correctness guarantees (exactly-once) are challenging.

Related: /50-system-design-patterns/

## Example
- Example: A Kafka Streams job computes rolling aggregations of click events to update real-time dashboards.

## Diagram
```mermaid
flowchart LR
  Events --> StreamProcessor
  StreamProcessor --> Sink[Realtime Store]
```
