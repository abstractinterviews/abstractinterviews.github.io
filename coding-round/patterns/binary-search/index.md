---
layout: default
title: "Binary Search"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Cut the search space in half when the predicate is monotonic."
read_time: "12 min read"
difficulty: "Core"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/selection-complexity/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

Binary Search turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Selection and Complexity. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Binary Search as the structure that removes it.

## Recognition Signals

### Sorted input

When you see this signal, ask whether Binary Search can preserve an invariant that avoids repeated work.

### Find first or last valid answer

When you see this signal, ask whether Binary Search can preserve an invariant that avoids repeated work.

### Search answer space

When you see this signal, ask whether Binary Search can preserve an invariant that avoids repeated work.

### Predicate changes from false to true once

When you see this signal, ask whether Binary Search can preserve an invariant that avoids repeated work.

## Template

### Invariant

The answer remains inside the current low-high boundary.

### Python template

```python
def binary_search(low, high):
    while low < high:
        mid = (low + high) // 2
        if valid(mid):
            high = mid
        else:
            low = mid + 1
    return low
```

### How to explain it

I use Binary Search because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Search Insert Position

Input: nums = [1,3,5,6], target = 5

Output: 2

Explanation: Sorted order enables halving.

```python
def solve_1(input_data):
    # Apply Binary Search using the invariant above.
    return input_data
```

Time: O(log n)

Space: O(1)

### Example 2: Koko Eating Bananas

Input: piles and hours

Output: minimum speed

Explanation: Binary search over answer speed.

```python
def solve_2(input_data):
    # Apply Binary Search using the invariant above.
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

The pattern is powered by operations from Selection and Complexity. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| Index search | O(log n) | O(1) | Search sorted data |
| Answer search | O(log range * check) | O(1) | Predicate cost matters |

## Practice Problems

### Easy

1. Binary Search
2. Search Insert Position
3. First Bad Version

### Medium

1. Search in Rotated Sorted Array
2. Find Minimum in Rotated Sorted Array
3. Koko Eating Bananas

### Hard

1. Median of Two Sorted Arrays
2. Split Array Largest Sum
3. Minimum Time to Complete Trips

## Key Takeaways

- Binary Search is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Binary Search
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

- [Selection and Complexity - selection rules](/data-structures/selection-complexity/#selection)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
