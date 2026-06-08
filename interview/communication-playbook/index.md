---
layout: default
title: "Communication Playbook"
page_type: deep-dive-post
subtitle: "How to make your reasoning easy for interviewers to evaluate."
read_time: "7 min read"
difficulty: Core
post_tabs:
  - label: Overview
    href: "#overview"
  - label: Patterns
    href: "#patterns"
  - label: Trade-offs
    href: "#trade-offs"
  - label: Practice
    href: "#practice"
toc:
  - label: "Overview"
    href: "#overview"
  - label: "Patterns"
    href: "#patterns"
  - label: "Trade-offs"
    href: "#trade-offs"
  - label: "Practice"
    href: "#practice"
previous_topic:
  title: "Interview Framework"
  url: "/interview/interview-framework/"
next_topic:
  title: "Round Strategy"
  url: "/interview/round-strategy/"
---

## Topic: Overview

### Sub-topic: Key Idea

Communication is not extra commentary. It is how the interviewer observes your decision-making.

## Topic: Patterns

### Sub-topic: Speak in Decisions

Prefer: "I am choosing Redis because reads dominate and stale data is acceptable for five minutes."

Avoid: "We can use Redis here."

## Topic: Trade-offs

### Sub-topic: Decision Table

| Decision | Benefit | Cost |
| --- | --- | --- |
| Cache reads | Lower latency | Stale data risk |
| Async queue | Smooth spikes | Delayed processing |
| Microservice | Independent scaling | More operational overhead |

## Topic: Practice

### Sub-topic: Drill

Take any previous project and explain it in four sentences: goal, constraints, design, trade-off.
