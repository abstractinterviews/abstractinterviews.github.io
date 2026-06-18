---
layout: default
title: "Heap"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Use priority order when the next best item is needed repeatedly."
read_time: "12 min read"
difficulty: "Core"
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

Heap turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Stacks, Queues, and Heaps. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Heap as the structure that removes it.

## Recognition Signals

### Top k, kth largest, or closest k

When you see this signal, ask whether Heap can preserve an invariant that avoids repeated work.

### Repeated min or max extraction

When you see this signal, ask whether Heap can preserve an invariant that avoids repeated work.

### Streaming priority

When you see this signal, ask whether Heap can preserve an invariant that avoids repeated work.

### Merging sorted streams

When you see this signal, ask whether Heap can preserve an invariant that avoids repeated work.

## Template

### Invariant

The heap root is always the current best candidate under the chosen priority.

### Python template

```python
import heapq

def top_k(items, k):
    heap = []
    for item in items:
        heapq.heappush(heap, score(item))
        if len(heap) > k:
            heapq.heappop(heap)
    return heap
```

### How to explain it

I use Heap because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Top K Frequent Elements

Input: nums = [1,1,1,2,2,3], k = 2

Output: [1, 2]

Explanation: A heap keeps only the best k candidates.

```python
def solve_1(input_data):
    # Apply Heap using the invariant above.
    return input_data
```

Time: O(n log k)

Space: O(k)

### Example 2: Merge K Sorted Lists

Input: k sorted linked lists

Output: one sorted list

Explanation: Always pull the smallest current head.

```python
def solve_2(input_data):
    # Apply Heap using the invariant above.
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
| Size-k heap | O(n log k) | O(k) | Best when k is small |
| Full heap | O(n log n) | O(n) | Use when all priorities matter |

## Practice Problems

### Easy

1. Last Stone Weight
2. Kth Largest Element in a Stream
3. Relative Ranks

### Medium

1. Top K Frequent Elements
2. K Closest Points
3. Task Scheduler

### Hard

1. Merge K Sorted Lists
2. Find Median from Data Stream
3. Sliding Window Median

## Key Takeaways

- Heap is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Heap
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

- [Stacks, Queues, and Heaps - Top K example](/data-structures/stacks-queues-heaps/#example-2-top-k-frequent-elements)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
