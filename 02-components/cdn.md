---
layout: default
title: "CDN and Edge Computing"
---

# CDN and Edge Computing

CDNs move content closer to users by caching at edge locations, reducing latency and origin load.

## 1. CDN Basics

![CDN Architecture](./assets/cdn-architecture.png)


- User requests content.
- Edge node serves cached response if available.
- On miss, edge fetches from origin and caches it.

Benefits:

- Lower latency
- Reduced origin bandwidth and CPU load
- Better resilience under traffic spikes

## 2. What to Cache at Edge

- Static assets (images, CSS, JS)
- Public API responses with safe cache-control headers
- Video and large media files
- Generated pages when personalization is limited

## 3. Cache-Control Patterns

- `Cache-Control: public, max-age=...`
- `s-maxage` for shared caches
- `stale-while-revalidate`
- `ETag` and `Last-Modified` validation

Correct headers are as important as CDN choice.

## 4. Purge and Invalidation

- TTL expiry
- Path-based purge
- Tag-based purge
- Versioned asset names (content hashing)

Prefer versioned static assets to avoid broad cache purges.

## 5. Edge Compute Use Cases

- Redirects and URL rewrites
- Header normalization
- Bot filtering and basic security checks
- Geo-based routing
- Lightweight personalization

Avoid heavy business logic at edge unless platform constraints are clear.

## 6. Failure Modes

- Stale content due to missing invalidation
- Cache poisoning from incorrect keys
- Origin overload during cache misses
- Region-specific edge outages

Mitigations:

- Strong cache-key policy
- Origin shielding
- Tiered caching
- Rate limits and WAF integration

## 7. Interview Framing

1. State which responses are edge-cacheable.
2. Define cache keys and TTL policy.
3. Explain purge strategy.
4. Explain fallback when edge miss or edge outage occurs.
5. Mention metrics: edge hit ratio, origin offload, latency by region.

