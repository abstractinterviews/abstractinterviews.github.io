---
layout: default
title: "Stacks"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Last-in-first-out state for matching, backtracking, monotonic scans, and undo-style reasoning."
read_time: "12 min read"
difficulty: "Core"
practice_count: 30
previous_topic:
  title: "Linked Lists"
  url: "/coding-round/data-structures/linked-lists/"
next_topic:
  title: "Queues"
  url: "/coding-round/data-structures/queues/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Last-in-first-out state for matching, backtracking, monotonic scans, and undo-style reasoning.

### Why candidates need it

Stacks model nested or unresolved work: parentheses, calls, paths, and previous candidates that may be resolved later.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

A monotonic stack is useful because of its ordering invariant. Without naming that invariant, the solution sounds memorized.

## Mental Model

### Top is the active context

Name the invariant before coding.

### Pop means resolved

Tie the invariant to the operation cost.

### A monotonic stack compresses history

Test the boundary where the invariant can break.

## Practice

### Example 1: Valid Parentheses

Push openings and pop on matching closings.

Input: `s = "()[]{}"`

Output: `true`

Explanation: The top of stack must match the next closing bracket.

```python
def is_valid(s):
    pairs = {')': "(", ']': "[", '}': "{"}
    stack = []
    for ch in s:
        if ch in pairs.values():
            stack.append(ch)
        elif not stack or stack.pop() != pairs[ch]:
            return False
    return not stack
```

Time: O(n)

Space: O(n)

### Example 2: Daily Temperatures

Use a decreasing stack of unresolved days.

Input: `[73, 74, 75, 71]`

Output: `[1, 1, 0, 0]`

Explanation: A warmer day resolves earlier colder days.

```python
def daily_temperatures(temps):
    ans = [0] * len(temps)
    stack = []
    for i, temp in enumerate(temps):
        while stack and temps[stack[-1]] < temp:
            j = stack.pop()
            ans[j] = i - j
        stack.append(i)
    return ans
```

Time: O(n)

Space: O(n)

## Common Patterns

### Matching Stack

Validate nested tokens.

### Monotonic Stack

Find next greater/smaller values.

### Explicit DFS Stack

Avoid recursion depth risk.

### Undo Stack

Reverse recent operations.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Push | O(1) | Append top |
| Pop | O(1) | Remove top |
| Peek | O(1) | Read top |
| Search | O(n) | No lookup index |
| Space | O(n) | Unresolved items |

## Practice Problems

### Easy

- Valid Parentheses
- Baseball Game
- Min Stack

### Medium

- Daily Temperatures
- Evaluate RPN
- Decode String

### Hard

- Largest Rectangle in Histogram
- Basic Calculator
- Remove Duplicate Letters

## Key Takeaways

- Choose Stacks because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Stacks
- Last-in-first-out state for matching, backtracking, monotonic scans, and undo-style reasoning.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Stacks, Queues, and Heaps](/data-structures/stacks-queues-heaps/#stack)
- [Monotonic Stack](/coding-round/patterns/monotonic-stack/)
- [DFS](/coding-round/patterns/dfs/)
- [Queues](/coding-round/data-structures/queues/)
