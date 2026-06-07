---
layout: default
title: "Scalability and Performance"
page_type: deep-dive-post
subtitle: "Understand how systems grow, where bottlenecks appear, and how to reason about latency and throughput."
difficulty: Beginner
read_time: "10 min read"
---
# Scalability and Performance

Scalability is the ability to keep a system useful as traffic, data, users, and feature complexity grow.

<div class="section-tabs" aria-label="Scalability areas">
  <span class="is-active">Capacity</span>
  <span>Latency</span>
  <span>Bottlenecks</span>
  <span>Operations</span>
</div>

<div class="doc-callout">
  <strong>Scale the bottleneck, not the diagram.</strong>
  <p>Good scalability answers start with workload shape, identify the limiting resource, and then scale the tier that is actually under pressure.</p>
</div>

![Scalable architecture with clients, load balancer, stateless app tier, cache, primary database, read replicas, and async workers.](../assets/scalability-performance.png)

*Figure 1: Scalable architecture with traffic distribution, cache, database replicas, and asynchronous workers.*

## Topic: Topic Map

### Sub-topic: Section Directory

- Scaling strategy: decide when to scale up, scale out, cache, shard, or queue.
- Performance signals: track throughput, latency percentiles, errors, and saturation.
- Bottleneck analysis: find the resource that limits the whole request path.
- Scaling patterns: apply common app, data, cache, and async patterns.
- Operational playbook: measure, tune, protect, and degrade safely.

## Topic: Scaling Strategy

### Sub-topic: Vertical vs Horizontal Scaling

| Strategy | Best Fit | Limit |
| --- | --- | --- |
| Vertical scaling | Early systems, simple bottlenecks, single-node resource pressure | Hardware ceiling and single-node blast radius |
| Horizontal scaling | Growing traffic, availability needs, independent stateless workers | Coordination, routing, and data partition complexity |

Start vertically when it buys simplicity. Move horizontally when growth, fault isolation, or deployment safety matters.

### Sub-topic: Read, Write, and Storage Growth

Different growth shapes need different scaling moves:

- Read-heavy systems often benefit from cache and read replicas.
- Write-heavy systems usually need partitioning, batching, or async ingestion.
- Storage-heavy systems eventually need sharding, archival, compaction, or tiered storage.
- Burst-heavy systems need queues, rate limits, and backpressure.

## Topic: Performance Signals

### Sub-topic: Metrics To Track

| Signal | What It Tells You |
| --- | --- |
| Throughput | How much work the system completes per second |
| p95/p99 latency | What real users experience under load |
| Error rate | Whether the system is failing or shedding work |
| Saturation | Which resource is approaching its limit |
| Queue depth | Whether producers are outpacing consumers |

### Sub-topic: Latency Budget

Treat every request as a budget shared across services and dependencies.

| Component | Example Budget |
| --- | ---: |
| API gateway | 15 ms |
| Auth and validation | 20 ms |
| Business logic | 45 ms |
| Cache or database access | 90 ms |
| Serialization and network overhead | 30 ms |

If one dependency regularly exceeds budget, the whole request path becomes slow even when average latency looks healthy.

## Topic: Bottleneck Analysis

### Sub-topic: Common Bottlenecks

- CPU-bound compute hotspots.
- Slow database queries or missing indexes.
- Lock contention in shared resources.
- Cache misses causing thundering herd behavior.
- Synchronous fan-out to many downstream services.
- Large payloads or chatty service-to-service calls.

### Sub-topic: Queueing Intuition

As utilization approaches 100%, latency rises sharply. Keep critical services below full saturation and use admission control before queues grow without bound.

## Topic: Scaling Patterns

### Sub-topic: Application Tier

- Keep application nodes stateless where possible.
- Place instances behind load balancers.
- Autoscale on saturation, queue depth, or p95 latency.
- Use rolling or canary deployments to avoid capacity cliffs.

### Sub-topic: Data and Cache Tier

- Use cache-aside or read-through caching for hot reads.
- Add read replicas for read-heavy database workloads.
- Shard when one data node cannot handle storage, write load, or hot tenants.
- Move slow or bursty work to queues and workers.

### Sub-topic: Edge and Async Tier

- Use CDN for static assets and cacheable public responses.
- Use queues to absorb spikes and isolate slow dependencies.
- Use batch processing for expensive non-interactive work.
- Use backpressure so producers cannot overwhelm consumers.

## Topic: Operational Playbook

### Sub-topic: Tuning Loop

1. Measure baseline p95 and p99 latency.
2. Identify the top bottleneck from traces and metrics.
3. Change one thing at a time.
4. Re-measure under representative load.
5. Keep regression checks for latency-sensitive paths.

### Sub-topic: Overload Controls

- Rate-limit before downstream systems collapse.
- Fail fast when dependency timeout budgets are exceeded.
- Degrade non-critical features before core flows fail.
- Prefer bounded queues and retry budgets over infinite retries.

## Topic: Interview Framing

### Sub-topic: Answer Structure

1. Clarify users, QPS, peak multiplier, read/write ratio, and data growth.
2. Identify the first likely bottleneck.
3. Scale the application, cache, database, and async tiers separately.
4. Explain overload behavior and graceful degradation.
5. Mention metrics that prove the scaling plan is working.

### Sub-topic: Common Pitfalls

- Optimizing average latency while ignoring p99.
- Scaling app servers while the database remains single-node.
- Adding cache without explaining invalidation or stampede control.
- Ignoring backpressure for bursts.
