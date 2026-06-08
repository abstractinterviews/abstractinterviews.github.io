---
layout: default
title: "Problem Solving Framework"
page_type: deep-dive-post
subtitle: "A repeatable framework for solving coding interview problems."
read_time: "8 min read"
difficulty: Core
post_tabs:
  - label: Flow
    href: "#flow"
  - label: Baseline
    href: "#baseline"
  - label: Optimize
    href: "#optimize"
toc:
  - label: "Flow"
    href: "#flow"
  - label: "Baseline"
    href: "#baseline"
  - label: "Optimize"
    href: "#optimize"
previous_topic:
  title: "Coding Round"
  url: "/coding-round/"
next_topic:
  title: "Coding Patterns"
  url: "/coding-round/coding-patterns/"
---

## Topic: Flow

### Sub-topic: Six Steps

Clarify, brute force, find repeated work, choose a pattern, implement, test.

### Sub-topic: Detailed Process

| Step | Purpose | Example |
| --- | --- | --- |
| Clarify | Remove ambiguity | "Can input contain negative numbers?" |
| Brute force | Prove understanding | Try all pairs for two-sum |
| Find repeated work | Locate optimization opportunity | Repeated lookup of complements |
| Choose pattern | Select technique | Hash map for complement lookup |
| Implement | Code with invariants | Map value to index while scanning |
| Test | Validate correctness | Empty, duplicate, no-solution cases |

### Sub-topic: Clarification Checklist

- What are input sizes?
- Can values repeat?
- Are values sorted?
- Are there negative values?
- Should output be values, indices, count, or boolean?
- What should happen for empty or invalid input?

## Topic: Baseline

### Sub-topic: Why It Matters

A baseline proves understanding and gives you a fallback if optimization becomes difficult.

### Sub-topic: Baseline Example

For two-sum, the baseline checks every pair. It is O(n^2), but it is simple and correct. Once stated, optimization becomes obvious: repeated pair lookup can be replaced by a hash map.

```python
def two_sum_brute(nums, target):
    for i in range(len(nums)):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []
```

### Sub-topic: Interview Benefit

If you cannot explain the brute force, you probably do not fully understand the problem. A concise baseline also gives the interviewer a chance to confirm you are solving the intended task.

## Topic: Optimize

### Sub-topic: Common Levers

- Avoid repeated scans.
- Add a hash map.
- Maintain a window.
- Use a heap for priority.
- Convert recursion to DP.

### Sub-topic: Optimization Questions

- Am I recomputing the same value?
- Can I store previous state?
- Can sorting create useful order?
- Can I maintain an answer while sliding a boundary?
- Can a priority queue avoid scanning all candidates?

### Sub-topic: Optimized Example

```python
def two_sum(nums, target):
    seen = {}
    for i, value in enumerate(nums):
        need = target - value
        if need in seen:
            return [seen[need], i]
        seen[value] = i
    return []
```

This is O(n) time and O(n) space. The invariant is that `seen` contains values from indices before the current index.

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Problem Solving Framework helps candidates discuss problem decomposition, invariants, edge cases, complexity, and implementation discipline with clarity. |
| What to emphasize | Start with the problem it solves, then explain trade-offs, constraints, and production impact. |
| Senior signal | Connect the concept to scale, reliability, operability, cost, and team ownership. |
| Common trap | Giving a definition without explaining when the approach works, when it fails, and how to validate it. |

## Key Takeaways

- Define Problem Solving Framework in one or two crisp sentences before expanding.
- Anchor the answer in constraints: scale, latency, consistency, correctness, cost, and maintainability.
- Compare at least one alternative and explain why it is weaker or stronger for the given scenario.
- Mention operational concerns such as monitoring, rollback, testing, ownership, and failure handling.
- Close with a practical rule of thumb that helps the interviewer see judgment, not memorization.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Clarify the prompt"] --> B["Define Problem Solving Framework"]
    B --> C["Identify constraints"]
    C --> D["Choose an approach"]
    D --> E["Discuss trade-offs"]
    E --> F["Cover production concerns"]
    F --> G["Answer follow-ups"]
~~~

~~~mermaid
flowchart TD
    Problem["Problem or requirement"] --> Concept["Problem Solving Framework"]
    Concept --> Benefits["Benefits"]
    Concept --> Tradeoffs["Trade-offs"]
    Concept --> FailureModes["Failure modes"]
    Concept --> Operations["Operational checks"]
    Benefits --> Decision["Interview recommendation"]
    Tradeoffs --> Decision
    FailureModes --> Decision
    Operations --> Decision
~~~

## Mental Models

| Mental Model | How To Use It In Interviews |
| --- | --- |
| Problem first | Explain what problem Problem Solving Framework solves before naming tools or patterns. |
| Constraints shape design | A solution changes when throughput, latency, consistency, team size, or compliance changes. |
| Trade-off triangle | Balance correctness, complexity, and cost rather than claiming one perfect answer. |
| Failure-first thinking | Ask what breaks, how it is detected, and how the system recovers. |
| Evolution path | Describe a simple baseline, then evolve it as scale and requirements increase. |

