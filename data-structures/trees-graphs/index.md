---
layout: default
title: "Trees and Graphs"
page_type: deep-dive-post
subtitle: "Traversal and relationship modeling for interview problems."
read_time: "10 min read"
difficulty: Intermediate
post_tabs:
  - label: Trees
    href: "#trees"
  - label: Graphs
    href: "#graphs"
  - label: Traversal
    href: "#traversal"
toc:
  - label: "Trees"
    href: "#trees"
  - label: "Graphs"
    href: "#graphs"
  - label: "Traversal"
    href: "#traversal"
previous_topic:
  title: "Stacks, Queues, and Heaps"
  url: "/data-structures/stacks-queues-heaps/"
next_topic:
  title: "Selection and Complexity"
  url: "/data-structures/selection-complexity/"
---

## Topic: Trees

### Sub-topic: Common Tasks

Traversal, search, serialization, lowest common ancestor, validation, and balanced tree reasoning.

### Sub-topic: Tree Traversals

| Traversal | Use Case |
| --- | --- |
| Preorder | Copying or serializing root-first |
| Inorder | Sorted order in BST |
| Postorder | Deleting, aggregating children first |
| Level order | BFS by depth |

### Sub-topic: Tree Interview Invariant

For recursive tree problems, define what the function returns for a subtree. Example: "This function returns the height of the subtree, and returns -1 if the subtree is unbalanced."

## Topic: Graphs

### Sub-topic: Common Tasks

Reachability, connected components, dependency ordering, shortest paths, and cycle detection.

### Sub-topic: Graph Representation

| Representation | Best For |
| --- | --- |
| Adjacency list | Sparse graphs and traversal |
| Adjacency matrix | Dense graphs and O(1) edge checks |
| Edge list | Algorithms that process edges |

### Sub-topic: Visited State

Visited state prevents infinite loops and repeated work. For simple traversal, one visited set is enough. For path-dependent problems, the state may include node plus extra information such as distance, remaining budget, or previous direction.

## Topic: Traversal

### Sub-topic: Choice

Use DFS for depth and recursion-friendly exploration. Use BFS for shortest unweighted paths and level processing.

### Sub-topic: DFS Template

```python
def dfs(node):
    if node in visited:
        return
    visited.add(node)
    for nxt in graph[node]:
        dfs(nxt)
```

### Sub-topic: BFS Template

```python
from collections import deque

def bfs(start):
    q = deque([start])
    visited = {start}
    while q:
        node = q.popleft()
        for nxt in graph[node]:
            if nxt not in visited:
                visited.add(nxt)
                q.append(nxt)
```

### Sub-topic: Common Mistake

Mark nodes visited when enqueuing, not when dequeuing, to avoid adding the same node many times.
