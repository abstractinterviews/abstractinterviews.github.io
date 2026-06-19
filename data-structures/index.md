---
layout: default
title: "Data Structures"
kind: track
renderer: app
track: data-structures
description: "Learn the most important data structures, their operations, implementations, and real-world applications."
hero:
  visual: data-structures
tags: [coding-interviews, fundamentals]
date: 2026-06-08
slug: index
categories: [interview-prep]
difficulty: Intermediate
reading_time: 5
---

## Introduction

Data structures are the tools that make algorithms efficient. Interview performance depends on choosing the right structure, explaining the invariant, and naming the cost of each operation.

The overview page is a list surface. It can render CTA cards because its job is navigation. Individual article pages remain single-page markdown articles.

## Topics

### Arrays & Hashing

Arrays, strings, hash maps, sets, and frequency tables.

Best when you need indexed access, fast membership checks, counting, grouping, or deduplication.

URL: /data-structures/arrays-hashing/

### Stacks, Queues, and Heaps

Ordered processing, monotonic structures, priority queues, and scheduling.

Best when the prompt mentions nested state, FIFO/LIFO behavior, next greater element, top-k, or priority.

URL: /data-structures/stacks-queues-heaps/

### Trees and Graphs

Hierarchies, traversal, dependencies, reachability, and relationships.

Best when data is connected by parent-child links, edges, dependencies, or paths.

URL: /data-structures/trees-graphs/

### Selection and Complexity

How to choose quickly and explain time-space trade-offs.

Best when you need a concise decision framework for picking the right structure under interview constraints.

URL: /data-structures/selection-complexity/

## Selection Questions

- Do I need fast lookup by key?
- Do I need sorted order?
- Do I need to process items by insertion order?
- Do I need to repeatedly access min or max?
- Do I need to model dependencies or reachability?
- Do I need to preserve a moving window?

## Complexity Baseline

| Structure | Lookup | Insert | Delete | Notes |
| --- | --- | --- | --- | --- |
| Array | O(1) by index | O(n) middle | O(n) middle | Great for scanning and indexed access |
| Hash map | O(1) average | O(1) average | O(1) average | Great for lookup and counting |
| Stack | O(n) search | O(1) push | O(1) pop | LIFO order |
| Queue | O(n) search | O(1) enqueue | O(1) dequeue | FIFO order |
| Heap | O(n) search | O(log n) | O(log n) pop | Fast min/max priority |
| Tree | O(log n) if balanced | O(log n) | O(log n) | Maintains order |
| Graph | Depends | Depends | Depends | Models nodes and edges |

## Interview Rule

When you choose a structure, state why it fits the dominant operation and what time-space cost it creates.
