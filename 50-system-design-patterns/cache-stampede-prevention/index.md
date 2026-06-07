---
layout: default
title: "Cache Stampede Prevention"
date: 2026-06-07
category: Patterns
---

Prevent thousands of concurrent cache misses for the same key by coalescing requests, using locks, or probabilistic early refresh.

When to use:
- Popular entries that expire simultaneously (trending pages, hot profiles).

Trade-offs:
- Adds coordination complexity and potential hotspots if misconfigured.

Related: /50-system-design-patterns/

## Example
- Example: Use request coalescing where the first request regenerates a cache entry while other requests wait, or use randomized TTLs to stagger expirations.

## Diagram
```mermaid
sequenceDiagram
	Client1->>App: getHotKey
	Client2->>App: getHotKey
	App->>Lock: acquire
	Lock-->>App: granted
	App->>DB: load
	App->>Cache: set
	App-->>Clients: result
```
