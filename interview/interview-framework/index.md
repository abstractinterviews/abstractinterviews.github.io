---
layout: default
title: "Interview Framework"
page_type: deep-dive-post
subtitle: "A repeatable structure for moving through technical interviews."
read_time: "8 min read"
difficulty: Core
post_tabs:
  - label: Overview
    href: "#overview"
  - label: Flow
    href: "#flow"
  - label: Prompts
    href: "#prompts"
  - label: Mistakes
    href: "#mistakes"
toc:
  - label: "Overview"
    href: "#overview"
  - label: "Flow"
    href: "#flow"
  - label: "Prompts"
    href: "#prompts"
  - label: "Mistakes"
    href: "#mistakes"
previous_topic:
  title: "Interview Readiness"
  url: "/interview/"
next_topic:
  title: "Communication Playbook"
  url: "/interview/communication-playbook/"
---

## Topic: Overview

### Sub-topic: Purpose

Use a framework to reduce cognitive load. You should spend effort on the problem, not on deciding what to do next.

## Topic: Flow

### Sub-topic: Five Steps

1. Clarify the goal and constraints.
2. Present a baseline approach.
3. Deep dive into the riskiest part.
4. Discuss trade-offs and failure modes.
5. Summarize the final answer.

### Sub-topic: Detailed Flow

| Step | What to Say | What to Produce |
| --- | --- | --- |
| Clarify | "Let me confirm the user, scale, and success criteria." | A scoped version of the problem |
| Baseline | "I will start with a simple design that satisfies the core requirements." | A workable first solution |
| Deep Dive | "The riskiest part is likely X, so I will go deeper there." | APIs, data model, algorithm, or failure behavior |
| Trade-offs | "This choice improves X but costs Y." | A comparison of alternatives |
| Summary | "The final design has these components and these known risks." | A coherent closing narrative |

### Sub-topic: Why This Works

The framework gives the interviewer predictable checkpoints. They can interrupt, redirect, or challenge at any point because your structure makes the current state of the answer clear.

## Topic: Prompts

### Sub-topic: Useful Sentences

- "Let me confirm the success criteria first."
- "I will start with a simple design and then scale it."
- "The main trade-off here is latency versus consistency."
- "If we had more time, I would validate this with load and failure tests."

### Sub-topic: Clarifying Questions

- Who are the primary users?
- What is the expected read and write volume?
- What latency target matters: average, p95, or p99?
- Is data freshness strict or can it be eventual?
- What must continue working during dependency failure?

### Sub-topic: Transition Phrases

- "Now that the requirements are scoped, I will define the core data model."
- "This baseline works for small scale; the first bottleneck is likely database reads."
- "There are two reasonable options here. I will compare them before choosing one."
- "Let me summarize the design and the main trade-offs."

## Topic: Mistakes

### Sub-topic: Common Failures

- Solving before clarifying.
- Jumping to advanced patterns without a baseline.
- Ignoring the interviewer’s hints.
- Ending without a summary.

### Sub-topic: Correction Patterns

| Mistake | Correction |
| --- | --- |
| Too much detail too early | Pause and ask which part the interviewer wants to explore |
| Wrong assumption | Acknowledge it, restate the corrected constraint, and adjust |
| Stuck on implementation | Explain the invariant and walk a small example |
| Running out of time | Summarize current solution and name remaining risks |

## Topic: Example Walkthrough

### Sub-topic: System Design Example

For "design a URL shortener", the framework would produce this sequence: clarify custom aliases and expiration, propose API plus database plus redirect service, deep dive into key generation and read latency, compare cache-aside versus direct database reads, then summarize failure handling and observability.

### Sub-topic: Coding Example

For "longest substring without repeating characters", clarify character set and empty string behavior, present brute force, identify repeated scans, choose sliding window with a set or map, test duplicates and empty input, then state O(n) time and O(k) space.
