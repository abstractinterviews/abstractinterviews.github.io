---
layout: default
title: "Segment Trees"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Range-query trees for dynamic sums, minimums, maximums, and interval aggregation."
read_time: "12 min read"
difficulty: "Advanced"
practice_count: 18
previous_topic:
  title: "Trie"
  url: "/coding-round/data-structures/trie/"
next_topic:
  title: "Fenwick Trees"
  url: "/coding-round/data-structures/fenwick-trees/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Range-query trees for dynamic sums, minimums, maximums, and interval aggregation.

### Why candidates need it

Segment trees handle changing arrays where prefix sums fail because updates would be too expensive.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Define the merge operation and identity value first. Sum, min, max, and gcd need different identities.

## Mental Model

### Each node owns an interval

Name the invariant before coding.

### Queries decompose ranges

Tie the invariant to the operation cost.

### Updates bubble upward

Test the boundary where the invariant can break.

## Practice

### Example 1: Range Sum Query Mutable

Point update and range sum query.

Input: `nums = [1, 3, 5]`

Output: `sumRange(0,2)=9`

Explanation: Updates touch one leaf and O(log n) parent intervals.

```python
class NumArray:
    def __init__(self, nums):
        self.n = len(nums)
        self.tree = [0] * (2 * self.n)
        self.tree[self.n:] = nums
        for i in range(self.n - 1, 0, -1):
            self.tree[i] = self.tree[2*i] + self.tree[2*i+1]
```

Time: O(log n) query/update

Space: O(n)

### Example 2: Range Minimum Query

Store minimum over intervals.

Input: `nums`, range `[l, r]`

Output: `minimum value`

Explanation: The merge function changes from sum to min.

```python
def merge(left_value, right_value):
    return min(left_value, right_value)

IDENTITY = float("inf")
```

Time: O(log n)

Space: O(n)

## Common Patterns

### Range Aggregate

Answer sum/min/max over intervals.

### Point Update

Refresh ancestors.

### Lazy Propagation

Delay range updates.

### Coordinate Compression

Compact sparse coordinates.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Build | O(n) | Bottom-up |
| Range query | O(log n) | Boundary nodes |
| Point update | O(log n) | Leaf to root |
| Lazy range update | O(log n) | With tags |
| Space | O(n) | Often 4n recursively |

## Practice Problems

### Easy

- Range Sum Immutable
- Summary Ranges
- Count Odds

### Medium

- Range Sum Mutable
- My Calendar I
- Count Smaller

### Hard

- Falling Squares
- Skyline
- Range Module

## Key Takeaways

- Choose Segment Trees because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Segment Trees
- Range-query trees for dynamic sums, minimums, maximums, and interval aggregation.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Selection and Complexity](/data-structures/selection-complexity/#complexity)
- [Fenwick Trees](/coding-round/data-structures/fenwick-trees/)
- [Sweep Line](/coding-round/patterns/sweep-line/)
- [Intervals](/coding-round/patterns/intervals/)
