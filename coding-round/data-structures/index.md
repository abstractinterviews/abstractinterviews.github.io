---
layout: default
title: "Coding Data Structures"
page_type: data-structure-overview
track: "Data Structures"
subtitle: "Interview-ready guides for the concrete data structures behind arrays, hashing, stacks, queues, heaps, trees, graphs, tries, and range-query structures."
read_time: "10 min read"
difficulty: "Interview Track"
practice_count: 13
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Introduction

Coding data structures are the operational tools behind interview patterns. Study them by the operation they optimize, the invariant that keeps that operation cheap, and the worst case that can break the assumption.

## Topics

### Arrays

Index-based storage for ordered data, prefix scans, in-place updates, and cache-friendly iteration.

Best when the prompt mentions indexes, order, windows, prefixes, or in-place mutation.

URL: /coding-round/data-structures/arrays/

### Hash Tables

Key-based lookup for membership, counting, grouping, and index acceleration.

Best when the prompt needs fast lookup, deduplication, grouping, or frequency counts.

URL: /coding-round/data-structures/hash-tables/

### Linked Lists

Pointer-based sequences for node manipulation, cycle detection, and constant-time splicing.

Best when the prompt is about node references, cycles, reversal, or merging sorted linked lists.

URL: /coding-round/data-structures/linked-lists/

### Stacks

Last-in-first-out state for matching, backtracking, monotonic scans, and undo-style reasoning.

Best when nested state, previous unresolved values, or next greater/smaller relationships appear.

URL: /coding-round/data-structures/stacks/

### Queues

First-in-first-out state for breadth-first traversal, buffering, and level-by-level processing.

Best when the prompt asks for nearest steps, levels, fairness, or frontier expansion.

URL: /coding-round/data-structures/queues/

### Heaps

Priority-first access for top-k, scheduling, streaming medians, and best-first search.

Best when you repeatedly need the current minimum, maximum, or top-k candidates.

URL: /coding-round/data-structures/heaps/

### Trees

Hierarchical data for recursion, subtree aggregation, search boundaries, and parent-child reasoning.

Best when each node can ask its children for information and combine the result.

URL: /coding-round/data-structures/trees/

### Binary Search Trees

Ordered binary trees for search, range queries, predecessor/successor, and sorted traversal.

Best when the tree ordering invariant lets you prune half the search space.

URL: /coding-round/data-structures/bst/

### Graphs

Nodes and edges for dependencies, connectivity, shortest paths, and reachability.

Best when entities are connected by relationships, prerequisites, paths, or components.

URL: /coding-round/data-structures/graphs/

### Trie

Prefix tree for autocomplete, dictionary lookup, word search, and prefix constraints.

Best when prefixes, dictionaries, autocomplete, or word-board pruning matters.

URL: /coding-round/data-structures/trie/

### Segment Trees

Range-query trees for dynamic sums, minimums, maximums, and interval aggregation.

Best when an array changes and you still need fast range queries.

URL: /coding-round/data-structures/segment-trees/

### Fenwick Trees

Compact binary indexed trees for prefix sums, point updates, and frequency ranking.

Best when you need prefix aggregates with point updates and a lighter structure than a segment tree.

URL: /coding-round/data-structures/fenwick-trees/

### Disjoint Set

Union-find structure for connectivity, components, cycles, and grouping.

Best when the prompt asks whether items belong to the same connected component.

URL: /coding-round/data-structures/disjoint-set/

## How to Study

### Operation first

Ask what operation the prompt needs most often: lookup, append, delete, range query, priority, traversal, or connectivity.

### Invariant second

Name what remains true after every step. The invariant is what makes the complexity claim believable.

### Pattern third

Map the structure to a pattern only after the operation and invariant are clear.

## Quick Summary

### Study Order

- Arrays and Hash Tables
- Stacks, Queues, and Heaps
- Trees and Graphs
- Trie, Segment Tree, Fenwick Tree, Disjoint Set

### Interview Move

- State brute force
- Identify the repeated work
- Choose the structure that removes it
- Explain edge cases and worst-case behavior

## Related Topics

- [Main Data Structures Overview](/data-structures/)
- [Arrays & Hashing](/data-structures/arrays-hashing/)
- [Stacks, Queues, and Heaps](/data-structures/stacks-queues-heaps/)
- [Trees and Graphs](/data-structures/trees-graphs/)
- [Selection and Complexity](/data-structures/selection-complexity/)
