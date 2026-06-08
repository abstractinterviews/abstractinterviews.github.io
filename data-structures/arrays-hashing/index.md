---
layout: default
title: "Arrays and Hashing"
page_type: deep-dive-post
subtitle: "The foundation for most coding interview problems."
read_time: "9 min read"
difficulty: Core
post_tabs:
  - label: Arrays
    href: "#arrays"
  - label: Hashing
    href: "#hashing"
  - label: Patterns
    href: "#patterns"
toc:
  - label: "Arrays"
    href: "#arrays"
  - label: "Hashing"
    href: "#hashing"
  - label: "Patterns"
    href: "#patterns"
previous_topic:
  title: "Data Structures"
  url: "/data-structures/"
next_topic:
  title: "Stacks, Queues, and Heaps"
  url: "/data-structures/stacks-queues-heaps/"
---

## Topic: Arrays

### Sub-topic: Use Cases

Arrays and strings are best for indexed scans, windows, prefix sums, sorting, and binary search.

### Sub-topic: Strengths

- O(1) index access.
- Cache-friendly sequential scans.
- Easy to sort and binary search.
- Natural fit for two pointers and sliding windows.

### Sub-topic: Weaknesses

- Inserting or deleting from the middle is O(n).
- Subarray copies can add hidden O(n) work.
- Off-by-one errors are common.

### Sub-topic: Example Patterns

| Pattern | Use Case |
| --- | --- |
| Two pointers | Pair search, partitioning, reversing |
| Sliding window | Longest or shortest contiguous segment |
| Prefix sum | Fast range sums and subarray counts |
| Binary search | Search sorted space or answer space |

## Topic: Hashing

### Sub-topic: Use Cases

Hash maps and sets are best for lookup, frequency counting, grouping, and duplicate detection.

### Sub-topic: Common Map Shapes

| Shape | Example |
| --- | --- |
| Value to index | Two sum |
| Value to frequency | Most common element |
| Key to list | Group anagrams |
| Prefix sum to count | Count subarrays with sum k |
| Node to clone | Clone graph |

### Sub-topic: Key Design

The key must represent exactly what you want to look up. For anagrams, sort the string or use a frequency tuple. For graph states, include the node and any extra state such as remaining stops or used coupons.

## Topic: Patterns

### Sub-topic: Common Interview Patterns

- Two sum and complements.
- Group anagrams.
- Longest substring with constraints.
- Prefix sum with hash map.

### Sub-topic: Example

```python
def group_anagrams(words):
    groups = {}
    for word in words:
        key = tuple(sorted(word))
        groups.setdefault(key, []).append(word)
    return list(groups.values())
```

This uses a canonical key. The map groups words that share the same sorted character sequence.

### Sub-topic: Gotchas

- Hash maps are O(1) average, not guaranteed worst case.
- Mutable objects should not be used as keys.
- Building keys can dominate runtime if keys are large.
