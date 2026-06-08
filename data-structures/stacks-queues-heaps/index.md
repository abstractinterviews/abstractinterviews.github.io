---
layout: default
title: "Stacks, Queues, and Heaps"
page_type: deep-dive-post
subtitle: "Ordered processing structures for parsing, traversal, and priority."
read_time: "9 min read"
difficulty: Core
post_tabs:
  - label: Stack
    href: "#stack"
  - label: Queue
    href: "#queue"
  - label: Heap
    href: "#heap"
toc:
  - label: "Stack"
    href: "#stack"
  - label: "Queue"
    href: "#queue"
  - label: "Heap"
    href: "#heap"
previous_topic:
  title: "Arrays and Hashing"
  url: "/data-structures/arrays-hashing/"
next_topic:
  title: "Trees and Graphs"
  url: "/data-structures/trees-graphs/"
---

## Topic: Stack

### Sub-topic: Use Cases

Use stacks for nested state, parsing, undo, DFS, and monotonic problems.

### Sub-topic: Stack Patterns

| Pattern | Example |
| --- | --- |
| Matching | Valid parentheses |
| Monotonic stack | Next greater element |
| DFS | Tree or graph traversal |
| State history | Undo operations |

### Sub-topic: Monotonic Stack

A monotonic stack maintains increasing or decreasing order. When a new item violates the order, pop items and resolve their answer. This is useful when each element needs the next greater or smaller element.

## Topic: Queue

### Sub-topic: Use Cases

Use queues for BFS, scheduling, producer-consumer flows, and level-order traversal.

### Sub-topic: Queue Patterns

- BFS shortest path in unweighted graphs.
- Level-order traversal in trees.
- Task scheduling.
- Sliding window with deque.

### Sub-topic: Deque

A deque supports insertion and deletion at both ends. It is useful for sliding window maximum because outdated elements leave from the front and weaker candidates are removed from the back.

## Topic: Heap

### Sub-topic: Use Cases

Use heaps for top-k, priority scheduling, merging sorted streams, and shortest path variants.

### Sub-topic: Heap Patterns

| Problem | Heap Use |
| --- | --- |
| Top k frequent | Keep best k candidates |
| Merge k sorted lists | Always pull smallest head |
| Meeting rooms | Track earliest ending meeting |
| Dijkstra | Expand lowest-distance node |

### Sub-topic: Gotchas

- Heaps do not support efficient arbitrary deletion unless you add lazy deletion.
- Comparator mistakes are common.
- In many languages, max-heap requires negating values or custom ordering.
