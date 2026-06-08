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

### Sub-topic: Reliability Techniques

| Failure Mode | Technique |
| --- | --- |
| Slow dependency | Timeout and circuit breaker |
| Temporary failure | Retry with exponential backoff and jitter |
| Overload | Rate limiting, load shedding, backpressure |
| Regional outage | Failover or multi-region design |
| Poison message | Dead-letter queue and replay tooling |

### Sub-topic: Design Rule

Every critical dependency should have a failure behavior. The answer should not stop at "call service X." It should state what happens when service X is slow, unavailable, or returns inconsistent data.

## Topic: Observability

### Sub-topic: Signals

Use logs for facts, metrics for trends, traces for request paths, and alerts for user-impacting symptoms.

### Sub-topic: What to Measure

| Signal | Examples |
| --- | --- |
| Latency | p50, p95, p99 by endpoint |
| Traffic | requests per second, queue depth |
| Errors | 4xx, 5xx, dependency failures |
| Saturation | CPU, memory, connection pool usage |
| Business health | successful checkouts, failed payments |

### Sub-topic: Alerting Rule

Alert on symptoms before internals. A high CPU alert may be useful, but a rising checkout failure rate is more directly tied to user impact.

## Topic: Rollouts

### Sub-topic: Safety Mechanisms

- Feature flags
- Canary deployments
- Rollbacks
- Backward-compatible schema changes

### Sub-topic: Deployment Strategy

Use feature flags to separate deployment from release. Deploy code safely, enable it for a small percentage of traffic, watch metrics, then expand. For database changes, use expand-and-contract: add new schema first, dual-write or migrate, switch readers, then remove old schema.

### Sub-topic: Interview Application

When describing a new architecture, mention how it will be rolled out. This is a senior signal because production systems rarely change in one step.
