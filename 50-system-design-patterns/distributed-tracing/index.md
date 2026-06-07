---
layout: default
title: "Distributed Tracing"
date: 2026-06-07
category: Patterns
---

Propagate trace context and collect spans across services so requests can be visualized end-to-end for latency and failure analysis.

When to use:
- Microservice architectures where understanding request flow and bottlenecks is critical.

Trade-offs:
- Adds request overhead and storage costs; typically used with sampling to limit volume.

Related: /50-system-design-patterns/

## Example
- Example: A trace ID is propagated through a microservice request chain to visualize latency and errors across services.

## Diagram
```mermaid
flowchart LR
  Client --> ServiceA
  ServiceA --> ServiceB
  ServiceB --> ServiceC
```
