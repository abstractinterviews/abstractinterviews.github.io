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

### Sub-topic: Selection Matrix

| Requirement | Candidate Structure | Reason |
| --- | --- | --- |
| Lookup by ID | Hash map | O(1) average lookup |
| Maintain sorted order | Balanced tree or sorted list | Ordered traversal |
| Repeated min/max | Heap | O(log n) push/pop |
| Process first-in first-out | Queue | Preserves arrival order |
| Undo or nested parsing | Stack | Last-in first-out |
| Relationships | Graph | Models edges between entities |

### Sub-topic: Hidden Constraint

Memory can change the right answer. A hash map may reduce time but increase space. For very large inputs, streaming or sorting may be more appropriate than storing everything.

## Topic: Complexity

### Sub-topic: Common Costs

| Structure | Typical Operation |
| --- | --- |
| Array index | O(1) |
| Hash lookup | O(1) average |
| Heap push/pop | O(log n) |
| Tree traversal | O(n) |
| Graph BFS/DFS | O(V + E) |

### Sub-topic: Complexity Language

Use variables precisely:

- `n`: number of items.
- `k`: number of unique items or requested top results.
- `V`: graph vertices.
- `E`: graph edges.
- `m`: length of a string or secondary input.

If a solution sorts and then scans, say O(n log n) time and O(1) or O(n) extra space depending on the sort and data copied.

## Topic: Trade-offs

### Sub-topic: Interview Explanation

State both time and space. If using extra memory to reduce time, say so explicitly.

### Sub-topic: Example Explanations

- "I use a hash map, which changes lookup from O(n) to O(1) average, at the cost of O(n) space."
- "I sort first, so time becomes O(n log n), but then the two-pointer scan is linear."
- "I use a heap of size k, so each update costs O(log k), which is better than sorting all n items if k is small."
- "I use BFS because the graph is unweighted and we need the shortest number of steps."

### Sub-topic: Final Checklist

Before finishing a coding solution, state:

1. Why this structure fits.
2. Time complexity.
3. Space complexity.
4. Edge cases covered.
5. Any assumptions about input size or value range.
