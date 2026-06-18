---
layout: default
title: "Binary Search Trees"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Ordered binary trees for search, range queries, predecessor/successor, and sorted traversal."
read_time: "12 min read"
difficulty: "Core"
practice_count: 24
previous_topic:
  title: "Trees"
  url: "/coding-round/data-structures/trees/"
next_topic:
  title: "Graphs"
  url: "/coding-round/data-structures/graphs/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Ordered binary trees for search, range queries, predecessor/successor, and sorted traversal.

### Why candidates need it

The ordering invariant lets you discard a branch at each step when the tree is balanced.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

BST operations are O(h), not automatically O(log n). A skewed BST behaves like a linked list.

## Mental Model

### Ordering is the invariant

Name the invariant before coding.

### Inorder traversal is sorted

Tie the invariant to the operation cost.

### Balance determines performance

Test the boundary where the invariant can break.

## Practice

### Example 1: Validate BST

Carry lower and upper bounds down the tree.

Input: `root`

Output: `true` or `false`

Explanation: Each node must fit the range imposed by ancestors.

```python
def is_valid_bst(root):
    def dfs(node, low, high):
        if not node: return True
        if not (low < node.val < high): return False
        return dfs(node.left, low, node.val) and dfs(node.right, node.val, high)
    return dfs(root, float("-inf"), float("inf"))
```

Time: O(n)

Space: O(h)

### Example 2: Kth Smallest

Use inorder traversal and stop at k.

Input: `root`, `k = 3`

Output: `kth value`

Explanation: Inorder traversal visits BST values sorted.

```python
def kth_smallest(root, k):
    stack, node = [], root
    while stack or node:
        while node:
            stack.append(node); node = node.left
        node = stack.pop(); k -= 1
        if k == 0: return node.val
        node = node.right
```

Time: O(h + k)

Space: O(h)

## Common Patterns

### Bounds Validation

Pass min/max constraints.

### Inorder Traversal

Exploit sorted order.

### Search Path

Move left or right by comparison.

### Range Query

Prune subtrees outside range.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Search balanced | O(log n) | Height logarithmic |
| Search skewed | O(n) | Height n |
| Insert/delete | O(h) | Depends on balance |
| Inorder | O(n) | Visit all |
| Space | O(h) | Stack or recursion |

## Practice Problems

### Easy

- Search BST
- Range Sum BST
- Min Difference

### Medium

- Validate BST
- Kth Smallest
- LCA of BST

### Hard

- Recover BST
- Count Smaller
- Serialize BST

## Key Takeaways

- Choose Binary Search Trees because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Binary Search Trees
- Ordered binary trees for search, range queries, predecessor/successor, and sorted traversal.

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
- [Binary Search](/coding-round/patterns/binary-search/)
- [Trees](/coding-round/data-structures/trees/)
- [Selection and Complexity](/data-structures/selection-complexity/)
