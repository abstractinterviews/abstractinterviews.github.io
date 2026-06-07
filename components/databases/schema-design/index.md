---
layout: default
title: "Schema Design and Evolution"
page_type: deep-dive-post
subtitle: "Design schemas around hot queries while preserving safe future change."
difficulty: Intermediate
read_time: "7 min read"
---

# Schema Design and Evolution

Schema should optimize hot queries while preserving future change safety. In distributed systems, schema design is also an operational rollout problem.

![Figure 1 - Schema Evolution Lifecycle](../assets/schema-evolution-lifecycle.png)

*Figure 1: Expand-migrate-contract rollout pattern with backward-compatible reads during migrations.*

## 1. Start With Access Patterns

Design from reads, writes, filters, sort orders, and consistency boundaries.

- What is queried by ID?
- Which lists need pagination?
- Which fields are updated together?
- Which operations need transactions?
- What data can be denormalized safely?

## 2. Relational vs Document Shape

| Choice | Good For | Watch Out |
| --- | --- | --- |
| Normalized relational schema | Joins, constraints, transactions | Hot joins and migration complexity |
| Denormalized tables | Fast reads and simple query paths | Duplication and update fan-out |
| Document model | Aggregate reads and flexible shape | Cross-document consistency |
| Wide-column model | High-write partitioned access | Query patterns must be known upfront |

## 3. Evolution Strategy

Use expand-migrate-contract for safe changes.

1. Expand: add nullable/new fields or tables.
2. Dual write or backfill old data.
3. Migrate reads to the new shape.
4. Validate parity and monitor errors.
5. Contract: remove old fields after clients migrate.

## 4. Indexing and Hot Paths

- Index fields used in filters and joins.
- Avoid indexing every column; writes pay index cost.
- Use composite indexes that match query order.
- Watch high-cardinality and low-cardinality fields differently.

## 5. Common Mistakes

- Designing tables from object models instead of query paths.
- Making destructive migrations in one deploy.
- Forgetting index and replication overhead.
- Ignoring multi-tenant partitioning needs.

## 6. Interview Framing

Show the core entities, access patterns, indexes, and migration plan. Mention which queries are optimized and what trade-offs denormalization introduces.
