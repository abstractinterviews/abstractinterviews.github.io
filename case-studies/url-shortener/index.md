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

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | URL Shortener Design - Solution helps candidates discuss requirements discovery, API and data modeling, bottleneck analysis, and trade-off defense with clarity. |
| What to emphasize | Start with the problem it solves, then explain trade-offs, constraints, and production impact. |
| Senior signal | Connect the concept to scale, reliability, operability, cost, and team ownership. |
| Common trap | Giving a definition without explaining when the approach works, when it fails, and how to validate it. |

## Key Takeaways

- Define URL Shortener Design - Solution in one or two crisp sentences before expanding.
- Anchor the answer in constraints: scale, latency, consistency, correctness, cost, and maintainability.
- Compare at least one alternative and explain why it is weaker or stronger for the given scenario.
- Mention operational concerns such as monitoring, rollback, testing, ownership, and failure handling.
- Close with a practical rule of thumb that helps the interviewer see judgment, not memorization.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Clarify the prompt"] --> B["Define URL Shortener Design - Solution"]
    B --> C["Identify constraints"]
    C --> D["Choose an approach"]
    D --> E["Discuss trade-offs"]
    E --> F["Cover production concerns"]
    F --> G["Answer follow-ups"]
~~~

~~~mermaid
flowchart TD
    Problem["Problem or requirement"] --> Concept["URL Shortener Design - Solution"]
    Concept --> Benefits["Benefits"]
    Concept --> Tradeoffs["Trade-offs"]
    Concept --> FailureModes["Failure modes"]
    Concept --> Operations["Operational checks"]
    Benefits --> Decision["Interview recommendation"]
    Tradeoffs --> Decision
    FailureModes --> Decision
    Operations --> Decision
~~~

## Mental Models

| Mental Model | How To Use It In Interviews |
| --- | --- |
| Problem first | Explain what problem URL Shortener Design - Solution solves before naming tools or patterns. |
| Constraints shape design | A solution changes when throughput, latency, consistency, team size, or compliance changes. |
| Trade-off triangle | Balance correctness, complexity, and cost rather than claiming one perfect answer. |
| Failure-first thinking | Ask what breaks, how it is detected, and how the system recovers. |
| Evolution path | Describe a simple baseline, then evolve it as scale and requirements increase. |

Treat the case as a sequence: clarify goals, define scale, design the baseline, identify bottlenecks, then evolve the architecture.

## Real World Examples

| Scenario | How URL Shortener Design - Solution Shows Up |
| --- | --- |
| Startup MVP | Choose the simplest implementation that validates the product without hiding future migration paths. |
| High-scale platform | Focus on bottlenecks, partitioning, caching, queues, rate limits, and operational dashboards. |
| Enterprise environment | Discuss compliance, auditability, access control, data retention, and change management. |
| Incident review | Tie the concept to detection, mitigation, rollback, and prevention. |

Use it to rehearse a complete interview narrative from problem statement to production-ready design.

## Interview Perspective

| Interviewer Probe | Strong Candidate Response |
| --- | --- |
| Why this approach? | State the requirement that makes it appropriate and name the trade-off it accepts. |
| What can go wrong? | Cover overload, stale data, race conditions, partial failure, poor observability, or unclear ownership. |
| How would you scale it? | Move from single-node assumptions to partitioning, replication, caching, async processing, or sharding. |
| How would you validate it? | Use tests, metrics, load tests, shadow traffic, canaries, and post-launch review. |

A strong answer is structured as: **definition -> constraints -> design choice -> trade-offs -> failure modes -> production plan**.

## Common Mistakes

- Jumping into implementation before clarifying goals and constraints.
- Treating the topic as a memorized definition instead of a decision tool.
- Ignoring edge cases, failure modes, and degraded behavior.
- Over-engineering the first version without explaining why complexity is justified.
- Forgetting security, observability, data retention, cost, or team ownership.
- Failing to compare alternatives when the interviewer asks for trade-offs.

## Follow-up Questions

1. When would you choose this approach over a simpler alternative?
2. What constraints would make this design break down?
3. How would you measure whether the solution is working?
4. What would you change for 10x traffic, 10x data volume, or stricter latency?
5. How would you explain the trade-off to a product manager or engineering leader?
6. What is the rollback plan if the approach causes production issues?
7. Which parts should be automated, monitored, or tested first?

## Production Insights

| Concern | Production Guidance |
| --- | --- |
| Observability | Track golden signals, business metrics, saturation, errors, and user-visible impact. |
| Reliability | Define SLOs, fallback behavior, retry limits, backpressure, and disaster recovery strategy. |
| Security | Validate inputs, enforce least privilege, protect sensitive data, and audit access. |
| Cost | Estimate compute, storage, bandwidth, operational overhead, and migration cost. |
| Maintainability | Keep ownership clear, document assumptions, and design for incremental change. |

Real systems need staged rollouts, SLOs, capacity planning, abuse protection, data retention, and operational runbooks.

## Cheat Sheet

| Question | Quick Answer |
| --- | --- |
| What is it? | A concept or technique used to solve a specific engineering or interview problem. |
| Why does it matter? | It gives structure to decisions and helps explain trade-offs under constraints. |
| What should I mention? | Requirements, alternatives, complexity, failure modes, and production readiness. |
| What should I avoid? | Vague definitions, one-size-fits-all claims, and ignoring operational reality. |
| How do I sound senior? | Discuss when the approach should not be used and how it evolves over time. |

## Flashcards

| Front | Back |
| --- | --- |
| What problem does URL Shortener Design - Solution solve? | It helps structure a decision around requirements, constraints, trade-offs, and production impact. |
| What is the first interview step? | Clarify the prompt, success criteria, scale, and constraints before designing. |
| What makes an answer senior-level? | Clear trade-offs, realistic failure handling, operational awareness, and pragmatic sequencing. |
| What is a common failure mode? | Applying the concept mechanically without checking whether the constraints justify it. |
| How should you conclude? | Summarize the recommendation, key trade-off, and validation plan. |

## Related Topics

- [Interview Readiness]({{ '/interview/' | relative_url }})
- [System Design Patterns]({{ '/50-system-design-patterns/' | relative_url }})
- [Software Architecture]({{ '/architecture/' | relative_url }})
- [Coding Round]({{ '/coding-round/' | relative_url }})
- [Data Structures]({{ '/data-structures/' | relative_url }})

## Practice Questions

1. Explain URL Shortener Design - Solution to an interviewer in 90 seconds.
2. Draw a diagram showing where this concept fits in a real system.
3. Compare this approach with one alternative and defend your choice.
4. Identify two bottlenecks and two failure modes.
5. Describe how you would test, monitor, and roll out this solution.
6. Re-answer the same question for a small startup and for a large enterprise.

Rebuild the design from a blank page, then defend two alternatives and one rejected option.

## Revision Notes

- Start with the problem, not the terminology.
- Use a diagram to make the flow, ownership, or trade-off visible.
- Name constraints explicitly: scale, latency, consistency, correctness, cost, and operability.
- Discuss at least one alternative and one failure mode.
- End with validation: metrics, tests, rollout plan, and rollback strategy.
- Final interview move: summarize the recommendation in one sentence and state the key trade-off.

<!-- interview-module:end -->
