---
layout: default
title: "BFS"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Explore states level by level to find shortest unweighted paths or process by depth."
read_time: "12 min read"
difficulty: "Core"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/trees-graphs/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

BFS turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Trees and Graphs. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces BFS as the structure that removes it.

## Recognition Signals

### Shortest path in unweighted graph

When you see this signal, ask whether BFS can preserve an invariant that avoids repeated work.

### Minimum number of moves

When you see this signal, ask whether BFS can preserve an invariant that avoids repeated work.

### Level order traversal

When you see this signal, ask whether BFS can preserve an invariant that avoids repeated work.

### Spread or infection process

When you see this signal, ask whether BFS can preserve an invariant that avoids repeated work.

## Template

### Invariant

When a state is first dequeued, it has the minimum distance from the start.

### Python template

```python
from collections import deque

def bfs(start):
    q = deque([start])
    seen = {start}
    while q:
        node = q.popleft()
        for nxt in neighbors(node):
            if nxt not in seen:
                seen.add(nxt)
                q.append(nxt)
```

### How to explain it

I use BFS because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Binary Tree Level Order Traversal

Input: root = [3,9,20,null,null,15,7]

Output: [[3],[9,20],[15,7]]

Explanation: Queue size separates levels.

```python
def solve_1(input_data):
    # Apply BFS using the invariant above.
    return input_data
```

Time: O(V + E)

Space: O(V)

### Example 2: Rotting Oranges

Input: grid with rotten and fresh oranges

Output: minutes to rot all

Explanation: Multi-source BFS models simultaneous spread.

```python
def solve_2(input_data):
    # Apply BFS using the invariant above.
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

The pattern is powered by operations from Trees and Graphs. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| BFS graph | O(V + E) | O(V) | Visit each node and edge |
| BFS grid | O(R * C) | O(R * C) | Each cell enters queue once |

## Practice Problems

### Easy

1. Minimum Depth of Binary Tree
2. Flood Fill
3. Cousins in Binary Tree

### Medium

1. Rotting Oranges
2. Number of Islands
3. Shortest Path in Binary Matrix

### Hard

1. Word Ladder
2. Bus Routes
3. Shortest Path with Obstacles

## Key Takeaways

- BFS is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- BFS
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

- [Trees and Graphs - Number of Islands example](/data-structures/trees-graphs/#example-2-number-of-islands)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
