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
