---
layout: default
title: "Database Connection Pooling"
date: 2026-06-07
category: Patterns
---

Reuse a pool of database connections so requests borrow and return connections instead of opening new ones per request.

When to use:
- Any application talking to a DB under load to avoid expensive connection creation.

Trade-offs:
- Pool sizing must be tuned; too small causes waiting, too large overwhelms the database.

Related: /50-system-design-patterns/

## Example
- Example: A web app uses HikariCP to maintain a pool of 50 DB connections shared across requests.

## Diagram
```mermaid
flowchart LR
  Request --> Pool[Connection Pool]
  Pool --> DB[Database]
```
