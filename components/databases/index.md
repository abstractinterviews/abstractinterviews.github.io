---
layout: default
title: "Databases"
page_type: deep-dive-index
deep_dive_id: databases
deep_title: "Deep Dive: Databases"
subtitle: "Comprehensive guide to data store decisions and distributed storage trade-offs."
hero_icon: "D"
badges:
  - Fundamental
  - Storage Core
  - "~35 min read"
stats:
  - value: "6"
    label: "Sub Topics"
  - value: "7+"
    label: "Diagrams"
  - value: "4"
    label: "Store Types"
  - value: "10"
    label: "Trade-offs"
overview: "Databases define how a system stores, retrieves, partitions, replicates, and protects data. Choose the storage model from access patterns, consistency needs, scale, and operational constraints."
key_takeaways:
  - Model access patterns first
  - Choose consistency deliberately
  - Plan for growth and failover
  - Keep operational complexity visible
subtopics:
  - title: "SQL vs NoSQL"
    description: "Choose relational or non-relational stores from guarantees and access patterns."
    read_time: "7 min read"
    url: "/components/databases/sql-vs-nosql/"
    icon: "S"
    color: "blue"
  - title: "Sharding Strategies"
    description: "Partition data across nodes while avoiding hotspots and query fan-out."
    read_time: "8 min read"
    url: "/components/databases/sharding/"
    icon: "H"
    color: "violet"
  - title: "Replication and Failover"
    description: "Use replicas, leader election, and failover for availability and read scale."
    read_time: "7 min read"
    url: "/components/databases/replication/"
    icon: "R"
    color: "green"
  - title: "Schema Design and Evolution"
    description: "Design schemas around hot queries and evolve them safely."
    read_time: "6 min read"
    url: "/components/databases/schema-design/"
    icon: "E"
    color: "amber"
  - title: "Distributed Transactions"
    description: "Compare 2PC, sagas, outbox, and eventual consistency for distributed writes."
    read_time: "7 min read"
    url: "/components/databases/distributed-transactions/"
    icon: "T"
    color: "red"
  - title: "Time-Series and Specialized Stores"
    description: "Map workload types to time-series, search, graph, columnar, and other stores."
    read_time: "6 min read"
    url: "/components/databases/specialized-stores/"
    icon: "M"
    color: "green"
related_concepts:
  - title: "Caching"
    url: "/components/caching/"
  - title: "Load Balancing"
    url: "/components/load-balancers/"
  - title: "Message Queues"
    url: "/components/message-queues/"
  - title: "Distributed Patterns"
    url: "/fundamentals/patterns/"
---

# Databases

This section covers data store decisions, consistency trade-offs, and the physical layout choices that influence correctness and scale.

![Figure 1 - Database Design Decision Tree](./assets/database-design-decision-tree.png)

*Figure 1: Decision tree from workload and consistency requirements to SQL/NoSQL, sharding, replication, and transaction model.*

## Topic: Topic Map

### Sub-topic: Section Directory

- [SQL vs NoSQL](./sql-vs-nosql/)
- [Sharding Strategies](./sharding/)
- [Replication and Failover](./replication/)
- [Schema Design and Evolution](./schema-design/)
- [Distributed Transactions](./distributed-transactions/)
- [Time-Series and Specialized Stores](./specialized-stores/)

## Topic: What To Look For

### Sub-topic: Definition

| Question | What It Reveals |
| --- | --- |
| Can the data stay on one node? | Whether you need sharding or not |
| Do reads dominate writes? | Whether replicas or caching help |
| Is atomicity business-critical? | Whether strict transactions matter |
| Are schemas stable or evolving? | Whether relational or flexible models fit better |

## Topic: Study Order

### Sub-topic: Recommended Sequence

1. Start with SQL vs NoSQL to understand the baseline model.
2. Read sharding and replication together to see how scaling and resilience interact.
3. Use schema design and distributed transactions to reason about correctness.
4. Finish with specialized stores to see when a different storage engine is the right answer.
