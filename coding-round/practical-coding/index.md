---
layout: default
title: "Practical Coding Rounds"
page_type: deep-dive-post
subtitle: "Implementation-heavy rounds for APIs, parsers, caches, and schedulers."
read_time: "9 min read"
difficulty: Intermediate
post_tabs:
  - label: Formats
    href: "#formats"
  - label: Design
    href: "#design"
  - label: Quality
    href: "#quality"
toc:
  - label: "Formats"
    href: "#formats"
  - label: "Design"
    href: "#design"
  - label: "Quality"
    href: "#quality"
previous_topic:
  title: "Edge Cases and Testing"
  url: "/coding-round/edge-cases-testing/"
next_topic:
  title: "Coding Round"
  url: "/coding-round/"
---

## Topic: Formats

### Sub-topic: Common Tasks

- Implement an LRU cache.
- Build a rate limiter.
- Parse logs or expressions.
- Design an in-memory scheduler.
- Implement a small service API.

### Sub-topic: What Makes Practical Coding Different

Practical rounds test implementation judgment more than algorithm tricks. The interviewer is looking for clean data models, readable operations, input validation, error handling, and reasonable extensibility.

### Sub-topic: Example Task Breakdown

For an in-memory rate limiter:

- Define the key: user ID, IP, API key, or endpoint.
- Define the policy: fixed window, sliding window, token bucket.
- Define storage: map from key to counters or timestamps.
- Define cleanup: remove old timestamps or expired windows.
- Define behavior: allow, reject, or retry-after.

## Topic: Design

### Sub-topic: Key Habit

Separate data model, operations, validation, and error handling.

### Sub-topic: Implementation Structure

```text
Class or module
  - state/data structures
  - public operations
  - validation helpers
  - internal mutation helpers
  - tests or examples
```

### Sub-topic: LRU Cache Example

An LRU cache needs O(1) lookup and O(1) recency update. Use a hash map for key lookup and a doubly linked list for recency ordering. State the invariant: the head is most recent and the tail is least recent.

## Topic: Quality

### Sub-topic: What Matters

Readable code, explicit invariants, small helpers, and clear test cases.

### Sub-topic: Evaluation Checklist

| Area | Good Signal |
| --- | --- |
| API | Clear method names and return values |
| State | Minimal, coherent, and encapsulated |
| Errors | Invalid input handled deliberately |
| Complexity | Operations meet expected cost |
| Tests | Normal and boundary cases covered |

### Sub-topic: Interview Tip

If requirements are likely to evolve, say where extension points belong. Example: "I will start with fixed window rate limiting, but I would hide the policy behind an interface so token bucket can be added without changing callers."
