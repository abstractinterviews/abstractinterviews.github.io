---
layout: default
title: "Patterns"
page_type: deep-dive-index
deep_dive_id: distributed_patterns
deep_title: "Deep Dive: Distributed Patterns"
subtitle: "Reliability and consistency patterns for distributed workflows, state models, and failure containment."
hero_icon: "P"
badges:
  - Reliability
  - Coordination
  - "~28 min read"
stats:
  - value: "7"
    label: "Sub Topics"
  - value: "7+"
    label: "Diagrams"
  - value: "5"
    label: "Failure Controls"
  - value: "9"
    label: "Trade-offs"
overview: "Distributed patterns exist to make failure behavior explicit. Use them to control coupling, preserve data correctness, and keep systems operable at scale."
key_takeaways:
  - Choose patterns by failure mode
  - Keep boundaries and contracts explicit
  - Prefer idempotency and replay safety
  - Surface consistency trade-offs clearly
subtopics:
  - title: "CQRS"
    description: "Separate command and query paths for independent optimization."
    read_time: "6 min read"
    url: "/fundamentals/patterns/cqrs/"
    icon: "C"
    color: "blue"
  - title: "50 System Design Patterns"
    description: "A concise reference of 50 essential system design patterns grouped by category."
    read_time: "90 min read"
    url: "/50-system-design-patterns/"
    icon: "5"
    color: "teal"
  - title: "Event Sourcing"
    description: "Persist immutable events and rebuild state deterministically."
    read_time: "6 min read"
    url: "/fundamentals/patterns/event-sourcing/"
    icon: "E"
    color: "violet"
  - title: "Saga Pattern"
    description: "Coordinate distributed workflows with compensating actions."
    read_time: "6 min read"
    url: "/fundamentals/patterns/saga/"
    icon: "S"
    color: "green"
  - title: "Circuit Breaker and Bulkhead"
    description: "Contain partial outages and prevent cascading failures."
    read_time: "5 min read"
    url: "/fundamentals/patterns/circuit-breaker/"
    icon: "B"
    color: "amber"
  - title: "Outbox Pattern"
    description: "Guarantee event publication without dual-write races."
    read_time: "5 min read"
    url: "/fundamentals/patterns/outbox/"
    icon: "O"
    color: "red"
  - title: "2PC vs Eventual Consistency"
    description: "Decide where strict atomicity is worth coordination cost."
    read_time: "5 min read"
    url: "/fundamentals/patterns/2pc-vs-eventual/"
    icon: "T"
    color: "green"
related_concepts:
  - title: "Message Queues"
    url: "/components/message-queues/"
  - title: "Sharding"
    url: "/components/databases/sharding/"
  - title: "API Gateway"
    url: "/components/api-and-communication/api-gateway/"
  - title: "Case Studies"
    url: "/case-studies/"
---

# Patterns

This section covers the distributed-system patterns that show up repeatedly in real architectures, and it focuses on when to use each one instead of memorizing definitions in isolation.

<div class="section-tabs" aria-label="Pattern classes">
  <span class="is-active">Consistency</span>
  <span>Workflow</span>
  <span>Resilience</span>
  <span>Integration</span>
</div>

<div class="doc-callout">
  <strong>Patterns are failure tools.</strong>
  <p>Use these patterns to encode behavior under retries, partial outages, and distributed writes. The right pattern is the one that makes failure handling explicit.</p>
</div>

![Figure 1 - Distributed Patterns Overview](./assets/distributed-patterns-overview.png)

*Figure 1: Pattern map connecting CQRS, event sourcing, saga, circuit breaker, outbox, and consistency models.*

## Topic: Topic Map

### Sub-topic: Section Directory

- [CQRS](./cqrs/)
- [Event Sourcing](./event-sourcing/)
- [Saga Pattern](./saga/)
- [Circuit Breaker and Bulkhead](./circuit-breaker/)
- [Outbox Pattern](./outbox/)
- [2PC vs Eventual Consistency](./2pc-vs-eventual/)
 - [50 System Design Patterns](../../50-system-design-patterns/)

## Topic: Study Path

### Sub-topic: Recommended Sequence

1. Start with CQRS and event sourcing to understand how read and write models diverge.
2. Read saga and outbox together because both solve distributed workflow reliability.
3. Finish with circuit breaker, bulkhead, and consistency trade-offs to understand failure behavior.

## Topic: Pattern Selection Guide

### Sub-topic: Decision Criteria

| Problem | Best Starting Point | What It Solves |
| --- | --- | --- |
| Separate reads and writes | CQRS | Independent optimization of query and command paths |
| Keep workflow reliability | Saga | Coordinated multi-step business flow |
| Prevent cascading failures | Circuit breaker and bulkhead | Contain dependency outages |
| Publish events safely | Outbox | Avoid dual-write inconsistency |
| Decide coordination model | 2PC vs eventual consistency | Trade atomicity for availability |

## Topic: Study Order

### Sub-topic: Recommended Sequence

1. Read CQRS and event sourcing to understand state modeling choices.
2. Read saga and outbox together for workflow reliability.
3. Read circuit breaker and 2PC vs eventual consistency for failure and consistency boundaries.


