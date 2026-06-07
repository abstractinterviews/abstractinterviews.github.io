---
layout: default
title: "Fundamentals"
page_type: deep-dive-index
deep_dive_id: fundamentals
deep_title: "Deep Dive: Fundamentals"
subtitle: "Core mental models for scaling, reliability, consistency, estimation, and distributed design patterns."
hero_icon: "F"
badges:
  - Foundation
  - Interview Core
  - "~50 min read"
stats:
  - value: "5"
    label: "Sub Topics"
  - value: "5+"
    label: "Diagrams"
  - value: "8"
    label: "Mental Models"
  - value: "20+"
    label: "Interview Checks"
overview: "Fundamentals give every system design answer its shape. Use this section to reason about scale, latency, failure, consistency, capacity, and the distributed patterns that connect those trade-offs."
key_takeaways:
  - Define workload before naming technology
  - Tie every design choice to a trade-off
  - Separate happy path from failure path
  - Use quick estimates to sanity-check scale
subtopics:
  - title: "Scalability and Performance"
    description: "Reason about load growth, bottlenecks, latency budgets, and scaling patterns."
    read_time: "10 min read"
    url: "/fundamentals/scalability/"
    icon: "S"
    color: "blue"
  - title: "CAP Theorem and Consistency Models"
    description: "Choose consistency behavior per operation under partition and replica lag."
    read_time: "9 min read"
    url: "/fundamentals/cap-theorem/"
    icon: "C"
    color: "violet"
  - title: "High Availability and Fault Tolerance"
    description: "Design redundancy, failover, graceful degradation, and recovery playbooks."
    read_time: "9 min read"
    url: "/fundamentals/high-availability/"
    icon: "H"
    color: "green"
  - title: "Back-of-the-Envelope Estimation"
    description: "Convert product assumptions into RPS, storage, bandwidth, and headroom."
    read_time: "8 min read"
    url: "/fundamentals/estimation/"
    icon: "E"
    color: "amber"
  - title: "Distributed Patterns"
    description: "Apply CQRS, event sourcing, sagas, outbox, circuit breakers, and consistency patterns."
    read_time: "28 min read"
    url: "/fundamentals/patterns/"
    icon: "P"
    color: "red"
related_concepts:
  - title: "Core Components"
    url: "/components/"
  - title: "Databases"
    url: "/components/databases/"
  - title: "API and Communication"
    url: "/components/api-and-communication/"
  - title: "Case Studies"
    url: "/case-studies/"
---

# Fundamentals

This section builds the base mental models needed for every system design interview, from latency and availability to capacity and failure handling.

## Topic: Topic Map

### Sub-topic: Section Directory

- [Scalability and Performance](./scalability/)
- [CAP Theorem and Consistency Models](./cap-theorem/)
- [High Availability and Fault Tolerance](./high-availability/)
- [Back-of-the-Envelope Estimation](./estimation/)
- [Distributed Patterns](./patterns/)

![System design fundamentals map connecting scalability, CAP and consistency, high availability, and estimation.](./assets/fundamentals.png)

*Figure 1: System Design Fundamentals Map*

## Topic: Study Path

### Sub-topic: Recommended Sequence

1. Read in the order listed above.
2. Practice explaining each topic in 2 minutes.
3. For each case study, explicitly call out which fundamental trade-offs are in play.

## Topic: Core Questions

### Sub-topic: Key Idea

| Question | What You Should Be Able To Explain |
| --- | --- |
| How does the system scale? | Vertical vs horizontal growth |
| What fails first? | Bottlenecks and single points of failure |
| How consistent does it need to be? | Strong, eventual, or hybrid consistency |
| How much can it handle? | RPS, storage, bandwidth, and headroom |

## Topic: Interview Checklist

### Sub-topic: Answer Structure

- Define workload shape before naming technologies.
- Tie every design choice to a visible trade-off.
- Mention both happy-path and failure-path behavior.
- Use quick estimates to sanity-check the design.