Model the problem by state, operations, constraints, and invariants before choosing a data structure or algorithm.

## Real World Examples

| Scenario | How Problem Solving Framework Shows Up |
| --- | --- |
| Startup MVP | Choose the simplest implementation that validates the product without hiding future migration paths. |
| High-scale platform | Focus on bottlenecks, partitioning, caching, queues, rate limits, and operational dashboards. |
| Enterprise environment | Discuss compliance, auditability, access control, data retention, and change management. |
| Incident review | Tie the concept to detection, mitigation, rollback, and prevention. |

Use this when selecting between brute force, hashing, sorting, graph traversal, dynamic programming, or a production-friendly implementation.

## Interview Perspective

| Interviewer Probe | Strong Candidate Response |
| --- | --- |
| Why this approach? | State the requirement that makes it appropriate and name the trade-off it accepts. |
| What can go wrong? | Cover overload, stale data, race conditions, partial failure, poor observability, or unclear ownership. |
| How would you scale it? | Move from single-node assumptions to partitioning, replication, caching, async processing, or sharding. |
| How would you validate it? | Use tests, metrics, load tests, shadow traffic, canaries, and post-launch review. |

A strong answer is structured as: **definition -> constraints -> design choice -> trade-offs -> failure modes -> production plan**.

## Common Mistakes

- Jumping into implementation before clarifying goals and constraints.
- Treating the topic as a memorized definition instead of a decision tool.
- Ignoring edge cases, failure modes, and degraded behavior.
- Over-engineering the first version without explaining why complexity is justified.
- Forgetting security, observability, data retention, cost, or team ownership.
- Failing to compare alternatives when the interviewer asks for trade-offs.

## Follow-up Questions

1. When would you choose this approach over a simpler alternative?
2. What constraints would make this design break down?
3. How would you measure whether the solution is working?
4. What would you change for 10x traffic, 10x data volume, or stricter latency?
5. How would you explain the trade-off to a product manager or engineering leader?
6. What is the rollback plan if the approach causes production issues?
7. Which parts should be automated, monitored, or tested first?

## Production Insights

| Concern | Production Guidance |
| --- | --- |
| Observability | Track golden signals, business metrics, saturation, errors, and user-visible impact. |
| Reliability | Define SLOs, fallback behavior, retry limits, backpressure, and disaster recovery strategy. |
| Security | Validate inputs, enforce least privilege, protect sensitive data, and audit access. |
| Cost | Estimate compute, storage, bandwidth, operational overhead, and migration cost. |
| Maintainability | Keep ownership clear, document assumptions, and design for incremental change. |

Production code also needs input validation, failure handling, readable boundaries, tests, performance budgets, and maintainability.

## Cheat Sheet

| Question | Quick Answer |
| --- | --- |
| What is it? | A concept or technique used to solve a specific engineering or interview problem. |
| Why does it matter? | It gives structure to decisions and helps explain trade-offs under constraints. |
| What should I mention? | Requirements, alternatives, complexity, failure modes, and production readiness. |
| What should I avoid? | Vague definitions, one-size-fits-all claims, and ignoring operational reality. |
| How do I sound senior? | Discuss when the approach should not be used and how it evolves over time. |

## Flashcards

| Front | Back |
| --- | --- |
| What problem does Problem Solving Framework solve? | It helps structure a decision around requirements, constraints, trade-offs, and production impact. |
| What is the first interview step? | Clarify the prompt, success criteria, scale, and constraints before designing. |
| What makes an answer senior-level? | Clear trade-offs, realistic failure handling, operational awareness, and pragmatic sequencing. |
| What is a common failure mode? | Applying the concept mechanically without checking whether the constraints justify it. |
| How should you conclude? | Summarize the recommendation, key trade-off, and validation plan. |

## Related Topics

- [Interview Readiness]({{ '/interview/' | relative_url }})
- [System Design Patterns]({{ '/50-system-design-patterns/' | relative_url }})
- [Software Architecture]({{ '/architecture/' | relative_url }})
- [Coding Round]({{ '/coding-round/' | relative_url }})
- [Data Structures]({{ '/data-structures/' | relative_url }})

## Practice Questions

1. Explain Problem Solving Framework to an interviewer in 90 seconds.
2. Draw a diagram showing where this concept fits in a real system.
3. Compare this approach with one alternative and defend your choice.
4. Identify two bottlenecks and two failure modes.
5. Describe how you would test, monitor, and roll out this solution.
6. Re-answer the same question for a small startup and for a large enterprise.

Solve one easy, one medium, and one variant while explaining complexity and edge cases aloud.

## Revision Notes

- Start with the problem, not the terminology.
- Use a diagram to make the flow, ownership, or trade-off visible.
- Name constraints explicitly: scale, latency, consistency, correctness, cost, and operability.
- Discuss at least one alternative and one failure mode.
- End with validation: metrics, tests, rollout plan, and rollback strategy.
- Final interview move: summarize the recommendation in one sentence and state the key trade-off.

<!-- interview-module:end -->
