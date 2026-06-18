---
layout: default
title: "Disjoint Set"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Union-find structure for connectivity, components, cycles, and grouping."
read_time: "12 min read"
difficulty: "Intermediate"
practice_count: 22
previous_topic:
  title: "Fenwick Trees"
  url: "/coding-round/data-structures/fenwick-trees/"
next_topic:
  title: "Data Structures"
  url: "/coding-round/data-structures/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Union-find structure for connectivity, components, cycles, and grouping.

### Why candidates need it

Union-find answers dynamic connectivity without repeatedly traversing the whole graph.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Union-find answers whether nodes are connected, not the actual path between them.

## Mental Model

### Representative names the component

Name the invariant before coding.

### Union merges components

Tie the invariant to the operation cost.

### Compression flattens future work

Test the boundary where the invariant can break.

## Practice

### Example 1: Connected Components

Union every edge and count distinct components.

Input: `n`, `edges`

Output: `component count`

Explanation: Each successful union reduces the count by one.

```python
class DSU:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]
    def union(self, a, b):
        ra, rb = self.find(a), self.find(b)
        if ra == rb: return False
        if self.rank[ra] < self.rank[rb]: ra, rb = rb, ra
        self.parent[rb] = ra
        if self.rank[ra] == self.rank[rb]: self.rank[ra] += 1
        return True
```

Time: O((V + E) alpha(V))

Space: O(V)

### Example 2: Redundant Connection

Find the first edge connecting an existing component.

Input: `edges`

Output: `redundant edge`

Explanation: If union fails, the endpoints were already connected.

```python
def find_redundant_connection(edges):
    dsu = DSU(len(edges) + 1)
    for a, b in edges:
        if not dsu.union(a, b):
            return [a, b]
```

Time: O(E alpha(V))

Space: O(V)

## Common Patterns

### Connectivity Query

Compare roots.

### Cycle Detection

Union failure reveals cycle.

### Component Counting

Decrease on successful union.

### Kruskal MST

Add cheapest connecting edges.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Find | Amortized O(alpha(n)) | Path compression |
| Union | Amortized O(alpha(n)) | Rank/size |
| Initialize | O(n) | Parent array |
| All edges | O(E alpha(V)) | Process unions |
| Space | O(n) | Parent and rank |

## Practice Problems

### Easy

- Path Exists
- Provinces
- Graph Valid Tree

### Medium

- Redundant Connection
- Accounts Merge
- Connected Components

### Hard

- Kruskal MST
- Large Island
- Similar String Groups

## Key Takeaways

- Choose Disjoint Set because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Disjoint Set
- Union-find structure for connectivity, components, cycles, and grouping.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Trees and Graphs](/data-structures/trees-graphs/#connected-components)
- [Union Find Pattern](/coding-round/patterns/union-find/)
- [Graphs](/coding-round/data-structures/graphs/)
- [DFS](/coding-round/patterns/dfs/)
