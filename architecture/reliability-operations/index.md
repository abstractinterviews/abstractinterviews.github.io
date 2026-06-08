---
layout: default
title: "Reliability and Operations"
page_type: deep-dive-post
subtitle: "Designing systems that can be operated under failure."
read_time: "9 min read"
difficulty: Intermediate
post_tabs:
  - label: Reliability
    href: "#reliability"
  - label: Observability
    href: "#observability"
  - label: Rollouts
    href: "#rollouts"
toc:
  - label: "Reliability"
    href: "#reliability"
  - label: "Observability"
    href: "#observability"
  - label: "Rollouts"
    href: "#rollouts"
previous_topic:
  title: "Architecture Patterns"
  url: "/architecture/patterns/"
next_topic:
  title: "Architecture Decision Records"
  url: "/architecture/decision-records/"
---

## Topic: Reliability

### Sub-topic: Failure Questions

- What if the database is slow?
- What if a downstream API times out?
- What if a queue backlog grows?
- What if a deployment is bad?

## Topic: Observability

### Sub-topic: Signals

Use logs for facts, metrics for trends, traces for request paths, and alerts for user-impacting symptoms.

## Topic: Rollouts

### Sub-topic: Safety Mechanisms

- Feature flags
- Canary deployments
- Rollbacks
- Backward-compatible schema changes
