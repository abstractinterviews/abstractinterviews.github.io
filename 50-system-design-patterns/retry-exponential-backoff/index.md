---
layout: default
title: "Retry with Exponential Backoff"
date: 2026-06-07
category: Patterns
---

Retry failed requests with increasing delays and jitter to avoid synchronized retry storms.

When to use:
- Transient network errors or temporarily overloaded services.

Trade-offs:
- Retries can amplify load; must cap attempts and add jitter to avoid thundering herds.

Related: /50-system-design-patterns/

## Example
- Example: A client retrying a failed HTTP request with delays of 100ms, 200ms, 400ms and jitter until success or max attempts.

## Diagram
```mermaid
sequenceDiagram
	Client->>Service: request
	Service--xClient: error
	Client->>Client: wait(100ms)
	Client->>Service: retry
```
