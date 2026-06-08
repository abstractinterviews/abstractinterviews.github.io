---
layout: default
title: "Round Strategy"
page_type: deep-dive-post
subtitle: "How to adapt your behavior to the round type."
read_time: "8 min read"
difficulty: Core
post_tabs:
  - label: Overview
    href: "#overview"
  - label: Round Types
    href: "#round-types"
  - label: Time Boxing
    href: "#time-boxing"
  - label: Recovery
    href: "#recovery"
toc:
  - label: "Overview"
    href: "#overview"
  - label: "Round Types"
    href: "#round-types"
  - label: "Time Boxing"
    href: "#time-boxing"
  - label: "Recovery"
    href: "#recovery"
previous_topic:
  title: "Communication Playbook"
  url: "/interview/communication-playbook/"
next_topic:
  title: "Mock Interview Checklist"
  url: "/interview/mock-interview-checklist/"
---

## Topic: Overview

### Sub-topic: Key Idea

Different rounds evaluate different signals. Do not use the same pacing for every interview.

### Sub-topic: Strategy Principle

Before each round, identify the primary signal. A coding interviewer is usually evaluating correctness under constraints. A system design interviewer is evaluating architecture judgment. A behavioral interviewer is evaluating ownership and collaboration. Your pacing, examples, and depth should match that signal.

## Topic: Round Types

### Sub-topic: What To Optimize

| Round | Optimize For |
| --- | --- |
| Coding | Correctness, complexity, edge cases |
| System Design | Scope, architecture, trade-offs |
| LLD | Object boundaries, extensibility, clean APIs |
| Architecture | Judgment, reliability, evolution |
| Behavioral | Ownership, conflict handling, impact |

### Sub-topic: Round-Specific Tactics

| Round | Tactic |
| --- | --- |
| Coding | Confirm examples, state brute force, then optimize |
| System Design | Start with requirements, APIs, data model, and bottlenecks |
| LLD | Define entities, responsibilities, interfaces, and extension points |
| Architecture | Discuss quality attributes, operational risks, and migration |
| Behavioral | Use situation, action, result, and reflection |

## Topic: Time Boxing

### Sub-topic: Default Split

- 5 minutes: clarify.
- 10 minutes: baseline.
- 15 minutes: deep dive.
- 5 minutes: trade-offs and wrap-up.

### Sub-topic: Warning Signs

- You are still clarifying after 10 minutes.
- You have not shown a working baseline halfway through the round.
- You are explaining implementation details before defining responsibilities.
- You are still coding when there are fewer than three minutes left and no tests have been discussed.

### Sub-topic: Adjustment Rule

If time is short, stop adding detail and summarize. A partial but well-explained solution is usually better than an unfinished solution with no conclusion.

## Topic: Recovery

### Sub-topic: When Stuck

State what you know, name the uncertainty, propose a smaller version, then iterate.

### Sub-topic: Recovery Script

"I am stuck on the full version because of [specific uncertainty]. I will solve a smaller version first: [reduced case]. Once that works, I will extend it to [missing complexity]."

### Sub-topic: Examples

- Coding: solve for positive numbers first, then add negative values.
- System design: design for one region first, then add multi-region failover.
- LLD: implement one strategy first, then add a strategy interface for extensibility.
- Architecture: choose a synchronous baseline first, then evaluate asynchronous processing.
