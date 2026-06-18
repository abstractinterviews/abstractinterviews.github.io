---
layout: default
title: "Sliding Window"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Maintain a moving range over contiguous data while updating state incrementally."
read_time: "12 min read"
difficulty: "Core"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/arrays-hashing/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

Sliding Window turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Arrays & Hashing. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Sliding Window as the structure that removes it.

## Recognition Signals

### Contiguous subarray or substring

When you see this signal, ask whether Sliding Window can preserve an invariant that avoids repeated work.

### Longest, shortest, or count of valid windows

When you see this signal, ask whether Sliding Window can preserve an invariant that avoids repeated work.

### Window validity changes as boundaries move

When you see this signal, ask whether Sliding Window can preserve an invariant that avoids repeated work.

### Repeated range recomputation is too slow

When you see this signal, ask whether Sliding Window can preserve an invariant that avoids repeated work.

## Template

### Invariant

The window contains exactly the state needed to decide whether it is valid.

### Python template

```python
def sliding_window(nums):
    left = 0
    state = {}
    best = 0
    for right, value in enumerate(nums):
        add(value, state)
        while not valid(state):
            remove(nums[left], state)
            left += 1
        best = max(best, right - left + 1)
    return best
```

### How to explain it

I use Sliding Window because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Longest Substring Without Repeating Characters

Input: s = "abcabcbb"

Output: 3

Explanation: A set tracks characters currently inside the window.

```python
def solve_1(input_data):
    # Apply Sliding Window using the invariant above.
    return input_data
```

Time: O(n)

Space: O(k)

### Example 2: Maximum Average Subarray

Input: nums = [1,12,-5,-6,50,3], k = 4

Output: 12.75

Explanation: A fixed-size window updates the running sum in O(1).

```python
def solve_2(input_data):
    # Apply Sliding Window using the invariant above.
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

The pattern is powered by operations from Arrays & Hashing. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| Variable window | O(n) | O(k) | Each boundary moves forward only |
| Fixed window | O(n) | O(1) | Maintain rolling state |

## Practice Problems

### Easy

1. Maximum Average Subarray
2. Contains Duplicate II
3. Best Time to Buy and Sell Stock

### Medium

1. Longest Substring Without Repeating Characters
2. Minimum Size Subarray Sum
3. Permutation in String

### Hard

1. Minimum Window Substring
2. Sliding Window Maximum
3. Substring with Concatenation

## Key Takeaways

- Sliding Window is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Sliding Window
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

- [Arrays & Hashing - traversal and hash-table foundations](/data-structures/arrays-hashing/#arrays)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
