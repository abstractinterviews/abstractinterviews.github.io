---
layout: default
title: "Graphs"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Nodes and edges for dependencies, connectivity, shortest paths, and reachability."
read_time: "12 min read"
difficulty: "Intermediate"
practice_count: 40
previous_topic:
  title: "Binary Search Trees"
  url: "/coding-round/data-structures/bst/"
next_topic:
  title: "Trie"
  url: "/coding-round/data-structures/trie/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Nodes and edges for dependencies, connectivity, shortest paths, and reachability.

### Why candidates need it

Graphs model relationships: networks, prerequisites, grids, ownership, routes, and dependencies.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Without a visited set, cyclic graph traversal can loop forever or repeat exponential work.

## Mental Model

### Choose representation first

Name the invariant before coding.

### Traversal answers reachability

Tie the invariant to the operation cost.

### Edges carry semantics

Test the boundary where the invariant can break.

## Practice

### Example 1: Number of Islands

Treat the grid as an implicit graph.

Input: `grid` of `1`s and `0`s

Output: `island count`

Explanation: Each unvisited land cell starts one connected component search.

```python
def num_islands(grid):
    rows, cols = len(grid), len(grid[0])
    def dfs(r, c):
        if r < 0 or c < 0 or r == rows or c == cols or grid[r][c] != "1": return
        grid[r][c] = "0"
        for dr, dc in ((1,0),(-1,0),(0,1),(0,-1)):
            dfs(r + dr, c + dc)
    count = 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1":
                count += 1; dfs(r, c)
    return count
```

Time: O(mn)

Space: O(mn)

### Example 2: Course Schedule

Detect whether a dependency graph has a cycle.

Input: `numCourses`, `prerequisites`

Output: `true` or `false`

Explanation: A topological order exists only if the graph is acyclic.

```python
from collections import defaultdict

def can_finish(n, prerequisites):
    graph = defaultdict(list); state = [0] * n
    for course, pre in prerequisites:
        graph[pre].append(course)
    def dfs(node):
        if state[node] == 1: return False
        if state[node] == 2: return True
        state[node] = 1
        for nei in graph[node]:
            if not dfs(nei): return False
        state[node] = 2
        return True
    return all(dfs(i) for i in range(n))
```

Time: O(V + E)

Space: O(V + E)

## Common Patterns

### Connected Components

Count independent reachable regions.

### BFS Shortest Path

Unweighted minimum steps.

### DFS Cycle Detection

Track visiting states.

### Topological Sort

Order DAG dependencies.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| DFS/BFS list | O(V + E) | Visit vertices and edges |
| Matrix scan | O(V^2) | Check possible edges |
| Adjacency list space | O(V + E) | Sparse-friendly |
| Matrix space | O(V^2) | Fast edge lookup |
| Unweighted shortest | O(V + E) | BFS |

## Practice Problems

### Easy

- Path Exists
- Flood Fill
- Island Perimeter

### Medium

- Number of Islands
- Clone Graph
- Course Schedule

### Hard

- Word Ladder
- Network Delay
- Alien Dictionary

## Key Takeaways

- Choose Graphs because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Graphs
- Nodes and edges for dependencies, connectivity, shortest paths, and reachability.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Trees and Graphs](/data-structures/trees-graphs/#graphs)
- [BFS](/coding-round/patterns/bfs/)
- [DFS](/coding-round/patterns/dfs/)
- [Topological Sort](/coding-round/patterns/topological-sort/)
