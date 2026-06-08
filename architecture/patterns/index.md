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

## Topic: Trade-offs

### Sub-topic: Common Failure

Do not choose microservices only because the system may grow. Split when team, deployment, or scaling pressure justifies the operational cost.
