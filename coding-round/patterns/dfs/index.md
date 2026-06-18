---
layout: default
title: "DFS"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Explore deeply, backtrack, and aggregate results across recursive structure."
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

DFS turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Trees and Graphs. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces DFS as the structure that removes it.

## Recognition Signals

### Connected components

When you see this signal, ask whether DFS can preserve an invariant that avoids repeated work.

### Path existence

When you see this signal, ask whether DFS can preserve an invariant that avoids repeated work.

### Subtree aggregation

When you see this signal, ask whether DFS can preserve an invariant that avoids repeated work.

### Backtracking through choices

When you see this signal, ask whether DFS can preserve an invariant that avoids repeated work.

## Template

### Invariant

Each call owns one state and fully explores its descendants before returning.

### Python template

```python
def dfs(node):
    if node in seen:
        return
    seen.add(node)
    for nxt in neighbors(node):
        dfs(nxt)
```

### How to explain it

I use DFS because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Number of Islands

Input: grid of 1s and 0s

Output: component count

Explanation: Each DFS marks one connected component.

```python
def solve_1(input_data):
    # Apply DFS using the invariant above.
    return input_data
```

Time: O(V + E)

Space: O(V)

### Example 2: Path Sum

Input: binary tree and target

Output: whether a root-to-leaf path exists

Explanation: Recursive state carries remaining sum.

```python
def solve_2(input_data):
    # Apply DFS using the invariant above.
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
| DFS graph | O(V + E) | O(V) | Visited plus recursion stack |
| DFS tree | O(n) | O(h) | h is tree height |

## Practice Problems

### Easy

1. Path Sum
2. Invert Binary Tree
3. Flood Fill

### Medium

1. Number of Islands
2. Clone Graph
3. Pacific Atlantic Water Flow

### Hard

1. Longest Increasing Path
2. Critical Connections
3. Word Search II

## Key Takeaways

- DFS is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- DFS
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

- [Trees and Graphs - Binary Tree Max Depth example](/data-structures/trees-graphs/#example-1-binary-tree-max-depth)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
