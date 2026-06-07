---
layout: default
title: "Dead Letter Queue (DLQ)"
date: 2026-06-07
category: Patterns
---

Send messages that repeatedly fail processing to a separate queue for inspection and replay.

When to use:
- Message-driven systems to prevent a single bad message from blocking the queue.

Trade-offs:
- Requires monitoring and remediation; DLQ can accumulate unless handled.

Related: /50-system-design-patterns/

## Example
- Example: Messages failing after N retries are moved to a `dead-letter` queue for manual inspection and replay.

## Diagram
```mermaid
flowchart LR
	Queue --> Worker
	Worker --x Failed
	Worker --> DLQ[Dead Letter Queue]
```
