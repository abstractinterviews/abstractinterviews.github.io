---
layout: default
title: "Trees"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Hierarchical data for recursion, subtree aggregation, search boundaries, and parent-child reasoning."
read_time: "12 min read"
difficulty: "Core"
practice_count: 32
previous_topic:
  title: "Heaps"
  url: "/coding-round/data-structures/heaps/"
next_topic:
  title: "Binary Search Trees"
  url: "/coding-round/data-structures/bst/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Hierarchical data for recursion, subtree aggregation, search boundaries, and parent-child reasoning.

### Why candidates need it

Tree problems test recursive reasoning: what information should each subtree return to its parent?

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Recursive DFS can overflow on deep trees. Know when to switch to an explicit stack.

## Mental Model

### Each subtree is a subproblem

Name the invariant before coding.

### Traversal order changes meaning

Tie the invariant to the operation cost.

### Height controls runtime and stack space

Test the boundary where the invariant can break.

## Practice

### Example 1: Maximum Depth

Return one plus the deeper child depth.

Input: `root = [3,9,20,null,null,15,7]`

Output: `3`

Explanation: Each subtree reports its height to the parent.

```python
def max_depth(root):
    if not root:
        return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))
```

Time: O(n)

Space: O(h)

### Example 2: Same Tree

Compare structure and values recursively.

Input: `p`, `q`

Output: `true` or `false`

Explanation: Both nodes must exist together, match values, and have equal subtrees.

```python
def is_same_tree(p, q):
    if not p or not q:
        return p is q
    return p.val == q.val and is_same_tree(p.left, q.left) and is_same_tree(p.right, q.right)
```

Time: O(n)

Space: O(h)

## Common Patterns

### Subtree Return

Return height, sum, validity, or best path.

### DFS Traversal

Walk recursively or with stack.

### BFS Levels

Use queue by depth.

### Path Tracking

Carry root-to-leaf state.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Traverse | O(n) | Visit nodes |
| Balanced search | O(log n) | Height logarithmic |
| Skewed search | O(n) | Height n |
| Recursive space | O(h) | Call stack |
| Store traversal | O(n) | Output or queue |

## Practice Problems

### Easy

- Maximum Depth
- Invert Tree
- Same Tree

### Medium

- LCA
- Level Order
- Diameter

### Hard

- Maximum Path Sum
- Serialize Tree
- Recover BST

## Key Takeaways

- Choose Trees because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Trees
- Hierarchical data for recursion, subtree aggregation, search boundaries, and parent-child reasoning.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Trees and Graphs](/data-structures/trees-graphs/#trees)
- [DFS](/coding-round/patterns/dfs/)
- [BFS](/coding-round/patterns/bfs/)
- [BST](/coding-round/data-structures/bst/)
