---
layout: default
title: "Software Architecture"
page_type: deep-dive-index
deep_dive_id: software-architecture
deep_title: "Software Architecture"
subtitle: "Architecture concepts, patterns, and decision frameworks for senior engineering interviews."
hero_icon: "▦"
badges:
  - Core Track
  - Architecture
  - "~35 min read"
stats:
  - value: "4"
    label: "Sub Topics"
  - value: "20+"
    label: "Patterns"
  - value: "8"
    label: "Trade-offs"
  - value: "5"
    label: "Decision Models"
overview: "Software architecture is about boundaries, quality attributes, integration style, operational reliability, and long-term system evolution."
key_takeaways:
  - Design around boundaries
  - Tie decisions to quality attributes
  - Treat operations as part of architecture
  - Make evolution explicit
subtopics:
  - title: "Architecture Fundamentals"
    description: "Core vocabulary for boundaries, modules, services, and quality attributes."
    read_time: "8 min read"
    url: "/architecture/fundamentals/"
    icon: "F"
    color: "blue"
  - title: "Architecture Patterns"
    description: "Layered, hexagonal, event-driven, microservices, and modular monoliths."
    read_time: "10 min read"
    url: "/architecture/patterns/"
    icon: "P"
    color: "violet"
  - title: "Reliability and Operations"
    description: "Resilience, observability, rollout safety, and production readiness."
    read_time: "9 min read"
    url: "/architecture/reliability-operations/"
    icon: "R"
    color: "green"
  - title: "Architecture Decision Records"
    description: "How to capture and defend decisions in interview and real project settings."
    read_time: "6 min read"
    url: "/architecture/decision-records/"
    icon: "D"
    color: "amber"
related_concepts:
  - title: "System Design"
    url: "/fundamentals/"
  - title: "50 System Design Patterns"
    url: "/50-system-design-patterns/"
  - title: "Interview Readiness"
    url: "/interview/"
---

# Software Architecture

## Topic: Overview

### Sub-topic: Key Idea

Architecture decisions shape how a system changes, fails, scales, and is operated.

## Topic: Quality Attributes

### Sub-topic: Common Dimensions

| Attribute | Question |
| --- | --- |
| Availability | What happens when dependencies fail? |
| Scalability | Which part scales independently? |
| Maintainability | Which team owns each boundary? |
| Observability | How do we know it is broken? |
| Security | Where are trust boundaries? |

## Topic: Interview Lens

### Sub-topic: What Interviewers Evaluate

- Boundary judgment.
- Reliability thinking.
- Trade-off clarity.
- Migration and evolution strategy.

## Topic: Architecture Thinking Model

### Sub-topic: Start With Quality Attributes

Architecture is not just drawing boxes. The important question is what qualities the system must preserve as it grows: availability, latency, consistency, security, maintainability, cost, and deployability. A good interview answer names the top two or three qualities and makes decisions around them.

### Sub-topic: Boundary First

Before choosing microservices, queues, or databases, define boundaries. Ask which capabilities change together, which teams own them, and which data belongs to each boundary. Bad boundaries create duplicated logic, cross-service transactions, and unclear ownership.

## Topic: Architecture Decision Flow

### Sub-topic: Practical Sequence

1. Define business capabilities and ownership boundaries.
2. Identify quality attributes that matter most.
3. Choose an architecture style that fits team and scale.
4. Define integration style: synchronous API, async event, queue, or stream.
5. Plan failure handling and observability.
6. Explain migration and evolution path.

### Sub-topic: Example

For an order management platform, payment, inventory, fulfillment, and notification are separate business capabilities. They may communicate asynchronously because temporary delay is acceptable, but payment authorization may remain synchronous because user checkout needs immediate confirmation.

## Topic: Common Architecture Trade-offs

### Sub-topic: Trade-off Table

| Choice | Helps With | Costs |
| --- | --- | --- |
| Modular monolith | Simpler operations, strong local consistency | Harder independent scaling |
| Microservices | Independent ownership and deployment | Network, observability, and data complexity |
| Event-driven flow | Decoupling and spike absorption | Event ordering and debugging complexity |
| Shared database | Simple reporting and joins | Tight coupling and ownership confusion |
| API gateway | Central routing and policy | Another critical dependency |

### Sub-topic: Interview Rule

Do not present architecture choices as universally good. Every choice is good under a constraint and bad under another. State the constraint explicitly.
