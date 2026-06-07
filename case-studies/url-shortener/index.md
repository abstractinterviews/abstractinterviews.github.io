---
layout: default
title: "URL Shortener Design - Solution"
page_type: solution
solution_id: url_shortener
subtitle: "Design a URL shortening service like bit.ly."
difficulty: Medium
active_tab: overview
---

# URL Shortener Design - Solution

Design a URL shortening service like bit.ly.

## Overview

Split the service into a low-volume write path for creating short URLs and a high-volume read path for redirects. Keep redirect latency low by caching hot mappings and sending analytics events asynchronously.

### Primary Goal

Resolve short codes to long URLs with very low latency and high availability.

### Scale Focus

Redirect traffic dominates writes, so optimize the read path first.

### Source of Truth

The database owns URL mappings; cache and edge layers accelerate access.

### Async Work

Analytics, abuse checks, and reporting should not block redirects.

## High Level Design

The system has two main paths. The create path validates and stores mappings. The redirect path checks cache first, falls back to the database, and emits analytics asynchronously.

### Components

- Client
- CDN / Edge
- Load Balancer
- API Servers
- Redis Cache
- Mapping DB
- Event Stream
- Analytics Store

### Notes

- Use CDN or edge caching for highly popular short links.
- Keep API servers stateless behind the load balancer.
- Use cache-aside for redirect lookups.
- Emit click events to a stream after returning the redirect.

## Detailed Design

### 1. Write Path (Shorten URL)

This is the flow when a user creates a short URL.

#### Participants

- User
- Load Balancer
- API Servers
- Database (Write)
- Cache

#### Flow Steps

| Step | From | To | End | Label |
| --- | --- | --- | --- | --- |
| 1 | 1 | 2 | 3 | POST /api/shorten { long_url } |
| 2 | 2 | 3 | 4 | Forward request |
| 3 | 3 | 4 | 5 | Generate short code and check uniqueness |
| 4 | 3 | 4 | 5 | Write mapping (short_code, long_url) |
| 5 | 4 | 3 | 5 | Success |
| 6 | 4 | 5 | 6 | Invalidate cache for short_code |
| 7 | 2 | 1 | 3 | Return short URL |

#### Step Table

| Step | Description |
| --- | --- |
| 1 | User sends a request to shorten a long URL. |
| 2 | Load balancer forwards the request to an API server. |
| 3 | API generates a short code and checks uniqueness in cache or DB. |
| 4 | Mapping is stored in the database. |
| 5 | DB write succeeds. |
| 6 | Cache entry for the short code is invalidated to avoid stale reads. |
| 7 | API returns the short URL to the user. |

#### Key Points

- Short code should be unique.
- Use Base62 encoding for compact short codes.
- Cache is updated lazily on read.
- DB is the source of truth.

#### Tech Choices

- Language: Go / Java / Python
- DB: DynamoDB / Cassandra / PostgreSQL
- Cache: Redis
- ID Generation: Snowflake / Redis INCR / UUID + Base62

### 2. Read Path (Redirect URL)

This is the low-latency path used when a short URL is visited.

### 3. Key Components

API servers, code generator, mapping database, Redis cache, rate limiter, and async analytics pipeline.

### 4. Data Model

Store short code mappings by primary key and index ownership, expiration, and analytics metadata separately.

## Trade-offs

| Choice | Benefit | Cost |
| --- | --- | --- |
| Short custom aliases | Human-friendly and memorable links. | Requires reservation checks, abuse prevention, and collision handling. |
| Random code generation | Harder to enumerate. | Needs collision retries and careful entropy sizing. |
| Base62 from unique IDs | Compact, deterministic, and collision-free. | Sequential IDs can be predictable unless obscured. |
| 301 redirects | Better browser and CDN caching. | Harder to change destination later. |
| Async analytics | Keeps redirect latency low. | Counters become eventually consistent. |

## Code (Optional)

A minimal create endpoint validates input, generates a code, stores the mapping, and returns the public short URL.

```python
def create_short_url(long_url, custom_alias=None):
    validate_url(long_url)
    code = custom_alias or base62(generate_unique_id())

    if mapping_store.exists(code):
        raise AliasAlreadyTaken(code)

    mapping_store.put({
        "code": code,
        "long_url": long_url,
        "status": "active"
    })
    cache.delete(code)
    return f"https://sho.rt/{code}"
```
