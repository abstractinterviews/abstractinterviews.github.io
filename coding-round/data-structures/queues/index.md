---
layout: default
title: "Queue"
kind: topic
renderer: app
track: data-structures
description: "A linear data structure that follows first in, first out order for traversal, buffering, and level-by-level processing."
hero:
  visual: queue
tags: [linear-data-structure, fifo, beginner-friendly]
read_time: "12 min read"
difficulty: "Core"
practice_count: 26
previous_topic:
  title: "Stacks"
  url: "/coding-round/data-structures/stacks/"
next_topic:
  title: "Heaps"
  url: "/coding-round/data-structures/heaps/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

First-in-first-out state for breadth-first traversal, buffering, and level-by-level processing.

### Why candidates need it

Queues preserve arrival order, which makes them natural for BFS levels, fairness, buffering, and shortest paths in unweighted graphs.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

In Python, list `pop(0)` is O(n). Use `collections.deque` for O(1) front removal.

## Mental Model

### Queue stores the frontier

Name the invariant before coding.

### Level boundaries encode distance

Tie the invariant to the operation cost.

### Backpressure is part of real queue design

Test the boundary where the invariant can break.

## Practice

### Example 1: Binary Tree Level Order

Use a queue to process nodes level by level.

Input: `root = [3,9,20,null,null,15,7]`

Output: `[[3], [9,20], [15,7]]`

Explanation: Each loop consumes exactly the current level size.

```python
from collections import deque

def level_order(root):
    if not root: return []
    q, ans = deque([root]), []
    while q:
        level = []
        for _ in range(len(q)):
            node = q.popleft()
            level.append(node.val)
            if node.left: q.append(node.left)
            if node.right: q.append(node.right)
        ans.append(level)
    return ans
```

Time: O(n)

Space: O(w)

### Example 2: Rotting Oranges

Multi-source BFS from all rotten oranges.

Input: `grid`

Output: `minutes`

Explanation: The queue frontier represents oranges that rot neighbors this minute.

```python
from collections import deque

def oranges_rotting(grid):
    q, fresh = deque(), 0
    for r, row in enumerate(grid):
        for c, value in enumerate(row):
            if value == 2: q.append((r, c))
            if value == 1: fresh += 1
    minutes = 0
    while q and fresh:
        for _ in range(len(q)):
            r, c = q.popleft()
            for dr, dc in ((1,0),(-1,0),(0,1),(0,-1)):
                nr, nc = r + dr, c + dc
                if 0 <= nr < len(grid) and 0 <= nc < len(grid[0]) and grid[nr][nc] == 1:
                    grid[nr][nc] = 2; fresh -= 1; q.append((nr, nc))
        minutes += 1
    return minutes if fresh == 0 else -1
```

Time: O(mn)

Space: O(mn)

## Common Patterns

### BFS Queue

Process nearest states first.

### Level Order

Preserve depth.

### Monotonic Queue

Keep best candidate in a window.

### Work Queue

Buffer tasks in arrival order.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Enqueue | O(1) | Append back |
| Dequeue | O(1) | With deque |
| Peek | O(1) | Read front |
| Search | O(n) | No direct lookup |
| Space | O(n) | Worst frontier |

## Practice Problems

### Easy

- Recent Calls
- Moving Average
- Level Order

### Medium

- Rotting Oranges
- Walls and Gates
- Course Schedule

### Hard

- Sliding Window Maximum
- Shortest Path in Grid
- Word Ladder

## Key Takeaways

- Choose Queues because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Queues
- First-in-first-out state for breadth-first traversal, buffering, and level-by-level processing.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Stacks, Queues, and Heaps](/data-structures/stacks-queues-heaps/#queue)
- [BFS](/coding-round/patterns/bfs/)
- [Trees and Graphs](/data-structures/trees-graphs/#bfs)
- [Stacks](/coding-round/data-structures/stacks/)
