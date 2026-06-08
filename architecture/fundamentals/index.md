---
layout: default
title: "Architecture Fundamentals"
page_type: deep-dive-post
subtitle: "Core concepts for reasoning about architecture decisions."
read_time: "8 min read"
difficulty: Core
post_tabs:
  - label: Concepts
    href: "#concepts"
  - label: Boundaries
    href: "#boundaries"
  - label: Qualities
    href: "#qualities"
toc:
  - label: "Concepts"
    href: "#concepts"
  - label: "Boundaries"
    href: "#boundaries"
  - label: "Qualities"
    href: "#qualities"
previous_topic:
  title: "Software Architecture"
  url: "/architecture/"
next_topic:
  title: "Architecture Patterns"
  url: "/architecture/patterns/"
---

## Topic: Concepts

### Sub-topic: Definition

Architecture is the set of hard-to-change decisions that shape system structure, ownership, and quality attributes.

### Sub-topic: What Counts as Architecture

Architecture includes component boundaries, communication style, data ownership, deployment topology, failure behavior, security boundaries, and observability strategy. It does not include every class, method, or implementation detail. The closer a decision is to being expensive to reverse, the more architectural it is.

### Sub-topic: Architecture vs Design

| Area | Architecture | Detailed Design |
| --- | --- | --- |
| Scope | System-level structure | Component-level implementation |
| Examples | Service boundaries, data ownership, deployment model | Class methods, validation logic, helper functions |
| Change cost | High | Low to medium |
| Interview signal | Judgment and trade-offs | Correctness and clarity |

## Topic: Boundaries

### Sub-topic: Practical Rule

A good boundary groups things that change together and separates things that change for different reasons.

### Sub-topic: Boundary Heuristics

- Same business capability belongs together.
- Same data ownership belongs together.
- Same release cadence often belongs together.
- Different compliance requirements may need separation.
- Different scaling patterns may justify separation.

### Sub-topic: Boundary Smells

- Two services must update the same table.
- A small change requires coordinated deployments across many teams.
- Business rules are duplicated in multiple places.
- Most requests require calls across five or more services.

## Topic: Qualities

### Sub-topic: Attribute Checklist

- Availability
- Latency
- Throughput
- Maintainability
- Security
- Cost

### Sub-topic: Quality Attribute Scenarios

Make quality attributes concrete. "Highly available" is vague. "Checkout must continue accepting orders if the recommendation service is unavailable" is actionable.

| Attribute | Concrete Scenario |
| --- | --- |
| Availability | Reads continue during one replica failure |
| Latency | Product page p95 stays under 200 ms |
| Scalability | Search traffic scales independently from checkout |
| Maintainability | A team can change billing without touching catalog |
| Security | User data cannot cross tenant boundaries |

### Sub-topic: Interview Application

When asked to design a system, pick the quality attributes that matter most and use them to justify design choices. This prevents the answer from becoming a generic architecture diagram.
