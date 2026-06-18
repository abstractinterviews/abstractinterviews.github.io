---
layout: default
title: "Hash Tables"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Key-based lookup for membership, counting, grouping, and index acceleration."
read_time: "12 min read"
difficulty: "Beginner Friendly"
practice_count: 42
previous_topic:
  title: "Arrays"
  url: "/coding-round/data-structures/arrays/"
next_topic:
  title: "Linked Lists"
  url: "/coding-round/data-structures/linked-lists/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Key-based lookup for membership, counting, grouping, and index acceleration.

### Why candidates need it

Hash tables turn repeated scans into key lookups, which is why many O(n^2) brute-force solutions become O(n).

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Average O(1) is not guaranteed. Poor hashes, adversarial keys, or mutable keys can break lookup performance or correctness.

## Mental Model

### Hash first, compare second

Name the invariant before coding.

### Counting is lookup plus update

Tie the invariant to the operation cost.

### Collisions are normal but not free

Test the boundary where the invariant can break.

## Practice

### Example 1: Contains Duplicate

Use a set to remember values already seen.

Input: `nums = [1, 2, 3, 1]`

Output: `true`

Explanation: The second `1` is detected by average O(1) membership lookup.

```python
def contains_duplicate(nums):
    seen = set()
    for value in nums:
        if value in seen:
            return True
        seen.add(value)
    return False
```

Time: O(n) average

Space: O(n)

### Example 2: Group Anagrams

Use a canonical key for each word.

Input: `["eat", "tea", "tan", "ate"]`

Output: `[["eat", "tea", "ate"], ["tan"]]`

Explanation: Words with the same sorted key land in the same bucket.

```python
from collections import defaultdict

def group_anagrams(words):
    groups = defaultdict(list)
    for word in words:
        key = tuple(sorted(word))
        groups[key].append(word)
    return list(groups.values())
```

Time: O(n k log k)

Space: O(nk)

## Common Patterns

### Frequency Map

Count occurrences.

### Index Map

Map values to indexes for complements.

### Grouping Key

Normalize values into buckets.

### Hash Set

Track membership or visited state.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Lookup | O(1) avg, O(n) worst | Collision degradation |
| Insert | O(1) avg | Resize may occur |
| Delete | O(1) avg | Hash and equality |
| Iteration | O(n) | Visit entries |
| Space | O(n) | Buckets plus entries |

## Practice Problems

### Easy

- Two Sum
- Contains Duplicate
- Valid Anagram

### Medium

- Group Anagrams
- Top K Frequent Elements
- Subarray Sum Equals K

### Hard

- Longest Consecutive Sequence
- Minimum Window Substring
- Alien Dictionary

## Key Takeaways

- Choose Hash Tables because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Hash Tables
- Key-based lookup for membership, counting, grouping, and index acceleration.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Arrays & Hashing](/data-structures/arrays-hashing/#hash-tables)
- [Two Sum example](/data-structures/arrays-hashing/#example-1-two-sum)
- [Prefix Sum](/coding-round/patterns/prefix-sum/)
- [Trie](/coding-round/data-structures/trie/)
