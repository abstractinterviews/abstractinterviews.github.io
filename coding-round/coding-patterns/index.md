---
layout: default
title: "Coding Patterns"
page_type: deep-dive-post
subtitle: "The recurring algorithmic patterns behind most coding interviews."
read_time: "12 min read"
difficulty: Intermediate
post_tabs:
  - label: Arrays
    href: "#arrays"
  - label: Graphs
    href: "#graphs"
  - label: DP
    href: "#dp"
toc:
  - label: "Arrays"
    href: "#arrays"
  - label: "Graphs"
    href: "#graphs"
  - label: "DP"
    href: "#dp"
previous_topic:
  title: "Problem Solving Framework"
  url: "/coding-round/problem-solving-framework/"
next_topic:
  title: "Edge Cases and Testing"
  url: "/coding-round/edge-cases-testing/"
---

## Topic: Arrays

### Sub-topic: Common Patterns

- Two pointers
- Sliding window
- Prefix sum
- Binary search

### Sub-topic: Two Pointers

Use two pointers when order matters and you can move boundaries based on a comparison. Typical problems include pair sum in a sorted array, reversing, partitioning, and merging.

```python
def has_pair_with_sum(nums, target):
    left, right = 0, len(nums) - 1
    while left < right:
        total = nums[left] + nums[right]
        if total == target:
            return True
        if total < target:
            left += 1
        else:
            right -= 1
    return False
```

### Sub-topic: Sliding Window

Use sliding window when you need the best contiguous range. The invariant should describe what the current window contains.

Examples:

- Longest substring without repeats.
- Minimum window containing characters.
- Maximum sum subarray of size `k`.
- Count subarrays satisfying a constraint.

### Sub-topic: Prefix Sum

Prefix sums convert range-sum queries into subtraction. With a hash map, they also solve "number of subarrays with sum k" style problems.

## Topic: Graphs

### Sub-topic: Common Patterns

- DFS
- BFS
- Topological sort
- Shortest path

### Sub-topic: DFS

DFS is useful for exploring connected components, recursion over trees, cycle detection, and backtracking. State management matters: decide whether `visited` is global, path-specific, or state-specific.

### Sub-topic: BFS

BFS is the default for shortest path in unweighted graphs and level-order traversal. Use a queue and mark nodes visited when enqueuing to avoid duplicates.

### Sub-topic: Topological Sort

Use topological sort when tasks have dependencies. If you cannot process all nodes, there is a cycle.

| Problem Type | Pattern |
| --- | --- |
| Course schedule | Topological sort |
| Word ladder | BFS |
| Number of islands | DFS or BFS |
| Clone graph | DFS with map |
| Shortest weighted path | Dijkstra |

## Topic: DP

### Sub-topic: Mental Model

Define state, transition, base case, and answer extraction.

### Sub-topic: DP Checklist

1. What is the smallest subproblem?
2. What state uniquely identifies a subproblem?
3. What choices transition between states?
4. What base cases stop recursion?
5. Is the answer one state or an aggregate?

### Sub-topic: Example

For climbing stairs, `dp[i]` is the number of ways to reach step `i`. The transition is `dp[i] = dp[i - 1] + dp[i - 2]`. The base cases are `dp[0] = 1` and `dp[1] = 1`.

```python
def climb_stairs(n):
    prev2, prev1 = 1, 1
    for _ in range(2, n + 1):
        prev2, prev1 = prev1, prev1 + prev2
    return prev1
```

### Sub-topic: Interview Warning

Do not jump to DP without defining state. If the state is unclear, the solution will be difficult to explain and debug.
