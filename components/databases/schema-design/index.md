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

## Topic: Start With Access Patterns

### Sub-topic: Options and Selection

Design from reads, writes, filters, sort orders, and consistency boundaries.

- What is queried by ID?
- Which lists need pagination?
- Which fields are updated together?
- Which operations need transactions?
- What data can be denormalized safely?

## Topic: Relational vs Document Shape

### Sub-topic: Key Idea

| Choice | Good For | Watch Out |
| --- | --- | --- |
| Normalized relational schema | Joins, constraints, transactions | Hot joins and migration complexity |
| Denormalized tables | Fast reads and simple query paths | Duplication and update fan-out |
| Document model | Aggregate reads and flexible shape | Cross-document consistency |
| Wide-column model | High-write partitioned access | Query patterns must be known upfront |

## Topic: Evolution Strategy

### Sub-topic: Options and Selection

Use expand-migrate-contract for safe changes.

1. Expand: add nullable/new fields or tables.
2. Dual write or backfill old data.
3. Migrate reads to the new shape.
4. Validate parity and monitor errors.
5. Contract: remove old fields after clients migrate.

## Topic: Indexing and Hot Paths

### Sub-topic: Key Idea

- Index fields used in filters and joins.
- Avoid indexing every column; writes pay index cost.
- Use composite indexes that match query order.
- Watch high-cardinality and low-cardinality fields differently.

## Topic: Common Mistakes

### Sub-topic: Failure Awareness

- Designing tables from object models instead of query paths.
- Making destructive migrations in one deploy.
- Forgetting index and replication overhead.
- Ignoring multi-tenant partitioning needs.

## Topic: Interview Framing

### Sub-topic: Answer Structure

Show the core entities, access patterns, indexes, and migration plan. Mention which queries are optimized and what trade-offs denormalization introduces.
