---
layout: default
title: "Vector Clocks"
date: 2026-06-07
category: Patterns
---

Maintain per-node logical timestamps to detect causal ordering and concurrent updates for conflict resolution.

When to use:
- Systems that must detect and reconcile concurrent writes rather than overwrite silently.

Trade-offs:
- Metadata grows with number of nodes; application-level conflict resolution is required.

Related: /50-system-design-patterns/

## Example
- Example: A distributed key-value store tags updates with vector clocks to detect concurrent writes for manual or automatic reconciliation.

## Diagram
```mermaid
flowchart LR
  NodeA -->|vclock [1,0]| Store
  NodeB -->|vclock [0,1]| Store
```
