---
layout: default
title: "Arrays & Hashing"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Arrays and hashing are fundamental data structures used to store, organize, and retrieve data efficiently. They are building blocks for many algorithms and appear in 30%+ of coding interviews."
read_time: "25 min read"
difficulty: "Beginner Friendly"
practice_count: 45
previous_topic:
  title: "Data Structures"
  url: "/data-structures/"
next_topic:
  title: "Two Pointers"
  url: "/coding-round/patterns/two-pointers/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What are Arrays?

Collection of elements of the same type stored in contiguous memory locations.

Learn more: Arrays

### What is Hashing?

Technique to map keys to indices in a hash table for fast insert and lookup.

Learn more: Hash Tables

### When to Use?

Use arrays for ordered data and hashing for fast lookup, counting, and grouping.

Learn more: Common Patterns

### Time Complexity

Arrays provide O(1) access. Hashing provides O(1) average lookup, with O(n) worst case when collisions degrade.

Learn more: Complexity

## Arrays

Arrays are useful when position matters. If you know the index, the runtime can compute the memory address directly instead of searching.

### Mental model

Think of an apartment building: apartment number 0, 1, 2, 3. If you know the number, you can jump directly to the value.

### Interview signal

Use arrays when the problem mentions order, index, prefix or suffix scans, fixed windows, or in-place updates.

## Hash Tables

Hashing is the engine behind fast membership checks, frequency counting, grouping, and key-value lookup.

### Why candidates need this

A hash map often turns a nested search from O(n^2) into O(n). That is the difference between timing out and passing at production-size input.

### Senior gotcha

Hash maps are average O(1), not guaranteed O(1). Poor hash distribution or adversarial collisions can degrade operations to O(n).

## Practice

### Example 1: Two Sum

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

Input: `nums = [2, 7, 11, 15]`, `target = 9`

Output: `[0, 1]`

Explanation: `nums[0] + nums[1] == 2 + 7 == 9`.

```python
def twoSum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []
```

Time: O(n)

Space: O(n)

### Example 2: Contains Duplicate

Given an array, return `true` if any value appears at least twice.

Input: `nums = [2, 2, 3, 1]`

Output: `true`

Explanation: `2` is repeated.

```python
def containsDuplicate(nums):
    seen = set()
    for num in nums:
        if num in seen:
            return True
        seen.add(num)
    return False
```

Time: O(n)

Space: O(n)

## Common Patterns

### Frequency Map

Count occurrences of values.

Example: Top K Frequent Elements

### Two Sum

Find pair complements in O(n).

Example: Two Sum

### Grouping

Group by signature, such as sorted characters.

Example: Group Anagrams

### Prefix Hashing

Use prefix sums and hash maps for range queries.

Example: Subarray Sum Equals K

## Complexity

| Operation | Array | Hash Table (Average) | Hash Table (Worst Case) |
| --- | --- | --- | --- |
| Access | O(1) | O(1) | O(n) |
| Search | O(n) | O(1) | O(n) |
| Insert | O(n)* | O(1) | O(n) |
| Delete | O(n)* | O(1) | O(n) |
| Space | O(n) | O(n) | O(n) |

*Insert/delete at the end is O(1) in arrays amortized.*

## Practice Problems

### Easy

1. Two Sum
2. Contains Duplicate
3. Valid Anagram

### Medium

1. Group Anagrams
2. Top K Frequent Elements
3. Subarray Sum Equals K

### Hard

1. Longest Consecutive Sequence
2. Subarray Sum Closest
3. Count of Range Sum

## Key Takeaways

- Arrays provide ordered storage with fast access by index.
- Hashing provides fast average-case lookup, insert, and delete.
- Choose the right structure based on the problem requirements.
- Master common patterns to solve interview problems efficiently.

## Quick Summary

### Arrays

- Ordered collection
- Index-based access
- Good for sequential data

### Hash Tables

- Key-value mapping
- Fast average lookup
- Unordered collection

## Related Topics

- Two Pointers: /coding-round/patterns/two-pointers/
- Sliding Window: /coding-round/patterns/sliding-window/
- Hash Map vs Hash Set: /data-structures/arrays-hashing/
- Time & Space Complexity: /data-structures/selection-complexity/
