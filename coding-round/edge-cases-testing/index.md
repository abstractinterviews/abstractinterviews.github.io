---
layout: default
title: "Edge Cases and Testing"
page_type: deep-dive-post
subtitle: "How to validate coding solutions under interview constraints."
read_time: "7 min read"
difficulty: Core
post_tabs:
  - label: Cases
    href: "#cases"
  - label: Testing
    href: "#testing"
  - label: Debugging
    href: "#debugging"
toc:
  - label: "Cases"
    href: "#cases"
  - label: "Testing"
    href: "#testing"
  - label: "Debugging"
    href: "#debugging"
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/coding-patterns/"
next_topic:
  title: "Practical Coding Rounds"
  url: "/coding-round/practical-coding/"
---

## Topic: Cases

### Sub-topic: Checklist

- Empty input
- Single item
- Duplicates
- Negative values
- Already sorted
- Maximum constraints

### Sub-topic: Edge Case Categories

| Category | Examples |
| --- | --- |
| Size | empty, one item, two items, maximum size |
| Value | negative, zero, duplicates, very large values |
| Shape | sorted, reverse sorted, all equal, sparse graph |
| Result | no solution, multiple solutions, all valid |
| Boundary | first item, last item, off-by-one windows |

### Sub-topic: How to Pick Tests

Do not list random tests. Pick tests that challenge the invariant. For sliding window, test shrink behavior. For binary search, test boundary positions. For graph traversal, test cycles and disconnected components.

## Topic: Testing

### Sub-topic: Approach

Test normal cases first, then boundaries, then cases that stress the chosen invariant.

### Sub-topic: Example Test Plan

For longest substring without repeating characters:

| Test | Why |
| --- | --- |
| `""` | Empty input |
| `"a"` | Single character |
| `"abcabcbb"` | Repeated shrink |
| `"bbbbb"` | All duplicates |
| `"pwwkew"` | Window must move past previous duplicate |

### Sub-topic: Verbal Testing

In interviews, you may not need to write unit tests, but you should run the code mentally against representative cases and state expected outputs.

## Topic: Debugging

### Sub-topic: Method

Trace one failing example manually and compare actual state against expected invariant.

### Sub-topic: Debugging Steps

1. Reproduce with the smallest failing input.
2. Write expected state after each iteration.
3. Compare actual state to expected state.
4. Identify the first divergence.
5. Fix the invariant or boundary condition.

### Sub-topic: Common Bugs

- Updating pointers in the wrong order.
- Marking graph nodes visited too late.
- Using `<=` when `<` is required.
- Forgetting to remove items from a window.
- Returning inside a loop before all cases are checked.
