---
layout: default
title: "Databases"
---

# Databases

This section covers data store decisions and distributed storage trade-offs.

<div class="section-tabs" aria-label="Database families">
  <span class="is-active">Relational (SQL)</span>
  <span>NoSQL</span>
  <span>NewSQL</span>
  <span>Graph</span>
</div>

<div class="doc-callout">
  <strong>Relational databases</strong>
  <p>Relational databases store data in tables with predefined schemas. They are a strong default when transactions, joins, and consistency matter.</p>
</div>

![Figure 1 - Database Design Decision Tree](./assets/database-design-decision-tree.png)

*Figure 1: Decision tree from workload and consistency requirements to SQL/NoSQL, sharding, replication, and transaction model.*

## Topics

- [SQL vs NoSQL](./sql-vs-nosql.md)
- [Sharding Strategies](./sharding.md)
- [Replication and Failover](./replication.md)
- [Schema Design and Evolution](./schema-design.md)
- [Distributed Transactions](./distributed-transactions.md)
- [Time-Series and Specialized Stores](./specialized-stores.md)

