---
layout: default
title: "Linked Lists"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Pointer-based sequences for node manipulation, cycle detection, and constant-time splicing."
read_time: "12 min read"
difficulty: "Core"
practice_count: 28
previous_topic:
  title: "Hash Tables"
  url: "/coding-round/data-structures/hash-tables/"
next_topic:
  title: "Stacks"
  url: "/coding-round/data-structures/stacks/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Pointer-based sequences for node manipulation, cycle detection, and constant-time splicing.

### Why candidates need it

Linked lists test pointer discipline: preserving the next node, updating links in order, and handling null boundaries.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

Save the next pointer before rewiring. Losing it can orphan the rest of the list.

## Mental Model

### Nodes are identities, not indexes

Name the invariant before coding.

### Dummy nodes simplify head changes

Tie the invariant to the operation cost.

### Fast and slow pointers reveal cycles or middles

Test the boundary where the invariant can break.

## Practice

### Example 1: Reverse Linked List

Reverse links one node at a time.

Input: `1 -> 2 -> 3`

Output: `3 -> 2 -> 1`

Explanation: Keep `prev`, `cur`, and `nxt` so the remaining list is not lost.

```python
def reverse_list(head):
    prev, cur = None, head
    while cur:
        nxt = cur.next
        cur.next = prev
        prev = cur
        cur = nxt
    return prev
```

Time: O(n)

Space: O(1)

### Example 2: Detect Cycle

Use slow and fast pointers.

Input: `head` with possible cycle

Output: `true` or `false`

Explanation: If a cycle exists, fast eventually laps slow.

```python
def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow is fast:
            return True
    return False
```

Time: O(n)

Space: O(1)

## Common Patterns

### Dummy Head

Simplify insert/delete at head.

### Fast/Slow Pointers

Cycle and middle detection.

### Pointer Reversal

Reverse or reorder links.

### Merge Lists

Maintain a tail pointer.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Access by index | O(n) | Traverse |
| Insert after node | O(1) | Known node |
| Delete after node | O(1) | Known previous |
| Search | O(n) | No direct index |
| Space | O(n) | Node objects plus references |

## Practice Problems

### Easy

- Reverse Linked List
- Merge Two Sorted Lists
- Linked List Cycle

### Medium

- Remove Nth Node From End
- Reorder List
- Add Two Numbers

### Hard

- Merge K Sorted Lists
- Reverse Nodes in K Group
- Copy List with Random Pointer

## Key Takeaways

- Choose Linked Lists because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Linked Lists
- Pointer-based sequences for node manipulation, cycle detection, and constant-time splicing.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Stacks, Queues, and Heaps](/data-structures/stacks-queues-heaps/)
- [Fast Slow Pointers](/coding-round/patterns/fast-slow-pointers/)
- [Two Pointers](/coding-round/patterns/two-pointers/)
- [Heaps](/coding-round/data-structures/heaps/)
