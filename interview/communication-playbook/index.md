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

### Sub-topic: What Good Communication Sounds Like

Good interview communication is concise, structured, and decision-oriented. You do not need to narrate every keystroke or every thought. You do need to expose the assumptions that affect correctness, scale, and trade-offs.

### Sub-topic: Communication Contract

- Say what you are doing before doing it.
- Explain why a choice fits the constraints.
- Pause after major decisions so the interviewer can redirect.
- Use examples when an abstraction may be unclear.
- Summarize frequently enough that the answer remains easy to follow.

## Topic: Patterns

### Sub-topic: Speak in Decisions

Prefer: "I am choosing Redis because reads dominate and stale data is acceptable for five minutes."

Avoid: "We can use Redis here."

### Sub-topic: Decision Formula

Use this sentence shape: "Given [constraint], I choose [option] because [benefit], accepting [cost]."

Examples:

- Given read-heavy traffic and tolerable staleness, I choose cache-aside Redis because it lowers read latency, accepting invalidation complexity.
- Given strict ordering requirements, I choose a single partition per entity because it preserves order, accepting limited parallelism.
- Given a small team, I choose a modular monolith first because it preserves boundaries without microservice operational overhead.

## Topic: Trade-offs

### Sub-topic: Decision Table

| Decision | Benefit | Cost |
| --- | --- | --- |
| Cache reads | Lower latency | Stale data risk |
| Async queue | Smooth spikes | Delayed processing |
| Microservice | Independent scaling | More operational overhead |

### Sub-topic: Trade-off Categories

| Category | Questions to Ask |
| --- | --- |
| Latency | Does this affect p95 or p99 user-visible response time? |
| Consistency | Can users tolerate stale or delayed data? |
| Cost | Does this add infrastructure, storage, or operational expense? |
| Complexity | Will this be harder to debug, deploy, or evolve? |
| Reliability | What new failure mode does this introduce? |

### Sub-topic: Anti-pattern

Avoid saying "it depends" as the final answer. It is acceptable as a starting point, but you must finish with a conditional decision: "If the write volume is low and freshness matters, I would use write-through. If reads dominate and brief staleness is acceptable, I would use cache-aside."

## Topic: Practice

### Sub-topic: Drill

Take any previous project and explain it in four sentences: goal, constraints, design, trade-off.

### Sub-topic: Drill Template

1. Goal: What problem did the system solve?
2. Constraint: What made the problem non-trivial?
3. Design: What did you build or choose?
4. Trade-off: What did you accept and why?

### Sub-topic: Evaluation Rubric

| Score | Description |
| --- | --- |
| 1 | Explanation is a list of technologies |
| 2 | Explanation includes components but weak reasoning |
| 3 | Explanation connects choices to constraints |
| 4 | Explanation includes trade-offs and failure modes |
| 5 | Explanation is concise, complete, and easy to challenge |
