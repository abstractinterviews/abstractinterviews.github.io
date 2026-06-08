---
layout: default
title: "Architecture Patterns"
page_type: deep-dive-post
subtitle: "Common architecture styles and when to use them."
read_time: "10 min read"
difficulty: Intermediate
post_tabs:
  - label: Styles
    href: "#styles"
  - label: Selection
    href: "#selection"
  - label: Trade-offs
    href: "#trade-offs"
toc:
  - label: "Styles"
    href: "#styles"
  - label: "Selection"
    href: "#selection"
  - label: "Trade-offs"
    href: "#trade-offs"
previous_topic:
  title: "Architecture Fundamentals"
  url: "/architecture/fundamentals/"
next_topic:
  title: "Reliability and Operations"
  url: "/architecture/reliability-operations/"
---

## Topic: Styles

### Sub-topic: Common Options

| Pattern | Best For |
| --- | --- |
| Layered | Simple enterprise applications |
| Hexagonal | Domain logic isolated from infrastructure |
| Modular Monolith | Strong boundaries with low operational overhead |
| Microservices | Independent scaling and deployment |
| Event-Driven | Decoupled workflows and async processing |

## Topic: Selection

### Sub-topic: Decision Criteria

Choose based on team size, deployment needs, data ownership, consistency requirements, and operational maturity.

### Sub-topic: Pattern Selection Matrix

| Constraint | Prefer | Avoid |
| --- | --- | --- |
| Small team, evolving product | Modular monolith | Early microservices |
| Strong domain logic | Hexagonal architecture | Infrastructure-driven design |
| High independent scaling pressure | Microservices | One large shared runtime |
| Async workflows and fan-out | Event-driven architecture | Deep synchronous call chains |
| Simple CRUD application | Layered architecture | Over-engineered patterns |

### Sub-topic: Pattern Combination

Patterns can be combined. A system can be a modular monolith internally, use hexagonal boundaries for domain logic, and publish events for integration with external systems. The important part is explaining which problem each pattern solves.

## Topic: Trade-offs

### Sub-topic: Common Failure

Do not choose microservices only because the system may grow. Split when team, deployment, or scaling pressure justifies the operational cost.

### Sub-topic: Microservices Trade-off

Microservices improve independent deployment, ownership, and scaling. They also introduce network latency, distributed tracing, partial failures, eventual consistency, and more complex local development. In interviews, mention the operational maturity required: service discovery, logging, metrics, tracing, rollbacks, and incident response.

### Sub-topic: Event-Driven Trade-off

Event-driven systems decouple producers and consumers. They work well for notifications, analytics, audit logs, and background workflows. They are harder to debug because the request path is no longer linear. You must handle duplicate events, ordering, replay, schema evolution, and poison messages.

## Topic: Interview Examples

### Sub-topic: Choosing Modular Monolith

For a new product with one team and unclear domain boundaries, choose a modular monolith. Define modules with explicit interfaces and separate data access. This keeps deployment simple while preserving a path to extract services later.

### Sub-topic: Choosing Event-Driven

For order placement that triggers email, inventory reservation, fraud checks, and analytics, use events after the core order transaction. This keeps checkout fast and allows downstream consumers to evolve independently.
