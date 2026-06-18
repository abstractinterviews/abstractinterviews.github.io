---
layout: default
title: "Trees and Graphs"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Traversal and relationship modeling for hierarchies, dependencies, reachability, and shortest paths."
read_time: "22 min read"
difficulty: "Intermediate"
practice_count: 52
previous_topic:
  title: "Stacks, Queues, and Heaps"
  url: "/data-structures/stacks-queues-heaps/"
next_topic:
  title: "Selection and Complexity"
  url: "/data-structures/selection-complexity/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### Tree

A connected acyclic structure with parent-child relationships. Common examples include binary trees, BSTs, tries, and heaps.

### Graph

A set of nodes connected by edges. Graphs model relationships, dependencies, networks, and state transitions.

### DFS

Depth-first search explores one path deeply before backtracking. It is natural for recursion and connected component discovery.

### BFS

Breadth-first search explores by distance from the start node. It is the default for shortest paths in unweighted graphs.

## Trees

Trees are best when the input has hierarchy or recursive substructure.

### Mental model

Every subtree is a smaller version of the same problem. A strong recursive answer defines exactly what each call returns.

### Interview signal

Use tree reasoning when the prompt mentions root, parent, child, ancestor, descendant, depth, height, subtree, or balanced.

### Senior gotcha

For recursive tree problems, define the return value before coding. Example: "This function returns subtree height, or -1 if unbalanced."

## Graphs

Graphs are best when relationships matter more than linear order.

### Mental model

Nodes are states; edges are allowed transitions. Most graph problems ask what can be reached, in what order, or at what cost.

### Interview signal

Use graph reasoning when the prompt mentions dependencies, connectivity, shortest path, cycles, islands, prerequisites, or transformations.

### Senior gotcha

Visited state may need more than the node. In path-dependent problems, state can include distance, remaining budget, key set, direction, or time.

## Traversal

Traversal is the engine behind most tree and graph problems.

### DFS choice

Use DFS for connected components, cycle detection, backtracking, topological exploration, and subtree aggregation.

### BFS choice

Use BFS for shortest path in unweighted graphs, level order traversal, and minimum number of transitions.

### Representation choice

Adjacency lists fit sparse graphs and traversal. Matrices fit dense graphs and O(1) edge checks. Edge lists fit algorithms that process all edges.

## Practice

### Example 1: Binary Tree Max Depth

Given a binary tree, return its maximum depth.

Input: `root = [3, 9, 20, null, null, 15, 7]`

Output: `3`

Explanation: the deepest root-to-leaf path has 3 nodes.

```python
def maxDepth(root):
    if not root:
        return 0
    return 1 + max(maxDepth(root.left), maxDepth(root.right))
```

Time: O(n)

Space: O(h)

### Example 2: Number of Islands

Given a grid of land and water, count connected land components.

Input: `grid = [["1","1","0"],["0","1","0"],["1","0","1"]]`

Output: `3`

Explanation: each DFS/BFS flood fill marks one island.

```python
def numIslands(grid):
    if not grid:
        return 0

    rows, cols = len(grid), len(grid[0])

    def dfs(r, c):
        if r < 0 or c < 0 or r == rows or c == cols or grid[r][c] != "1":
            return
        grid[r][c] = "0"
        dfs(r + 1, c)
        dfs(r - 1, c)
        dfs(r, c + 1)
        dfs(r, c - 1)

    count = 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1":
                count += 1
                dfs(r, c)
    return count
```

Time: O(R * C)

Space: O(R * C)

## Common Patterns

### Recursive Subtree Return

Return information from children to parent.

Example: Balanced Binary Tree

### BFS Levels

Process nodes by distance or depth.

Example: Binary Tree Level Order Traversal

### Connected Components

Start traversal from every unvisited node and count groups.

Example: Number of Islands

### Topological Sort

Order nodes so dependencies come before dependents.

Example: Course Schedule

## Complexity

| Operation / Algorithm | Time | Space | Notes |
| --- | --- | --- | --- |
| Tree DFS | O(n) | O(h) | `h` is tree height |
| Graph DFS/BFS | O(V + E) | O(V) | Visit each node and edge |
| Adjacency List Edge Check | O(degree) | O(V + E) | Good for sparse graphs |
| Adjacency Matrix Edge Check | O(1) | O(V^2) | Good for dense graphs |
| Topological Sort | O(V + E) | O(V) | Requires directed graph |

## Practice Problems

### Easy

1. Maximum Depth of Binary Tree
2. Invert Binary Tree
3. Same Tree

### Medium

1. Number of Islands
2. Course Schedule
3. Lowest Common Ancestor

### Hard

1. Word Ladder
2. Serialize and Deserialize Binary Tree
3. Alien Dictionary

## Key Takeaways

- Trees are recursive hierarchy problems.
- Graphs are relationship and reachability problems.
- DFS explores depth; BFS explores distance.
- The visited state must match the real problem state.

## Quick Summary

### Trees

- Hierarchical
- Often recursive
- Define subtree return values

### Graphs

- Nodes and edges
- Use adjacency representation
- Always reason about visited state

### Traversal

- DFS for depth and components
- BFS for shortest unweighted paths
- Topological sort for dependencies

## Related Topics

- Stacks, Queues, and Heaps: /data-structures/stacks-queues-heaps/
- Selection and Complexity: /data-structures/selection-complexity/
- Backtracking: /coding-round/patterns/backtracking/
- Dynamic Programming: /coding-round/patterns/dynamic-programming/
