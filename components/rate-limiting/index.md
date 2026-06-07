---
layout: default
title: "Rate Limiting"
page_type: deep-dive-post
subtitle: "Protect services from overload, abuse, and noisy-neighbor traffic."
difficulty: Intermediate
read_time: "9 min read"
---

# Rate Limiting

Rate limiting protects services from abuse, overload, and noisy neighbors by controlling request volume.

## Topic: Why Rate Limit

### Sub-topic: Motivation

- Prevent denial-of-service and brute-force behavior
- Protect expensive dependencies
- Enforce fair usage across clients
- Stabilize system under bursty demand

## Topic: Common Algorithms

### Sub-topic: Options and Selection

![Rate limiting architecture with API gateway, token bucket limiter, Redis counters, and 429 responses.](../assets/rate-limiting-architecture.png)

*Figure 1: Distributed Rate Limiting Architecture*

## Topic: Fixed window counter

### Sub-topic: Key Idea

- Count requests in fixed intervals.
- Simple but bursty at window boundaries.

## Topic: Sliding window log

### Sub-topic: Key Idea

- Track timestamped requests.
- Accurate but memory heavy.

## Topic: Sliding window counter

### Sub-topic: Key Idea

- Approximate sliding behavior with lower overhead.

## Topic: Token bucket

### Sub-topic: Key Idea

- Tokens refill at fixed rate; requests consume tokens.
- Supports controlled bursts.

## Topic: Leaky bucket

### Sub-topic: Key Idea

- Smooths request outflow at steady pace.

Token bucket is often a practical default.

## Topic: Scope and Keys

### Sub-topic: Key Idea

Limits can be applied per:

- API key
- User ID
- IP address
- Tenant
- Endpoint

Use hierarchical limits for better control (global + per-tenant + per-user).

## Topic: Distributed Rate Limiting

### Sub-topic: Key Idea

In multi-instance systems, counters must be shared.

Typical approach:

- Redis + Lua scripts for atomic counter updates
- Low-latency in-memory local fallback where strictness is relaxed

## Topic: Response Contract

### Sub-topic: Implementation Detail

When rejecting requests:

- Return HTTP 429
- Include `Retry-After`
- Include limit headers if needed

Example headers:

- `X-RateLimit-Limit`
- `X-RateLimit-Remaining`
- `X-RateLimit-Reset`

## Topic: Failure Modes

### Sub-topic: Failure Awareness

- Clock skew affecting windows
- Redis outage causing open/closed failure debate
- Overly strict limits harming valid users
- No differentiation between read and write endpoints

Choose fail-open vs fail-closed based on endpoint criticality.

## Topic: Interview Framing

### Sub-topic: Answer Structure

1. Define what is being protected.
2. Choose algorithm and explain why.
3. Define key scope and limit tiers.
4. Explain distributed counter consistency.
5. Explain behavior on limiter dependency failure.

