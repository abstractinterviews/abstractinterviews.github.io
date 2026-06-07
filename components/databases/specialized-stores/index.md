---
layout: default
title: "Time-Series and Specialized Stores"
page_type: deep-dive-post
subtitle: "Pick purpose-built stores for time-series, search, graph, analytics, and other specialized workloads."
difficulty: Intermediate
read_time: "7 min read"
---

# Time-Series and Specialized Stores

Specialized databases optimize specific workloads better than general-purpose stores. They are most useful when access patterns are stable and a general store would become expensive or slow.

![Figure 1 - Specialized Storage Map](../assets/specialized-storage-map.png)

*Figure 1: Mapping of workload types to time-series, search, graph, and columnar stores.*

## 1. Common Fits

| Workload | Store Type | Why |
| --- | --- | --- |
| Metrics and logs | Time-series DB | High ingest, time-window queries |
| Full-text search | Search engine | Tokenization, ranking, inverted indexes |
| Relationship traversals | Graph DB | Multi-hop queries and edge properties |
| Analytics | Columnar warehouse | Compression and scan efficiency |
| Caching/session data | Key-value store | Low latency simple access |

## 2. Time-Series Stores

Time-series systems optimize append-heavy writes and time-bounded reads.

- Partition by time and metric labels.
- Downsample older data.
- Apply retention policies aggressively.
- Avoid unbounded label cardinality.

## 3. Search Stores

Search engines are read-optimized indexes, not usually the source of truth.

- Ingest from database or event stream.
- Expect eventual consistency after writes.
- Tune analyzers, synonyms, and ranking.
- Rebuild indexes safely with aliases.

## 4. Graph Stores

Graph databases fit relationship-heavy traversals.

- Fraud rings
- Social graph recommendations
- Dependency graphs
- Identity and permission relationships

## 5. Polyglot Persistence Risk

Each extra store adds operational cost: backups, schema evolution, monitoring, security, and data synchronization. Use specialized stores when the workload benefit is clear.

## 6. Interview Framing

Explain the source of truth first, then justify the specialized read/write store. Cover sync pipeline, staleness, backfill, and failure behavior.
