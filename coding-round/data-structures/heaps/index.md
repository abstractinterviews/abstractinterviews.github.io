---
layout: default
title: "Heaps"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Priority-first access for top-k, scheduling, streaming medians, and best-first search."
read_time: "12 min read"
difficulty: "Core"
practice_count: 34
previous_topic:
  title: "Queues"
  url: "/coding-round/data-structures/queues/"
next_topic:
  title: "Trees"
  url: "/coding-round/data-structures/trees/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Priority-first access for top-k, scheduling, streaming medians, and best-first search.

### Why candidates need it

Heaps return the current highest-priority item without fully sorting every candidate.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

A heap is not sorted. Only the root is guaranteed to be the next priority item.

## Mental Model

### Root is the next decision

Name the invariant before coding.

### Push and pop rebalance along height

Tie the invariant to the operation cost.

### Bounded heaps save memory

Test the boundary where the invariant can break.

## Practice

### Example 1: Top K Frequent Elements

Count values, then keep the k largest counts in a heap.

Input: `nums = [1,1,1,2,2,3]`, `k = 2`

Output: `[1, 2]`

Explanation: The heap keeps only the best k candidates.

```python
from collections import Counter
import heapq

def top_k_frequent(nums, k):
    heap = []
    for value, count in Counter(nums).items():
        heapq.heappush(heap, (count, value))
        if len(heap) > k:
            heapq.heappop(heap)
    return [value for count, value in heap]
```

Time: O(n log k)

Space: O(n)

### Example 2: Kth Largest in Stream

Keep a min-heap of size k.

Input: `k = 3`, stream values

Output: `current kth largest`

Explanation: The heap root is the kth largest after smaller extras are discarded.

```python
import heapq

class KthLargest:
    def __init__(self, k, nums):
        self.k = k
        self.heap = nums
        heapq.heapify(self.heap)
        while len(self.heap) > k:
            heapq.heappop(self.heap)

    def add(self, val):
        heapq.heappush(self.heap, val)
        if len(self.heap) > self.k:
            heapq.heappop(self.heap)
        return self.heap[0]
```

Time: O(log k) per add

Space: O(k)

## Common Patterns

### Top K

Keep a bounded priority queue.

### Merge K Streams

Consume smallest current head.

### Two Heaps

Track lower and upper halves.

### Best-first Search

Expand most promising state.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Peek root | O(1) | Root stores priority |
| Push | O(log n) | Bubble up |
| Pop | O(log n) | Bubble down |
| Heapify | O(n) | Bottom-up build |
| Space | O(n) | Array-backed tree |

## Practice Problems

### Easy

- Kth Largest Stream
- Last Stone Weight
- Relative Ranks

### Medium

- Top K Frequent
- K Closest Points
- Task Scheduler

### Hard

- Median from Stream
- Merge K Lists
- IPO

## Key Takeaways

- Choose Heaps because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Heaps
- Priority-first access for top-k, scheduling, streaming medians, and best-first search.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Stacks, Queues, and Heaps](/data-structures/stacks-queues-heaps/#heap)
- [Top K example](/data-structures/stacks-queues-heaps/#example-2-top-k-frequent-elements)
- [Heap Pattern](/coding-round/patterns/heap/)
- [Selection and Complexity](/data-structures/selection-complexity/#priority-optimization)
