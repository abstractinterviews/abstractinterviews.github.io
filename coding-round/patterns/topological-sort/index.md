---
layout: default
title: "Topological Sort"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Order directed dependencies so prerequisites appear before dependents."
read_time: "12 min read"
difficulty: "Intermediate"
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

Topological Sort turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Trees and Graphs. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Topological Sort as the structure that removes it.

## Recognition Signals

### Prerequisites or dependencies

When you see this signal, ask whether Topological Sort can preserve an invariant that avoids repeated work.

### Course schedule

When you see this signal, ask whether Topological Sort can preserve an invariant that avoids repeated work.

### Build ordering

When you see this signal, ask whether Topological Sort can preserve an invariant that avoids repeated work.

### Detecting a cycle in directed graph

When you see this signal, ask whether Topological Sort can preserve an invariant that avoids repeated work.

## Template

### Invariant

A node can be emitted only after all incoming dependencies are resolved.

### Python template

```python
from collections import deque

def topo(graph, indegree):
    q = deque([x for x in indegree if indegree[x] == 0])
    order = []
    while q:
        node = q.popleft()
        order.append(node)
        for nxt in graph[node]:
            indegree[nxt] -= 1
            if indegree[nxt] == 0:
                q.append(nxt)
    return order
```

### How to explain it

I use Topological Sort because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Course Schedule

Input: numCourses and prerequisites

Output: can finish all courses

Explanation: If topo order misses nodes, a cycle exists.

```python
def solve_1(input_data):
    # Apply Topological Sort using the invariant above.
    return input_data
```

Time: O(V + E)

Space: O(V + E)

### Example 2: Alien Dictionary

Input: sorted alien words

Output: letter order

Explanation: Edges encode character precedence.

```python
def solve_2(input_data):
    # Apply Topological Sort using the invariant above.
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
| Kahn algorithm | O(V + E) | O(V + E) | Queue zero-indegree nodes |
| DFS topo | O(V + E) | O(V) | Use visit states for cycle detection |

## Practice Problems

### Easy

1. Find if Path Exists
2. Employee Importance
3. Minimum Height Trees basics

### Medium

1. Course Schedule
2. Course Schedule II
3. Find Eventual Safe States

### Hard

1. Alien Dictionary
2. Parallel Courses III
3. Longest Path in DAG

## Key Takeaways

- Topological Sort is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Topological Sort
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

- [Trees and Graphs - Topological Sort pattern](/data-structures/trees-graphs/#topological-sort)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
