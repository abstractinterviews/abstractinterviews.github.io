---
layout: default
title: "State Compression"
page_type: deep-dive-post
subtitle: "State Compression for coding interviews: recognition, template, mistakes, and practice."
read_time: "7 min read"
difficulty: Intermediate
post_tabs:
  - label: Pattern
    href: "#pattern"
  - label: Template
    href: "#template"
  - label: Practice
    href: "#practice"
toc:
  - label: "What Is It?"
    href: "#what-is-it"
  - label: "Recognition Signals"
    href: "#recognition-signals"
  - label: "Template"
    href: "#template"
  - label: "Practice"
    href: "#practice"
previous_topic:
  title: "Dynamic Programming Track"
  url: "/coding-round/patterns/dynamic-programming-track/"
next_topic:
  title: "Coding Round"
  url: "/coding-round/"
date: 2026-06-08
slug: index
categories: [interview-prep]
reading_time: 5
---
# State Compression

## What Is It? {#what-is-it}

State Compression is a coding interview topic used to turn a broad problem into a recognizable structure with a clear invariant, implementation template, and complexity story.

## When To Use It?

Use State Compression when the input constraints or desired optimization match its recognition signals. In interviews, say why the topic fits before writing code.

## Recognition Signals {#recognition-signals}

| Signal | Interview Meaning |
| --- | --- |
| Constraint pressure | Brute force is correct but too slow or too memory-heavy. |
| Repeated work | There is a reusable result, state transition, or maintained invariant. |
| Structure | The data has order, adjacency, hierarchy, frequency, ranges, or dependencies. |
| Output shape | The answer asks for count, min/max, existence, ordering, grouping, or reconstruction. |

## Pattern {#pattern}

~~~mermaid
flowchart TD
    Input["Input constraints"] --> Baseline["Brute force"]
    Baseline --> Pain["Find repeated work"]
    Pain --> Pattern["Apply State Compression"]
    Pattern --> Invariant["Maintain invariant"]
    Invariant --> Answer["Return answer"]
~~~

## Template {#template}

~~~python
def solve(input_data):
    result = None
    state = None

    # Maintain the invariant for State Compression.
    for item in input_data:
        # update state
        # update result
        pass

    return result
~~~

## Variations

| Variation | What Changes |
| --- | --- |
| Counting | Track number of valid states or choices. |
| Optimization | Track best, worst, shortest, longest, min, or max. |
| Reconstruction | Store parent pointers, choices, or previous state. |
| Online processing | Update answer as items arrive instead of preprocessing everything. |

## Interview Tips

- Say the brute-force solution first.
- Name the invariant before coding the optimized version.
- Keep variable names tied to the idea, not random letters.
- Test one normal case and one edge case before claiming done.
- Explain why the solution terminates and why it covers all valid cases.

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | State Compression helps candidates solve coding interviews by recognizing structure, choosing the right tool, and explaining correctness. |
| Use when | The problem constraints, input shape, or required optimization match this topic's signals. |
| Senior signal | Explain brute force first, identify repeated work, state invariants, and validate edge cases. |
| Common trap | Memorizing solutions without being able to recognize when the topic applies. |

## Pattern Recognition

| Signal | What It Suggests |
| --- | --- |
| Need one pass | Look for state that can be updated incrementally. |
| Repeated subproblems | Consider memoization, dynamic programming, or caching intermediate results. |
| Ordered input | Consider binary search, two pointers, sweep line, or monotonic structures. |
| Graph-like relationships | Model nodes, edges, visited state, and traversal order. |
| Top-k or priority | Consider heap, selection, or ordered data structures. |

## Mental Model

Think in this order: **input shape -> brute force -> repeated work -> invariant -> data structure -> proof -> edge cases**. Interviewers are usually testing whether you can discover the pattern, not whether you can recite it.

~~~mermaid
flowchart LR
    A["Clarify constraints"] --> B["State brute force"]
    B --> C["Find repeated work"]
    C --> D["Recognize State Compression"]
    D --> E["Apply template"]
    E --> F["Prove correctness"]
    F --> G["Test edge cases"]
~~~

## Template

~~~python
def solve(input_data):
    # 1. Clarify shape and constraints
    # 2. Choose state that captures the invariant
    state = None

    # 3. Iterate, recurse, search, or process structure
    for item in input_data:
        # update state
        pass

    # 4. Return result and explain complexity
    return state
~~~

## Complexity

| Dimension | What To Explain |
| --- | --- |
| Time | Tie complexity to input variables such as n, m, V, E, or alphabet size. |
| Space | Separate auxiliary memory from output memory. |
| Bottleneck | Identify sorting, nested loops, recursion depth, heap operations, or graph traversal. |
| Optimization | Explain what repeated work was removed and what memory or complexity was added. |

## Common Mistakes

- Skipping clarification and coding the wrong interpretation.
- Jumping to an optimized solution before explaining brute force.
- Using a pattern because it is familiar rather than because the constraints fit.
- Forgetting empty input, duplicates, negative values, overflow, cycles, or disconnected components.
- Giving Big O without explaining which variable it refers to.
- Failing to test the exact edge case that breaks the invariant.

## Interview Questions

1. What input signal tells you to use this topic?
2. What is the brute-force solution and why is it inefficient?
3. What invariant must remain true while solving the problem?
4. What edge cases can break the implementation?
5. Can the solution be made iterative, recursive, or memory-optimized?
6. How would you explain the trade-off in two minutes?

## Practice Problems

| Level | Prompt |
| --- | --- |
| Easy | Solve a minimal version and explain the invariant aloud. |
| Medium | Add duplicates, negative values, or boundary cases. |
| Hard | Combine State Compression with another pattern or data structure. |
| Mock | Solve under a 35-minute timer and write tests before finalizing. |

## Cheat Sheet

| Step | Candidate Talk Track |
| --- | --- |
| Clarify | "Let me confirm input size, duplicates, ordering, and expected output." |
| Baseline | "The brute-force approach is..." |
| Optimize | "The repeated work is..., so I can use State Compression." |
| Prove | "The invariant is maintained because..." |
| Test | "I'll test empty, single item, duplicates, and boundary values." |

## Flashcards

| Front | Back |
| --- | --- |
| What is the first move in a coding interview? | Restate the problem and clarify constraints. |
| Why explain brute force? | It shows you understand correctness before optimization. |
| What makes a pattern useful? | It removes repeated work or preserves an invariant under the given constraints. |
| What should a template include? | State, update rule, termination condition, and complexity. |
| How do you finish strong? | Run targeted edge cases and summarize complexity. |

## Revision Notes

- Recognize the pattern from constraints, not from keywords alone.
- Always state brute force before optimizing.
- Name the invariant before or while coding.
- Test edge cases that stress the invariant.
- Explain time and space with precise variables.
- Final interview move: summarize the approach, correctness reason, and complexity.

<!-- interview-module:end -->


### Example implementation (placeholder)

```python
# TODO: add working example
def solution(input):
    return input
```



### Quiz

1. Question: What is the main trade-off?
<!-- Answers: 1) Explain trade-off -->
