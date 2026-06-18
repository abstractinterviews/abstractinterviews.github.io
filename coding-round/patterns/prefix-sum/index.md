---
layout: default
title: "Prefix Sum"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Precompute cumulative state so range queries become subtraction or lookup."
read_time: "12 min read"
difficulty: "Core"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/arrays-hashing/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

Prefix Sum turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Arrays & Hashing. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Prefix Sum as the structure that removes it.

## Recognition Signals

### Range sum or subarray total

When you see this signal, ask whether Prefix Sum can preserve an invariant that avoids repeated work.

### Many repeated interval queries

When you see this signal, ask whether Prefix Sum can preserve an invariant that avoids repeated work.

### Need count of subarrays with target sum

When you see this signal, ask whether Prefix Sum can preserve an invariant that avoids repeated work.

### Difference between two prefixes answers the question

When you see this signal, ask whether Prefix Sum can preserve an invariant that avoids repeated work.

## Template

### Invariant

prefix[i] stores the aggregate before index i, so any range can be derived from two prefixes.

### Python template

```python
def prefix_sum(nums):
    prefix = 0
    seen = {0: 1}
    count = 0
    for x in nums:
        prefix += x
        count += seen.get(prefix - target, 0)
        seen[prefix] = seen.get(prefix, 0) + 1
    return count
```

### How to explain it

I use Prefix Sum because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Subarray Sum Equals K

Input: nums = [1, 1, 1], k = 2

Output: 2

Explanation: Previous prefix sums identify ranges ending here.

```python
def solve_1(input_data):
    # Apply Prefix Sum using the invariant above.
    return input_data
```

Time: O(n)

Space: O(n)

### Example 2: Range Sum Query

Input: sumRange(1, 3)

Output: prefix[4] - prefix[1]

Explanation: Two stored prefixes answer a range query.

```python
def solve_2(input_data):
    # Apply Prefix Sum using the invariant above.
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

The pattern is powered by operations from Arrays & Hashing. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| Build prefix | O(n) | O(n) | Store cumulative totals |
| Streaming hash prefix | O(n) | O(n) | Count previous prefixes |

## Practice Problems

### Easy

1. Range Sum Query
2. Find Pivot Index
3. Running Sum

### Medium

1. Subarray Sum Equals K
2. Product Except Self
3. Contiguous Array

### Hard

1. Count of Range Sum
2. Maximum Sum Rectangle
3. Shortest Subarray at Least K

## Key Takeaways

- Prefix Sum is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Prefix Sum
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

- [Arrays & Hashing - Prefix Hashing pattern](/data-structures/arrays-hashing/#prefix-hashing)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
