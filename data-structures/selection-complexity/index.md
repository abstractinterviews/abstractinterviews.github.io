---
layout: default
title: "Selection and Complexity"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "How to choose data structures and explain time-space complexity clearly during interviews."
read_time: "14 min read"
difficulty: "Core"
practice_count: 24
previous_topic:
  title: "Trees and Graphs"
  url: "/data-structures/trees-graphs/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### Operation Mix

Start from the operations the prompt needs most often: lookup, insert, delete, ordering, traversal, or priority.

### Constraints

Input size, value range, duplicates, sortedness, mutability, and memory limits can change the right structure.

### Complexity

Complexity explains how cost grows as input grows. Use time and space together; one often trades for the other.

### Invariant

The invariant is the rule that keeps the structure useful, such as stack order, heap priority, or visited state.

## Selection

Choosing well means matching the dominant operation to the cheapest structure that preserves correctness.

### Mental model

Do not ask "which structure do I know?" Ask "which operation must be cheap?"

### Interview signal

If the brute force repeats lookup, add a map or set. If it repeatedly needs min/max, add a heap. If order matters, preserve sequence or sorted boundaries.

### Senior gotcha

The fastest-looking Big-O is not always best. Hash maps add memory overhead; sorting may be simpler and more predictable; recursion may fail on deep input.

## Complexity

Complexity should be explained while introducing the structure, not only after the code.

### Time language

Use `n`, `k`, `V`, `E`, and `m` precisely. If a solution sorts and scans, say O(n log n) plus O(n).

### Space language

State auxiliary memory separately from input storage. A hash map, visited set, heap, recursion stack, or copied array all count.

### Worst-case language

Mention worst-case behavior when the structure has one: hash collisions, unbalanced trees, recursion depth, or heap lazy deletion growth.

## Tradeoffs

Every data-structure choice buys one thing by paying another.

### Hash map vs sorting

Hash maps usually improve lookup speed with O(n) space. Sorting may use less extra memory and gives ordered scanning.

### Heap vs full sort

A heap of size `k` is better when `k` is small. Full sorting is simpler when you need all items ordered.

### DFS vs BFS

DFS uses depth-first memory and is easy recursively. BFS finds shortest unweighted paths but can hold a wide frontier.

## Practice

### Example 1: Choosing for Two Sum

Given an array and target, choose between brute force, sorting, and hashing.

Input: `nums = [2, 7, 11, 15]`, `target = 9`

Output: use a hash map for O(n) time and O(n) space.

Explanation: the dominant operation is "have I seen the complement?"

```python
def choose_two_sum(nums):
    if len(nums) < 100:
        return "brute force is acceptable but hash map is still clean"
    return "hash map: O(n) time, O(n) space"
```

Time: O(n)

Space: O(n)

### Example 2: Choosing for Top K

Given many items and small `k`, choose a heap instead of sorting all items.

Input: `n = 1_000_000`, `k = 10`

Output: use a size-k heap.

Explanation: O(n log k) is better than O(n log n) when `k` is tiny.

```python
def choose_top_k(n, k):
    if k << n:
        return "heap"
    return "sort"
```

Time: O(1)

Space: O(1)

## Common Patterns

### Lookup Optimization

Replace repeated scans with a set or map.

Example: Contains Duplicate

### Ordering Optimization

Sort once, then scan with pointers.

Example: 3Sum

### Priority Optimization

Use a heap when the next best item is repeatedly needed.

Example: K Closest Points

### Traversal Optimization

Use DFS/BFS when the problem is about reachability or state transitions.

Example: Number of Islands

## Complexity Summary

| Need | Common Structure | Typical Cost | Main Tradeoff |
| --- | --- | --- | --- |
| Lookup by key | Hash map / set | O(1) average | O(n) space |
| Ordered scan | Sorted array | O(n log n) setup | Mutates or copies data |
| Top k | Heap | O(n log k) | More implementation detail |
| Shortest unweighted path | BFS queue | O(V + E) | Frontier memory |
| Nested state | Stack | O(n) worst memory | Must maintain order invariant |

## Practice Problems

### Easy

1. Contains Duplicate
2. Valid Anagram
3. Binary Search

### Medium

1. 3Sum
2. Top K Frequent Elements
3. Course Schedule

### Hard

1. Merge K Sorted Lists
2. Sliding Window Maximum
3. Word Ladder

## Key Takeaways

- Start from operations, not from favorite structures.
- Explain time and space as soon as you introduce the structure.
- Name worst cases when averages hide risk.
- Compare with at least one simpler alternative.

## Quick Summary

### Selection Rule

- Identify the dominant operation
- Pick the cheapest structure that preserves correctness
- Explain the invariant

### Complexity Rule

- Time is growth in work
- Space is growth in extra memory
- Worst case matters when inputs are adversarial

### Interview Rule

- State the tradeoff
- Mention the simpler alternative
- Close with assumptions

## Related Topics

- Arrays & Hashing: /data-structures/arrays-hashing/
- Stacks, Queues, and Heaps: /data-structures/stacks-queues-heaps/
- Trees and Graphs: /data-structures/trees-graphs/
- Coding Patterns: /coding-round/
