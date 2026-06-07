---
layout: default
title: "Primary-Replica (Leader-Follower)"
date: 2026-06-07
category: Patterns
---

One node accepts writes (primary); replicas asynchronously copy and serve reads. Replicas can be promoted on failure.

When to use:
- Read-heavy workloads where horizontal read scaling is required (profiles, catalogs).

Trade-offs:
- Replication lag can produce stale reads; failover and leader election add complexity.

Related: /50-system-design-patterns/

## Example
- Example: A user profile service where writes go to a primary PostgreSQL node and reads come from read replicas behind a load balancer.

## Diagram
```mermaid
graph LR
	Client --> LB[Read Load Balancer]
	LB --> Replica1[Replica 1]
	LB --> Replica2[Replica 2]
	Client --> Primary[Primary (writes)]
	Primary --> Replica1
	Primary --> Replica2
```
