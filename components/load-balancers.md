---
layout: default
title: "Load Balancers"
page_type: deep-dive-post
subtitle: "Distribute traffic across healthy backends for availability, scale, and smooth deployments."
difficulty: Intermediate
read_time: "10 min read"
---

# Load Balancers

Load balancers distribute traffic across backend instances to improve availability, utilization, and scalability.

## Topic: Traffic Distribution Strategy

### Sub-topic: Capacity and Availability Goals

Before choosing an algorithm, define expected steady-state load, burst multiplier, and failover behavior. A load balancer is not just traffic plumbing; it is the control point for resilience and controlled rollout.

## 1. Why Load Balancers Matter

- Remove single-server bottlenecks
- Improve resilience by routing around unhealthy nodes
- Enable horizontal scaling
- Support zero-downtime deployments

## 2. L4 vs L7

### Sub-topic: Decision Matrix

| Requirement | L4 | L7 |
| --- | --- | --- |
| Lowest overhead | Strong fit | Moderate overhead |
| Path/header routing | Limited | Strong fit |
| Auth and policy hooks | Minimal | Rich support |
| Session-aware routing | Limited | Strong support |

## Layer 4 (transport level)

- Routes based on IP and port
- Fast and simple
- Limited request-aware routing

## Layer 7 (application level)

- Routes by URL path, host, headers, cookies
- Supports advanced policies: auth, canary, sticky sessions
- More CPU overhead than L4

![Load balancing architecture showing L7 traffic distribution, health checks, and failover.](./assets/load-balancing-architecture.png)

*Figure 1: Load Balancing Architecture*

## 3. Common Routing Algorithms

### Sub-topic: Algorithm Selection Heuristics

- Round robin for homogeneous backends.
- Least connections for uneven request duration.
- Hash-based routing when stickiness is required.

- Round robin
- Weighted round robin
- Least connections
- Least response time
- Hash-based (for stickiness)

Choose based on workload and session behavior.

## 4. Health Checks

### Sub-topic: Health Signal Quality

Keep health checks fast, deterministic, and representative. Overly deep checks can cause false negatives during partial dependency incidents.

Load balancers rely on health checks to avoid unhealthy instances.

- Liveness checks: process is up
- Readiness checks: instance can serve traffic
- Deep checks: dependency-aware checks (use sparingly)

## 5. Session Affinity

Sticky sessions route a user to the same backend instance.

Pros:

- Useful for legacy stateful apps

Cons:

- Uneven load distribution
- Harder failover behavior
- Reduced elasticity

Prefer stateless services with shared session stores when possible.

## 6. Observability and SLOs

### Sub-topic: What To Measure

| Metric | Why It Matters |
| --- | --- |
| p95/p99 upstream latency | Detect queueing and overload early |
| Backend error rate by target | Catch unhealthy instances quickly |
| Connection saturation | Prevent balancer tier bottlenecks |
| Failover convergence time | Validate resilience behavior |

## 7. Deployment Patterns

- Blue/green
- Canary
- Rolling updates

All require safe health checks, metrics-based rollback, and gradual traffic shifting.

## 8. Failure Modes

- Misconfigured health checks causing mass eviction
- Overloaded balancer tier
- Imbalanced distribution due to stickiness
- TLS termination bottlenecks

## 9. Interview Framing

1. Decide L4 or L7 for the use case.
2. State routing algorithm and why.
3. Explain health-check design.
4. Explain deployment and rollback safety.
5. Mention observability: error rate, backend saturation, tail latency.

