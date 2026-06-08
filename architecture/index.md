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
