---
layout: default
title: "Coding Patterns"
page_type: deep-dive-post
subtitle: "The recurring algorithmic patterns behind most coding interviews."
read_time: "12 min read"
difficulty: Intermediate
post_tabs:
  - label: Arrays
    href: "#arrays"
  - label: Graphs
    href: "#graphs"
  - label: DP
    href: "#dp"
toc:
  - label: "Arrays"
    href: "#arrays"
  - label: "Graphs"
    href: "#graphs"
  - label: "DP"
    href: "#dp"
previous_topic:
  title: "Problem Solving Framework"
  url: "/coding-round/problem-solving-framework/"
next_topic:
  title: "Edge Cases and Testing"
  url: "/coding-round/edge-cases-testing/"
---

## Topic: Arrays

### Sub-topic: Common Patterns

- Two pointers
- Sliding window
- Prefix sum
- Binary search

### Sub-topic: Two Pointers

Use two pointers when order matters and you can move boundaries based on a comparison. Typical problems include pair sum in a sorted array, reversing, partitioning, and merging.

```python
def has_pair_with_sum(nums, target):
    left, right = 0, len(nums) - 1
    while left < right:
        total = nums[left] + nums[right]
        if total == target:
            return True
        if total < target:
            left += 1
        else:
            right -= 1
    return False
```

### Sub-topic: Sliding Window

Use sliding window when you need the best contiguous range. The invariant should describe what the current window contains.

Examples:

- Longest substring without repeats.
- Minimum window containing characters.
- Maximum sum subarray of size `k`.
- Count subarrays satisfying a constraint.

### Sub-topic: Prefix Sum

Prefix sums convert range-sum queries into subtraction. With a hash map, they also solve "number of subarrays with sum k" style problems.

## Topic: Graphs

### Sub-topic: Common Patterns

- DFS
- BFS
- Topological sort
- Shortest path

### Sub-topic: DFS

DFS is useful for exploring connected components, recursion over trees, cycle detection, and backtracking. State management matters: decide whether `visited` is global, path-specific, or state-specific.

### Sub-topic: BFS

BFS is the default for shortest path in unweighted graphs and level-order traversal. Use a queue and mark nodes visited when enqueuing to avoid duplicates.

### Sub-topic: Topological Sort

Use topological sort when tasks have dependencies. If you cannot process all nodes, there is a cycle.

| Problem Type | Pattern |
| --- | --- |
| Course schedule | Topological sort |
| Word ladder | BFS |
| Number of islands | DFS or BFS |
| Clone graph | DFS with map |
| Shortest weighted path | Dijkstra |

## Topic: DP

### Sub-topic: Mental Model

Define state, transition, base case, and answer extraction.

### Sub-topic: DP Checklist

1. What is the smallest subproblem?
2. What state uniquely identifies a subproblem?
3. What choices transition between states?
4. What base cases stop recursion?
5. Is the answer one state or an aggregate?

### Sub-topic: Example

For climbing stairs, `dp[i]` is the number of ways to reach step `i`. The transition is `dp[i] = dp[i - 1] + dp[i - 2]`. The base cases are `dp[0] = 1` and `dp[1] = 1`.

```python
def climb_stairs(n):
    prev2, prev1 = 1, 1
    for _ in range(2, n + 1):
        prev2, prev1 = prev1, prev1 + prev2
    return prev1
```

### Sub-topic: Interview Warning

Do not jump to DP without defining state. If the state is unclear, the solution will be difficult to explain and debug.

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Coding Patterns helps candidates discuss problem decomposition, invariants, edge cases, complexity, and implementation discipline with clarity. |
| What to emphasize | Start with the problem it solves, then explain trade-offs, constraints, and production impact. |
| Senior signal | Connect the concept to scale, reliability, operability, cost, and team ownership. |
| Common trap | Giving a definition without explaining when the approach works, when it fails, and how to validate it. |

## Key Takeaways

- Define Coding Patterns in one or two crisp sentences before expanding.
- Anchor the answer in constraints: scale, latency, consistency, correctness, cost, and maintainability.
- Compare at least one alternative and explain why it is weaker or stronger for the given scenario.
- Mention operational concerns such as monitoring, rollback, testing, ownership, and failure handling.
- Close with a practical rule of thumb that helps the interviewer see judgment, not memorization.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Clarify the prompt"] --> B["Define Coding Patterns"]
    B --> C["Identify constraints"]
    C --> D["Choose an approach"]
    D --> E["Discuss trade-offs"]
    E --> F["Cover production concerns"]
    F --> G["Answer follow-ups"]
~~~

~~~mermaid
flowchart TD
    Problem["Problem or requirement"] --> Concept["Coding Patterns"]
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
| Problem first | Explain what problem Coding Patterns solves before naming tools or patterns. |
| Constraints shape design | A solution changes when throughput, latency, consistency, team size, or compliance changes. |
| Trade-off triangle | Balance correctness, complexity, and cost rather than claiming one perfect answer. |
| Failure-first thinking | Ask what breaks, how it is detected, and how the system recovers. |
| Evolution path | Describe a simple baseline, then evolve it as scale and requirements increase. |

Model the problem by state, operations, constraints, and invariants before choosing a data structure or algorithm.

## Real World Examples

| Scenario | How Coding Patterns Shows Up |
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
| What problem does Coding Patterns solve? | It helps structure a decision around requirements, constraints, trade-offs, and production impact. |
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

1. Explain Coding Patterns to an interviewer in 90 seconds.
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
