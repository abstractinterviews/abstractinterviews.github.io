---
layout: default
title: "Selection and Complexity"
page_type: deep-dive-post
subtitle: "How to choose data structures and explain complexity quickly."
read_time: "6 min read"
difficulty: Core
post_tabs:
  - label: Selection
    href: "#selection"
  - label: Complexity
    href: "#complexity"
  - label: Trade-offs
    href: "#trade-offs"
toc:
  - label: "Selection"
    href: "#selection"
  - label: "Complexity"
    href: "#complexity"
  - label: "Trade-offs"
    href: "#trade-offs"
previous_topic:
  title: "Trees and Graphs"
  url: "/data-structures/trees-graphs/"
next_topic:
  title: "Data Structures"
  url: "/data-structures/"
---

## Topic: Selection

### Sub-topic: Rule

Start from required operations. Do not pick a structure because it is familiar; pick it because it gives the needed cost profile.

## Topic: Complexity

### Sub-topic: Common Costs

| Structure | Typical Operation |
| --- | --- |
| Array index | O(1) |
| Hash lookup | O(1) average |
| Heap push/pop | O(log n) |
| Tree traversal | O(n) |
| Graph BFS/DFS | O(V + E) |

## Topic: Trade-offs

### Sub-topic: Interview Explanation

State both time and space. If using extra memory to reduce time, say so explicitly.
