---
layout: default
title: "Replication and Failover"
---

# Replication and Failover

Replication improves availability and read scale; failover preserves continuity during node failures.

![Figure 1 - Primary Replica Failover](./assets/primary-replica-failover.png)

*Figure 1: Primary-replica topology with read replicas and automatic leader election on primary failure.*

## Core Trade-Off

- Async replication: better latency, possible replica lag.
- Sync replication: stronger consistency, write latency cost.

