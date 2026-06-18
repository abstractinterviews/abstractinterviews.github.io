---
layout: default
title: "Stacks, Queues, and Heaps"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Ordered processing structures for nested state, breadth-first traversal, monotonic scans, and priority-driven selection."
read_time: "18 min read"
difficulty: "Core"
practice_count: 38
previous_topic:
  title: "Arrays and Hashing"
  url: "/data-structures/arrays-hashing/"
next_topic:
  title: "Trees and Graphs"
  url: "/data-structures/trees-graphs/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### Stack

Last-in, first-out storage for nested state, undo, recursion simulation, parsing, DFS, and monotonic problems.

### Queue

First-in, first-out storage for BFS, scheduling, level-order traversal, and producer-consumer style processing.

### Heap

Priority-based storage for repeatedly retrieving the smallest, largest, or highest-priority item.

### Deque

Double-ended queue for sliding windows, monotonic queues, and problems where both ends of the active range change.

## Stack

Stacks are useful when the most recent unresolved item should be handled first.

### Mental model

Think of stacked plates. You add to the top and remove from the top. This matches nested parentheses, function calls, and undo history.

### Interview signal

Use a stack when the prompt mentions matching pairs, nested scopes, previous greater/smaller element, DFS, or reversing recent decisions.

### Senior gotcha

Recursive DFS uses the call stack. On deep inputs, recursion can overflow even when the algorithm is correct. An explicit stack gives more control.

## Queue

Queues preserve arrival order. They are the default structure for breadth-first traversal and level-by-level processing.

### Mental model

Think of a line at a counter. The first item that enters should be processed first.

### Interview signal

Use a queue when the prompt asks for shortest path in an unweighted graph, level order traversal, or processing by distance from a start state.

### Senior gotcha

Mark graph nodes visited when enqueuing, not when dequeuing. Otherwise the same node can be enqueued many times.

## Heap

Heaps optimize repeated priority extraction. They do not fully sort data; they only guarantee access to the current best item.

### Mental model

Think of a tournament bracket where the current best candidate is always at the top.

### Interview signal

Use a heap for top-k, merge k sorted lists, meeting rooms, scheduling, streaming median, and Dijkstra-style expansion.

### Senior gotcha

Heaps do not support efficient arbitrary deletion. Use lazy deletion or a companion map when removals become stale.

## Practice

### Example 1: Valid Parentheses

Given a string of brackets, return whether every opening bracket is closed in the correct order.

Input: `s = "([])"`

Output: `true`

Explanation: the most recent opening bracket must match the next closing bracket.

```python
def isValid(s):
    pairs = {")": "(", "]": "[", "}": "{"}
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

### Example 2: Top K Frequent Elements

Given an array, return the `k` most frequent values.

Input: `nums = [1, 1, 1, 2, 2, 3]`, `k = 2`

Output: `[1, 2]`

Explanation: a heap keeps only the best `k` frequency candidates.

```python
from collections import Counter
import heapq

def topKFrequent(nums, k):
    count = Counter(nums)
    heap = []
    for num, freq in count.items():
        heapq.heappush(heap, (freq, num))
        if len(heap) > k:
            heapq.heappop(heap)
    return [num for freq, num in heap]
```

Time: O(n log k)

Space: O(n)

## Common Patterns

### Matching Stack

Track open brackets, tags, or nested scopes.

Example: Valid Parentheses

### Monotonic Stack

Maintain increasing or decreasing order and resolve elements when the order breaks.

Example: Next Greater Element

### BFS Queue

Process states in layers so the first time you reach a state is the shortest path.

Example: Rotting Oranges

### Top K Heap

Keep only the best `k` candidates instead of sorting every item.

Example: K Closest Points

## Complexity

| Structure | Push / Add | Pop / Remove | Peek | Search |
| --- | --- | --- | --- | --- |
| Stack | O(1) | O(1) | O(1) | O(n) |
| Queue | O(1) | O(1) | O(1) | O(n) |
| Deque | O(1) both ends | O(1) both ends | O(1) | O(n) |
| Heap | O(log n) | O(log n) | O(1) | O(n) |

## Practice Problems

### Easy

1. Valid Parentheses
2. Implement Queue using Stacks
3. Min Stack

### Medium

1. Daily Temperatures
2. Top K Frequent Elements
3. Kth Largest Element

### Hard

1. Sliding Window Maximum
2. Find Median from Data Stream
3. Merge K Sorted Lists

## Key Takeaways

- Stacks solve recent-unresolved-state problems.
- Queues solve level-order and shortest-unweighted-path problems.
- Heaps solve repeated priority selection without sorting everything.
- Deques are ideal when both ends of a window matter.

## Quick Summary

### Stack

- LIFO order
- Best for nesting and backtracking
- Common in parsing and DFS

### Queue

- FIFO order
- Best for BFS and levels
- Mark visited when enqueuing

### Heap

- Priority access
- Best for top-k and scheduling
- Arbitrary deletion is not cheap

## Related Topics

- Arrays & Hashing: /data-structures/arrays-hashing/
- Trees and Graphs: /data-structures/trees-graphs/
- Sliding Window: /coding-round/patterns/sliding-window/
- Time & Space Complexity: /data-structures/selection-complexity/
