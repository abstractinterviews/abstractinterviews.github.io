---
layout: default
title: "Cache Aside Pattern"
page_type: deep-dive-post
subtitle: "The most widely used caching pattern in system design."
difficulty: Intermediate
read_time: "8 min read"
post_tabs:
  - label: Overview
    href: "#what-is-cache-aside"
  - label: Flow
    href: "#flow-overview"
  - label: Code
    href: "#code"
  - label: Use Cases
    href: "#when-to-use"
  - label: Pros & Cons
    href: "#pros-and-cons"
  - label: Gotchas
    href: "#gotchas"
toc:
  - label: "What is Cache Aside?"
    href: "#what-is-cache-aside"
  - label: "Flow Overview"
    href: "#flow-overview"
  - label: "Sequence Diagram"
    href: "#sequence-diagram"
  - label: "Read Flow"
    href: "#read-flow"
  - label: "Write Flow"
    href: "#write-flow"
  - label: "Pros & Cons"
    href: "#pros-and-cons"
  - label: "When to Use"
    href: "#when-to-use"
  - label: "Gotchas"
    href: "#gotchas"
previous_topic:
  title: "Read Through"
  url: "/components/caching/"
next_topic:
  title: "Write Through"
  url: "/components/caching/"
---

## What is Cache Aside?

In Cache Aside, the application is responsible for managing the cache. It first checks the cache. If the key is missing, it reads from the database, stores the result in cache, and returns data to the caller.

> Most commonly used pattern due to its simplicity and flexibility.

## Flow Overview

1. Check cache for the requested key.
2. On cache miss, read from the database.
3. Store the database result in cache.
4. Return data to the application.
5. Future requests are served from cache until expiry or invalidation.

## Sequence Diagram

```mermaid
sequenceDiagram
    participant User
    participant App as Application
    participant Cache as Cache (Redis)
    participant DB as Database

    User->>App: 1. Get data(key)
    App->>Cache: 2. Check key
    alt Hit
      Cache-->>App: 3. Data
      App-->>User: 4. Return data
    else Miss
      Cache-->>App: Miss
      App->>DB: 5. Read from DB
      DB-->>App: 6. Data
      App->>Cache: 7. Set key/value
      App-->>User: 8. Return data
    end
```

> On cache hit, data is returned immediately. On miss, DB is queried and cache is updated.

## Read Flow

```python
def get_user(user_id):
    key = f"user:{user_id}"
    cached = redis.get(key)
    if cached:
        return cached

    user = database.get_user(user_id)
    redis.setex(key, ttl=300, value=user)
    return user
```

## Write Flow

For writes, update the database first and then invalidate the cache entry. The next read repopulates the cache with fresh data.

```python
def update_user(user_id, patch):
    database.update_user(user_id, patch)
    redis.delete(f"user:{user_id}")
```

## Pros and Cons

| Pros | Cons |
| --- | --- |
| Simple to implement | First request after miss is slower |
| Works with any database | Data can become stale |
| Cache failures can degrade gracefully | Duplicate cache-fill logic can spread |
| Good for read-heavy data | Hot keys may cause stampedes |

## When to Use

- Read-heavy workloads
- Data can tolerate brief staleness
- Cache is an optimization, not the source of truth
- Application needs explicit control over cache behavior

## Gotchas

- Add TTL jitter to avoid synchronized expiry.
- Use request coalescing for hot keys.
- Protect the database when cache is unavailable.
- Keep cached objects small and bounded.
- Monitor hit ratio, miss latency, and eviction rate.

