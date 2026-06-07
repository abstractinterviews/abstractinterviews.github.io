---
layout: default
title: "Consistent Hashing"
date: 2026-06-07
category: Patterns
---

Place servers and keys on a hash ring so adding/removing nodes moves only nearby keys, minimizing reshuffling.

When to use:
- Distributed caches and storage where node membership frequently changes.

Trade-offs:
- More complex than simple modulo hashing; may require virtual nodes to avoid uneven distribution.

Related: /50-system-design-patterns/

## Example
- Example: A distributed cache where keys are placed on a hash ring; adding a cache node only reassigns nearby keys.

## Diagram
```mermaid
graph LR
	subgraph Ring
		NodeA((A))
		NodeB((B))
		NodeC((C))
	end
	Key1["key1"] --> NodeB
	Key2["key2"] --> NodeC
```
