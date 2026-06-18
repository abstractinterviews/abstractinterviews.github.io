---
layout: default
title: "Two Pointers"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Use two indices to scan ordered data without nested loops."
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

Two Pointers turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Arrays & Hashing. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Two Pointers as the structure that removes it.

## Recognition Signals

### Sorted array or string

When you see this signal, ask whether Two Pointers can preserve an invariant that avoids repeated work.

### Pair, triplet, palindrome, or partition question

When you see this signal, ask whether Two Pointers can preserve an invariant that avoids repeated work.

### Brute force compares many pairs

When you see this signal, ask whether Two Pointers can preserve an invariant that avoids repeated work.

### Answer depends on moving inward or outward

When you see this signal, ask whether Two Pointers can preserve an invariant that avoids repeated work.

## Template

### Invariant

The pointers bound the only region where a valid answer can still exist.

### Python template

```python
def two_pointer(nums):
    left, right = 0, len(nums) - 1
    while left < right:
        total = nums[left] + nums[right]
        if total == target:
            return [left, right]
        if total < target:
            left += 1
        else:
            right -= 1
    return []
```

### How to explain it

I use Two Pointers because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Two Sum II

Input: numbers = [2, 7, 11, 15], target = 9

Output: [1, 2]

Explanation: Sorted order tells us which pointer to move.

```python
def solve_1(input_data):
    # Apply Two Pointers using the invariant above.
    return input_data
```

Time: O(n)

Space: O(1)

### Example 2: Valid Palindrome

Input: s = "racecar"

Output: true

Explanation: Compare symmetric characters and move inward.

```python
def solve_2(input_data):
    # Apply Two Pointers using the invariant above.
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
| Scan | O(n) | O(1) | Each pointer moves at most n times |
| Sort then scan | O(n log n) | O(1) or O(n) | Sorting dominates |

## Practice Problems

### Easy

1. Valid Palindrome
2. Merge Sorted Array
3. Two Sum II

### Medium

1. 3Sum
2. Container With Most Water
3. Sort Colors

### Hard

1. Trapping Rain Water
2. Minimum Window Subsequence
3. Count Pairs in Range

## Key Takeaways

- Two Pointers is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Two Pointers
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

- [Arrays & Hashing - Two Sum example](/data-structures/arrays-hashing/#example-1-two-sum)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
