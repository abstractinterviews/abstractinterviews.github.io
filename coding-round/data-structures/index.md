---
layout: default
title: "Data Structures"
page_type: deep-dive-index
deep_dive_id: coding-data-structures
deep_title: "Data Structures"
subtitle: "Arrays, linked lists, stacks, queues, hash tables, trees, graphs, tries, and advanced index structures."
hero_icon: "</>"
badges:
  - Coding Round
  - Interview Track
  - "13 topics"
stats:
  - value: "13"
    label: "Topics"
  - value: "Templates"
    label: "Included"
  - value: "Practice"
    label: "Ready"
overview: "Arrays, linked lists, stacks, queues, hash tables, trees, graphs, tries, and advanced index structures."
key_takeaways:
  - Recognize the topic from constraints
  - Explain brute force before optimization
  - Use templates as reasoning aids, not memorized code
  - Test edge cases explicitly
subtopics:
  - title: "Arrays"
    description: "Interview-ready guide to Arrays."
    read_time: "7 min read"
    url: "/coding-round/data-structures/arrays/"
    icon: "C"
    color: "blue"
  - title: "Linked Lists"
    description: "Interview-ready guide to Linked Lists."
    read_time: "7 min read"
    url: "/coding-round/data-structures/linked-lists/"
    icon: "C"
    color: "blue"
  - title: "Stacks"
    description: "Interview-ready guide to Stacks."
    read_time: "7 min read"
    url: "/coding-round/data-structures/stacks/"
    icon: "C"
    color: "blue"
  - title: "Queues"
    description: "Interview-ready guide to Queues."
    read_time: "7 min read"
    url: "/coding-round/data-structures/queues/"
    icon: "C"
    color: "blue"
  - title: "Hash Tables"
    description: "Interview-ready guide to Hash Tables."
    read_time: "7 min read"
    url: "/coding-round/data-structures/hash-tables/"
    icon: "C"
    color: "blue"
  - title: "Trees"
    description: "Interview-ready guide to Trees."
    read_time: "7 min read"
    url: "/coding-round/data-structures/trees/"
    icon: "C"
    color: "blue"
  - title: "BST"
    description: "Interview-ready guide to BST."
    read_time: "7 min read"
    url: "/coding-round/data-structures/bst/"
    icon: "C"
    color: "blue"
  - title: "Heaps"
    description: "Interview-ready guide to Heaps."
    read_time: "7 min read"
    url: "/coding-round/data-structures/heaps/"
    icon: "C"
    color: "blue"
  - title: "Graphs"
    description: "Interview-ready guide to Graphs."
    read_time: "7 min read"
    url: "/coding-round/data-structures/graphs/"
    icon: "C"
    color: "blue"
  - title: "Trie"
    description: "Interview-ready guide to Trie."
    read_time: "7 min read"
    url: "/coding-round/data-structures/trie/"
    icon: "C"
    color: "blue"
  - title: "Segment Trees"
    description: "Interview-ready guide to Segment Trees."
    read_time: "7 min read"
    url: "/coding-round/data-structures/segment-trees/"
    icon: "C"
    color: "blue"
  - title: "Fenwick Trees"
    description: "Interview-ready guide to Fenwick Trees."
    read_time: "7 min read"
    url: "/coding-round/data-structures/fenwick-trees/"
    icon: "C"
    color: "blue"
  - title: "Disjoint Set"
    description: "Interview-ready guide to Disjoint Set."
    read_time: "7 min read"
    url: "/coding-round/data-structures/disjoint-set/"
    icon: "C"
    color: "blue"
related_concepts:
  - title: "Coding Round"
    url: "/coding-round/"
  - title: "Data Structures"
    url: "/data-structures/"
---

# Data Structures

## Track Overview

Data structures are the tools behind coding patterns. Study them by operations, invariants, and complexity.

~~~mermaid
flowchart LR
    A["Clarify"] --> B["Recognize"]
    B --> C["Template"]
    C --> D["Code"]
    D --> E["Test"]
~~~

## Topics

| Topic | What To Study |
| --- | --- |
| [Arrays]({{ '/coding-round/data-structures/arrays/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Linked Lists]({{ '/coding-round/data-structures/linked-lists/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Stacks]({{ '/coding-round/data-structures/stacks/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Queues]({{ '/coding-round/data-structures/queues/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Hash Tables]({{ '/coding-round/data-structures/hash-tables/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Trees]({{ '/coding-round/data-structures/trees/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [BST]({{ '/coding-round/data-structures/bst/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Heaps]({{ '/coding-round/data-structures/heaps/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Graphs]({{ '/coding-round/data-structures/graphs/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Trie]({{ '/coding-round/data-structures/trie/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Segment Trees]({{ '/coding-round/data-structures/segment-trees/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Fenwick Trees]({{ '/coding-round/data-structures/fenwick-trees/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Disjoint Set]({{ '/coding-round/data-structures/disjoint-set/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Data Structures helps candidates solve coding interviews by recognizing structure, choosing the right tool, and explaining correctness. |
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
    C --> D["Recognize Data Structures"]
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
| Time | Tie complexity to input variables such as 
, m, V, E, or alphabet size. |
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

1. What input signal tells you to use 
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
| Hard | Combine Data Structures with another pattern or data structure. |
| Mock | Solve under a 35-minute timer and write tests before finalizing. |

## Cheat Sheet

| Step | Candidate Talk Track |
| --- | --- |
| Clarify | "Let me confirm input size, duplicates, ordering, and expected output." |
| Baseline | "The brute-force approach is..." |
| Optimize | "The repeated work is..., so I can use Data Structures." |
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
