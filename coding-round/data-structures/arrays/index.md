---
layout: default
title: "Arrays"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Index-based storage for ordered data, prefix scans, in-place updates, and cache-friendly iteration."
read_time: "12 min read"
difficulty: "Beginner Friendly"
practice_count: 36
previous_topic:
  title: "Data Structures"
  url: "/coding-round/data-structures/"
next_topic:
  title: "Hash Tables"
  url: "/coding-round/data-structures/hash-tables/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Index-based storage for ordered data, prefix scans, in-place updates, and cache-friendly iteration.

### Why candidates need it

Arrays give O(1) access by position and preserve order, which makes scans, windows, prefixes, and in-place updates cheap.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Middle insert/delete shifts elements. Repeating that inside a loop can turn a clean solution into O(n^2).

## Mental Model

### Index is the address shortcut

Name the invariant before coding.

### Order is part of the data

Tie the invariant to the operation cost.

### In-place writes change future reads

Test the boundary where the invariant can break.

## Practice

### Example 1: Two Sum with Hash Map

Use the array for traversal and a hash map for previously seen values.

Input: `nums = [2, 7, 11, 15]`, `target = 9`

Output: `[0, 1]`

Explanation: Each index is visited once; the map removes repeated search.

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

Time: O(n)

Space: O(n)

### Example 2: Move Zeroes

Keep a write pointer for the next non-zero slot.

Input: `nums = [0, 1, 0, 3, 12]`

Output: `[1, 3, 12, 0, 0]`

Explanation: Everything before `write` is non-zero and in original order.

```python
def move_zeroes(nums):
    write = 0
    for read, value in enumerate(nums):
        if value != 0:
            nums[write], nums[read] = nums[read], nums[write]
            write += 1
    return nums
```

Time: O(n)

Space: O(1)

## Common Patterns

### Two Pointers

Scan from both ends when order gives a safe move.

### Sliding Window

Maintain a valid contiguous range.

### Prefix Sum

Precompute cumulative state for range queries.

### In-place Partition

Use write/read pointers to rearrange without extra arrays.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Access | O(1) | Direct index lookup |
| Search unsorted | O(n) | Inspect candidates |
| Append dynamic | O(1) amortized | Occasional resize copies |
| Insert middle | O(n) | Elements shift |
| Space | O(n) | Stores n elements |

## Practice Problems

### Easy

- Contains Duplicate
- Move Zeroes
- Merge Sorted Array

### Medium

- Product of Array Except Self
- 3Sum
- Rotate Array

### Hard

- First Missing Positive
- Trapping Rain Water
- Median of Two Sorted Arrays

## Key Takeaways

- Choose Arrays because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Arrays
- Index-based storage for ordered data, prefix scans, in-place updates, and cache-friendly iteration.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Arrays & Hashing](/data-structures/arrays-hashing/#arrays)
- [Two Pointers](/coding-round/patterns/two-pointers/)
- [Sliding Window](/coding-round/patterns/sliding-window/)
- [Prefix Sum](/coding-round/patterns/prefix-sum/)
