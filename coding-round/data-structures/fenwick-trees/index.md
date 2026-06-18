---
layout: default
title: "Fenwick Trees"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Compact binary indexed trees for prefix sums, point updates, and frequency ranking."
read_time: "12 min read"
difficulty: "Advanced"
practice_count: 16
previous_topic:
  title: "Segment Trees"
  url: "/coding-round/data-structures/segment-trees/"
next_topic:
  title: "Disjoint Set"
  url: "/coding-round/data-structures/disjoint-set/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Compact binary indexed trees for prefix sums, point updates, and frequency ranking.

### Why candidates need it

Fenwick trees give logarithmic prefix sums and point updates with less code and memory than a segment tree for sums.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Fenwick trees are usually 1-indexed. Off-by-one mistakes are the main failure mode.

## Mental Model

### Index owns a suffix block

Name the invariant before coding.

### Update climbs upward

Tie the invariant to the operation cost.

### Query walks backward

Test the boundary where the invariant can break.

## Practice

### Example 1: Range Sum with Updates

Use prefix sums from the Fenwick tree.

Input: `nums`, update, sumRange

Output: `range total`

Explanation: Range sum is prefix(right) minus prefix(left - 1).

```python
class Fenwick:
    def __init__(self, n):
        self.bit = [0] * (n + 1)
    def add(self, index, delta):
        index += 1
        while index < len(self.bit):
            self.bit[index] += delta
            index += index & -index
    def prefix(self, index):
        index += 1; total = 0
        while index > 0:
            total += self.bit[index]
            index -= index & -index
        return total
```

Time: O(log n)

Space: O(n)

### Example 2: Count Smaller After Self

Compress values and count prior frequencies.

Input: `nums = [5,2,6,1]`

Output: `[2,1,1,0]`

Explanation: Process right to left; prefix count gives smaller values already seen.

```python
def rank_values(nums):
    return {v: i for i, v in enumerate(sorted(set(nums)))}
```

Time: O(n log n)

Space: O(n)

## Common Patterns

### Prefix Frequency

Count values up to rank.

### Point Update

Add delta at one position.

### Range Sum

Subtract two prefixes.

### Coordinate Compression

Rank arbitrary values.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Add/update | O(log n) | Move by lowbit |
| Prefix query | O(log n) | Move backward |
| Range query | O(log n) | Two prefixes |
| Build repeated adds | O(n log n) | Simple build |
| Space | O(n) | One array |

## Practice Problems

### Easy

- Running Sum
- Pivot Index
- Range Sum

### Medium

- Range Sum Mutable
- Count Smaller
- Reverse Pairs Variant

### Hard

- Create Sorted Array
- Count Range Sum
- Smaller After Self

## Key Takeaways

- Choose Fenwick Trees because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Fenwick Trees
- Compact binary indexed trees for prefix sums, point updates, and frequency ranking.

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
- [Segment Trees](/coding-round/data-structures/segment-trees/)
- [Binary Search](/coding-round/patterns/binary-search/)
- [Sweep Line](/coding-round/patterns/sweep-line/)
