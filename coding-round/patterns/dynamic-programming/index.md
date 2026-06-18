---
layout: default
title: "Dynamic Programming"
page_type: coding-pattern-topic
track: "Coding Patterns"
subtitle: "Cache repeated state transitions to avoid exponential recomputation."
read_time: "12 min read"
difficulty: "Intermediate"
practice_count: 20
previous_topic:
  title: "Coding Patterns"
  url: "/coding-round/patterns/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/selection-complexity/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it solves

Dynamic Programming turns a repeated brute-force search into a maintained invariant. Instead of recomputing from scratch, you preserve just enough state to move forward safely.

### Why interviewers ask it

Interviewers want to see whether you can recognize the shape of the prompt, explain the invariant, and connect the pattern to data-structure costs.

### Data-structure dependency

This pattern most often depends on Selection and Complexity. Study the linked data-structure article to understand the operations behind the template.

### Candidate signal

A strong answer states brute force first, names the repeated work, then introduces Dynamic Programming as the structure that removes it.

## Recognition Signals

### Prompt has reusable state

When you see this signal, ask whether Dynamic Programming can preserve an invariant that avoids repeated work.

### Brute force repeats work

When you see this signal, ask whether Dynamic Programming can preserve an invariant that avoids repeated work.

### There is a clear invariant

When you see this signal, ask whether Dynamic Programming can preserve an invariant that avoids repeated work.

### The structure maps to known examples

When you see this signal, ask whether Dynamic Programming can preserve an invariant that avoids repeated work.

## Template

### Invariant

Maintain the Dynamic Programming state so each decision stays valid.

### Python template

```python
def solve(input_data):
    state = initialize()
    for item in input_data:
        update(state, item)
    return answer(state)
```

### How to explain it

I use Dynamic Programming because the prompt has a reusable state. The invariant tells me which move is safe, and each step reduces the remaining search space or advances the maintained state.

## Practice

### Example 1: Overlapping subproblems

Input: problem-specific input

Output: optimized result

Explanation: This is the standard Dynamic Programming use case.

```python
def solve_1(input_data):
    # Apply Dynamic Programming using the invariant above.
    return input_data
```

Time: Usually O(n) to O(n log n)

Space: Usually O(n)

### Example 2: Dynamic Programming Follow-up

Input: larger constraints

Output: same result faster

Explanation: The pattern removes repeated work.

```python
def solve_2(input_data):
    # Apply Dynamic Programming using the invariant above.
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

The pattern is powered by operations from Selection and Complexity. Explain lookup, ordering, traversal, or priority cost explicitly.

### Missing edge cases

Test empty input, one item, duplicates, all equal values, and the smallest failing boundary.

## Complexity

| Variant | Time | Space | Why |
| --- | --- | --- | --- |
| Dynamic Programming | Usually O(n) to O(n log n) | Usually O(n) | Depends on state and transitions |

## Practice Problems

### Easy

1. Dynamic Programming Basics
2. Dynamic Programming Recognition
3. Template Drill

### Medium

1. Dynamic Programming Optimization
2. Stateful Variant
3. Interview Variant

### Hard

1. Dynamic Programming with Constraints
2. Combined Pattern
3. Adversarial Case

## Key Takeaways

- Dynamic Programming is useful only when the prompt matches its invariant.
- Explain brute force before introducing the optimized pattern.
- Link the pattern to the data structure that makes the operation cheap.
- Test boundaries where the invariant can break.

## Quick Summary

### Pattern

- Dynamic Programming
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

- [Selection and Complexity - invariant thinking](/data-structures/selection-complexity/#invariant)

## Related Topics

- [Coding Patterns](/coding-round/patterns/)
- [Data Structures](/data-structures/)
- [Selection and Complexity](/data-structures/selection-complexity/)
