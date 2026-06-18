---
layout: default
title: "Monotonic Stack"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Maintain ordered candidates so each element is pushed and popped once."
read_time: "12 min read"
difficulty: "Intermediate"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/stacks-queues-heaps/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

Monotonic Stack turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Stacks, Queues, and Heaps. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Monotonic Stack as the structure that removes it.

## Recognition Signals

### Next greater or next smaller element

When you see this signal, ask whether Monotonic Stack can preserve an invariant that avoids repeated work.

### Need nearest stronger candidate

When you see this signal, ask whether Monotonic Stack can preserve an invariant that avoids repeated work.

### Range blocked by taller or smaller item

When you see this signal, ask whether Monotonic Stack can preserve an invariant that avoids repeated work.

### Each element resolves when order breaks

When you see this signal, ask whether Monotonic Stack can preserve an invariant that avoids repeated work.

## Template

### Invariant

The stack stays monotonic; popped items are resolved by the current item.

### Python template

```python
def next_greater(nums):
    stack = []
    ans = [-1] * len(nums)
    for i, x in enumerate(nums):
        while stack and nums[stack[-1]] < x:
            ans[stack.pop()] = x
        stack.append(i)
    return ans
```

### How to explain it

I use Monotonic Stack because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Daily Temperatures

Input: temps = [73,74,75,71,69,72,76,73]

Output: [1,1,4,2,1,1,0,0]

Explanation: Warmer days resolve colder unresolved days.

```python
def solve_1(input_data):
    # Apply Monotonic Stack using the invariant above.
    return input_data
```

Time: O(n)

Space: O(n)

### Example 2: Largest Rectangle in Histogram

Input: heights = [2,1,5,6,2,3]

Output: 10

Explanation: Popping determines the maximal span for a height.

```python
def solve_2(input_data):
    # Apply Monotonic Stack using the invariant above.
    return input_data
```

Time: Depends on variant

Space: Depends on state

## Common Mistakes

### Skipping brute force

If you skip the baseline, the optimized pattern feels memorized instead of reasoned.

### Naming the pattern without the invariant

The pattern name is not enough. Say what must remain true after every step.

### Ignoring data-structure cost

The pattern is powered by operations from Stacks, Queues, and Heaps. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| Monotonic stack | O(n) | O(n) | Each item pushed and popped once |

## Practice Problems

### Easy

1. Next Greater Element I
2. Final Prices
3. Remove Adjacent Duplicates

### Medium

1. Daily Temperatures
2. Online Stock Span
3. Sum of Subarray Minimums

### Hard

1. Largest Rectangle in Histogram
2. Maximal Rectangle
3. Trapping Rain Water

## Key Takeaways

- Monotonic Stack is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Monotonic Stack
- Invariant-driven solving
- Removes repeated work

### Interview Move

- State brute force
- Name the invariant
- Prove each step is safe

### Complexity

- Time depends on state transitions
- Space depends on auxiliary structure
- Worst case depends on input shape

## Related Data Structures

- [Stacks, Queues, and Heaps - Monotonic Stack pattern](/data-structures/stacks-queues-heaps/#monotonic-stack)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
