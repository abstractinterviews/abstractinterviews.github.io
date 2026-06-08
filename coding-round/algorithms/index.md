---
layout: default
title: "Algorithms"
page_type: deep-dive-index
deep_dive_id: coding-algorithms
deep_title: "Algorithms"
subtitle: "Sorting, searching, graph algorithms, shortest path, MST, network flow, string matching, DP, greedy, and divide and conquer."
hero_icon: "</>"
badges:
  - Coding Round
  - Interview Track
  - "10 topics"
stats:
  - value: "10"
    label: "Topics"
  - value: "Templates"
    label: "Included"
  - value: "Practice"
    label: "Ready"
overview: "Sorting, searching, graph algorithms, shortest path, MST, network flow, string matching, DP, greedy, and divide and conquer."
key_takeaways:
  - Recognize the topic from constraints
  - Explain brute force before optimization
  - Use templates as reasoning aids, not memorized code
  - Test edge cases explicitly
subtopics:
  - title: "Sorting"
    description: "Interview-ready guide to Sorting."
    read_time: "7 min read"
    url: "/coding-round/algorithms/sorting/"
    icon: "C"
    color: "blue"
  - title: "Searching"
    description: "Interview-ready guide to Searching."
    read_time: "7 min read"
    url: "/coding-round/algorithms/searching/"
    icon: "C"
    color: "blue"
  - title: "Graph Algorithms"
    description: "Interview-ready guide to Graph Algorithms."
    read_time: "7 min read"
    url: "/coding-round/algorithms/graph-algorithms/"
    icon: "C"
    color: "blue"
  - title: "Shortest Path"
    description: "Interview-ready guide to Shortest Path."
    read_time: "7 min read"
    url: "/coding-round/algorithms/shortest-path/"
    icon: "C"
    color: "blue"
  - title: "MST"
    description: "Interview-ready guide to MST."
    read_time: "7 min read"
    url: "/coding-round/algorithms/mst/"
    icon: "C"
    color: "blue"
  - title: "Network Flow"
    description: "Interview-ready guide to Network Flow."
    read_time: "7 min read"
    url: "/coding-round/algorithms/network-flow/"
    icon: "C"
    color: "blue"
  - title: "String Matching"
    description: "Interview-ready guide to String Matching."
    read_time: "7 min read"
    url: "/coding-round/algorithms/string-matching/"
    icon: "C"
    color: "blue"
  - title: "DP"
    description: "Interview-ready guide to DP."
    read_time: "7 min read"
    url: "/coding-round/algorithms/dp/"
    icon: "C"
    color: "blue"
  - title: "Greedy"
    description: "Interview-ready guide to Greedy."
    read_time: "7 min read"
    url: "/coding-round/algorithms/greedy/"
    icon: "C"
    color: "blue"
  - title: "Divide and Conquer"
    description: "Interview-ready guide to Divide and Conquer."
    read_time: "7 min read"
    url: "/coding-round/algorithms/divide-and-conquer/"
    icon: "C"
    color: "blue"
related_concepts:
  - title: "Coding Round"
    url: "/coding-round/"
  - title: "Data Structures"
    url: "/data-structures/"
---

# Algorithms

## Track Overview

Algorithms provide the formal tools behind optimization and correctness proofs.

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
| [Sorting]({{ '/coding-round/algorithms/sorting/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Searching]({{ '/coding-round/algorithms/searching/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Graph Algorithms]({{ '/coding-round/algorithms/graph-algorithms/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Shortest Path]({{ '/coding-round/algorithms/shortest-path/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [MST]({{ '/coding-round/algorithms/mst/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Network Flow]({{ '/coding-round/algorithms/network-flow/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [String Matching]({{ '/coding-round/algorithms/string-matching/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [DP]({{ '/coding-round/algorithms/dp/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Greedy]({{ '/coding-round/algorithms/greedy/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |
| [Divide and Conquer]({{ '/coding-round/algorithms/divide-and-conquer/' | relative_url }}) | Recognition, template, mistakes, interview questions, and practice. |

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Algorithms helps candidates solve coding interviews by recognizing structure, choosing the right tool, and explaining correctness. |
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
    C --> D["Recognize Algorithms"]
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
| Hard | Combine Algorithms with another pattern or data structure. |
| Mock | Solve under a 35-minute timer and write tests before finalizing. |

## Cheat Sheet

| Step | Candidate Talk Track |
| --- | --- |
| Clarify | "Let me confirm input size, duplicates, ordering, and expected output." |
| Baseline | "The brute-force approach is..." |
| Optimize | "The repeated work is..., so I can use Algorithms." |
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
