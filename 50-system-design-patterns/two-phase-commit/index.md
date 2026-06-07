---
layout: default
title: "Two-Phase Commit (2PC)"
date: 2026-06-07
category: Patterns
---

A coordinator asks participants to prepare and then commit or abort so distributed participants achieve atomic commits.

When to use:
- Strong atomicity requirements across multiple systems (financial transfers between banks).

Trade-offs:
- Blocking protocol, slow, and does not scale well to many participants.

Related: /50-system-design-patterns/

## Example
- Example: A coordinator manages a transfer between two banking systems by preparing both sides and then committing atomically.

## Diagram
```mermaid
sequenceDiagram
  Coordinator->>Participant1: canCommit?
  Coordinator->>Participant2: canCommit?
  Coordinator->>Participant1: commit
  Coordinator->>Participant2: commit
```
