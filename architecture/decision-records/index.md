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

## Topic: Example

### Sub-topic: Cache Choice

Decision: Use cache-aside Redis for product detail reads because traffic is read-heavy and stale data for five minutes is acceptable.

## Topic: Interview Use

### Sub-topic: Speaking Pattern

Use ADR language verbally: "Given this context, I would choose X over Y. The consequence is Z, which is acceptable because..."
