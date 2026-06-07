---
layout: default
title: "Distributed Cache System"
---

# Distributed Cache System

The distributed cache sits between application servers and durable storage to absorb hot reads, reduce database pressure, and improve tail latency.

```text
Figure Name: Figure 1 - Distributed Cache Cluster
Alt Text: Cache cluster with sharding, replicas, client routing, and failover behavior.
Create architecture showing consistent hashing, replication, eviction policies, and node failover.
```

## Core Design

```mermaid
flowchart LR
	U[Client] --> A[Application]
	A --> C[(Cache Cluster)]
	C --> D[(Database)]
```

## Core Design

| Concern | What To Explain |
| --- | --- |
| Partitioning | How keys map to cache nodes |
| Replication | How data survives a node failure |
| Eviction | LRU, LFU, or TTL behavior |
| Consistency | Cache-aside, write-through, or read-through |
| Hot keys | How to detect and spread hot traffic |

## Practical Trade-offs

- A cache improves latency only when the hit ratio is meaningful.
- Replication improves resilience but can make invalidation harder.
- Strong consistency is expensive for caches; most systems accept bounded staleness.

## Interview Framing

1. Explain what is cached and why.
2. Describe the miss path to the database.
3. Mention eviction policy and invalidation strategy.
4. Call out what happens when the cache cluster degrades.

