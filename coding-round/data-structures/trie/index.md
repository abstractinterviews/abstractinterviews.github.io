---
layout: default
title: "Trie"
page_type: data-structure-topic
track: "Data Structures"
subtitle: "Prefix tree for autocomplete, dictionary lookup, word search, and prefix constraints."
read_time: "12 min read"
difficulty: "Intermediate"
practice_count: 20
previous_topic:
  title: "Graphs"
  url: "/coding-round/data-structures/graphs/"
next_topic:
  title: "Segment Trees"
  url: "/coding-round/data-structures/segment-trees/"
date: 2026-06-08
slug: index
categories: [interview-prep]
---

## Theory

### What it is

Prefix tree for autocomplete, dictionary lookup, word search, and prefix constraints.

### Why candidates need it

Tries make prefix queries depend on word length rather than total dictionary size.

### Production reality

The interview version is small, but the same choice affects memory layout, runtime constants, worst-case behavior, and language-specific implementation details at scale.

### Senior gotcha

A prefix existing is not the same as a word existing. Track terminal markers separately.

## Mental Model

### One character per edge

Name the invariant before coding.

### Shared prefixes save repeated comparison

Tie the invariant to the operation cost.

### Terminal flag decides word membership

Test the boundary where the invariant can break.

## Practice

### Example 1: Implement Trie

Support insert, search, and startsWith.

Input: `insert("apple")`, `search("app")`

Output: `false`, then prefix is `true`

Explanation: Prefix and full-word checks are different.

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_word = False

class Trie:
    def __init__(self):
        self.root = TrieNode()
    def insert(self, word):
        node = self.root
        for ch in word:
            node = node.children.setdefault(ch, TrieNode())
        node.is_word = True
```

Time: O(k)

Space: O(total characters)

### Example 2: Word Search Pruning

Use a trie to stop impossible DFS paths early.

Input: `board`, `words`

Output: `found words`

Explanation: Stop exploring when the path is not a dictionary prefix.

```python
def should_continue(trie_node, char):
    return char in trie_node.children
```

Time: Depends on pruning

Space: O(total characters)

## Common Patterns

### Prefix Lookup

Check if any word starts with text.

### Dictionary Pruning

Stop DFS when no prefix matches.

### Autocomplete

Collect words below prefix.

### Bitwise Trie

Optimize XOR queries.

## Complexity

| Operation | Complexity | Why |
| --- | --- | --- |
| Insert | O(k) | Word length |
| Search | O(k) | Walk characters |
| Prefix query | O(k) | No full scan |
| Autocomplete | O(k + output) | Find then collect |
| Space | O(total chars) | Node overhead |

## Practice Problems

### Easy

- Implement Trie
- Longest Prefix
- Add/Search Words

### Medium

- Word Search II
- Replace Words
- Map Sum Pairs

### Hard

- Max XOR
- Palindrome Pairs
- Stream Checker

## Key Takeaways

- Choose Trie because its operation model fits the prompt, not because the name sounds familiar.
- Explain the invariant and the complexity together.
- Mention memory overhead, worst-case behavior, and language pitfalls when they matter.
- Connect the structure to a known pattern before writing code.

## Quick Summary

### Core Use

- Trie
- Prefix tree for autocomplete, dictionary lookup, word search, and prefix constraints.

### Interview Move

- Start with brute force
- Name the bottleneck
- Choose the structure that removes it

### Production Lens

- Watch memory overhead
- Know worst-case behavior
- Validate assumptions with constraints

## Related Topics

- [Trees and Graphs](/data-structures/trees-graphs/#trees)
- [DFS](/coding-round/patterns/dfs/)
- [Backtracking](/coding-round/patterns/backtracking/)
- [Graphs](/coding-round/data-structures/graphs/)
