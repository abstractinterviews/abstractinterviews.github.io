---
layout: default
title: "Data Structures"
page_type: deep-dive-index
deep_dive_id: data-structures
deep_title: "Data Structures"
subtitle: "Core data structures, selection rules, and interview usage patterns."
hero_icon: "DS"
badges:
  - Core Track
  - Coding
  - "~35 min read"
stats:
  - value: "4"
    label: "Sub Topics"
  - value: "12"
    label: "Structures"
  - value: "20+"
    label: "Use Cases"
  - value: "8"
    label: "Complexity Rules"
overview: "Data structures are the tools that make algorithms efficient. Interview performance depends on choosing the right structure and explaining the cost."
key_takeaways:
  - Match structure to operation mix
  - Know common complexity costs
  - State invariants clearly
  - Test boundary behavior
subtopics:
  - title: "Arrays and Hashing"
    description: "Arrays, strings, hash maps, sets, and frequency tables."
    read_time: "9 min read"
    url: "/data-structures/arrays-hashing/"
    icon: "A"
    color: "blue"
  - title: "Stacks, Queues, and Heaps"
    description: "Ordered processing, monotonic structures, priority queues, and scheduling."
    read_time: "9 min read"
    url: "/data-structures/stacks-queues-heaps/"
    icon: "S"
    color: "violet"
  - title: "Trees and Graphs"
    description: "Hierarchies, traversal, dependencies, and reachability."
    read_time: "10 min read"
    url: "/data-structures/trees-graphs/"
    icon: "T"
    color: "green"
  - title: "Selection and Complexity"
    description: "How to choose quickly and explain time-space trade-offs."
    read_time: "6 min read"
    url: "/data-structures/selection-complexity/"
    icon: "C"
    color: "amber"
related_concepts:
  - title: "Coding Round"
    url: "/coding-round/"
  - title: "Interview Readiness"
    url: "/interview/"
---

# Data Structures

## Topic: Overview

### Sub-topic: Key Idea

Choose a data structure by the operations you need: lookup, ordering, insertion, deletion, traversal, or priority.

## Topic: Selection Table

### Sub-topic: Quick Mapping

| Need | Structure |
| --- | --- |
| Fast lookup | Hash map or set |
| Ordered processing | Queue or deque |
| Nested state | Stack |
| Top-k | Heap |
| Hierarchy | Tree |
| Relationships | Graph |

## Topic: Interview Rule

### Sub-topic: Explanation

When you choose a structure, state why it fits and what time-space cost it creates.
