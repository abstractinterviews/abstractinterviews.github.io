---
layout: default
title: "Architecture Decision Records"
page_type: deep-dive-post
subtitle: "A lightweight way to document and defend architecture choices."
read_time: "6 min read"
difficulty: Core
post_tabs:
  - label: Structure
    href: "#structure"
  - label: Example
    href: "#example"
  - label: Interview Use
    href: "#interview-use"
toc:
  - label: "Structure"
    href: "#structure"
  - label: "Example"
    href: "#example"
  - label: "Interview Use"
    href: "#interview-use"
previous_topic:
  title: "Reliability and Operations"
  url: "/architecture/reliability-operations/"
next_topic:
  title: "Software Architecture"
  url: "/architecture/"
---

## Topic: Structure

### Sub-topic: ADR Format

- Context
- Decision
- Alternatives
- Consequences
- Follow-up

### Sub-topic: Why ADRs Matter

Architecture decisions are often revisited months later when constraints have changed. ADRs preserve the reasoning behind a choice, including what was known at the time and which alternatives were rejected. This prevents teams from relitigating the same decision without context.

### Sub-topic: Good ADR Properties

- Short enough to read quickly.
- Specific about constraints.
- Honest about trade-offs.
- Clear about what was rejected.
- Updated when the decision is superseded.

## Topic: Example

### Sub-topic: Cache Choice

Decision: Use cache-aside Redis for product detail reads because traffic is read-heavy and stale data for five minutes is acceptable.

### Sub-topic: Full Example

| Section | Content |
| --- | --- |
| Context | Product detail pages receive high repeated read traffic. Database p95 latency is rising during peak hours. |
| Decision | Use cache-aside Redis with five-minute TTL and jitter. |
| Alternatives | Direct database reads, CDN-only caching, read-through cache. |
| Consequences | Lower read latency, lower database load, possible stale reads, invalidation complexity. |
| Follow-up | Monitor hit ratio, miss latency, eviction rate, and stale-data complaints. |

## Topic: Interview Use

### Sub-topic: Speaking Pattern

Use ADR language verbally: "Given this context, I would choose X over Y. The consequence is Z, which is acceptable because..."

### Sub-topic: Interview Example

"Given this is an early-stage product with one backend team, I would choose a modular monolith over microservices. The consequence is that scaling is less granular, but the benefit is simpler deployment and stronger consistency while the domain boundaries are still evolving."

### Sub-topic: Practice Drill

Take any design decision and write a five-line ADR. If you cannot name the rejected alternatives and consequences, your interview explanation is likely too shallow.
