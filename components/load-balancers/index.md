---
layout: default
title: "Load Balancers"
page_type: deep-dive-post
subtitle: "Distribute traffic across healthy backends for availability, scale, and smooth deployments."
difficulty: Intermediate
read_time: "10 min read"
---

# Load Balancers

Load balancers distribute traffic across backend instances so the system can scale horizontally, route around failure, and roll out changes safely.

<div class="section-tabs" aria-label="Load balancer areas">
  <span class="is-active">Routing</span>
  <span>Health</span>
  <span>Deployments</span>
  <span>Failure Modes</span>
</div>

<div class="doc-callout">
  <strong>A load balancer is a control point.</strong>
  <p>It is not just a traffic splitter. It decides which instances receive work, which instances are removed, and how safely new versions receive traffic.</p>
</div>

![Load balancing architecture showing L7 traffic distribution, health checks, and failover.](../assets/load-balancing-architecture.png)

*Figure 1: Load balancing with clients, L7 routing, health checks, backend pools, and failover behavior.*

## Topic: Topic Map

### Sub-topic: Section Directory

- Routing model: choose L4 or L7 based on request-awareness needs.
- Algorithm selection: match routing policy to workload shape.
- Health and failover: remove unsafe backends without causing churn.
- Deployment control: shift traffic safely during releases.
- Operations: observe saturation, imbalance, and tail latency.

## Topic: Routing Model

### Sub-topic: L4 vs L7 Decision

| Requirement | Layer 4 | Layer 7 |
| --- | --- | --- |
| Lowest overhead | Strong fit | Moderate overhead |
| Path/header routing | Limited | Strong fit |
| TLS termination and auth hooks | Limited | Strong fit |
| Session-aware routing | Limited | Strong fit |
| Protocol simplicity | Strong fit | More moving parts |

Use L4 when throughput and simplicity dominate. Use L7 when routing needs HTTP-aware policy, canaries, auth, path-based routing, or request-level observability.

### Sub-topic: Routing Algorithms

| Algorithm | Best Fit | Watch Out |
| --- | --- | --- |
| Round robin | Similar backends and similar request cost | Ignores slow or busy nodes |
| Weighted round robin | Mixed backend capacity | Bad weights create imbalance |
| Least connections | Long-lived or uneven request duration | Needs accurate connection tracking |
| Least response time | Latency-sensitive workloads | Can oscillate if measurements are noisy |
| Hash-based routing | Sticky sessions or cache locality | Can create hotspots |

## Topic: Health and Failover

### Sub-topic: Health Checks

Load balancers rely on health checks to avoid unhealthy instances.

- Liveness: the process is alive.
- Readiness: the instance can safely receive traffic.
- Deep checks: dependencies are healthy enough for serving traffic.

Keep frequent checks fast and deterministic. Expensive deep checks can cause false negatives during partial dependency incidents.

### Sub-topic: Failover Behavior

Good failover removes bad targets without overreacting.

- Use grace periods during startup and shutdown.
- Drain existing connections before removing a backend.
- Avoid ejecting too many instances at once.
- Keep enough healthy capacity for peak traffic after failover.

## Topic: Traffic Control

### Sub-topic: Session Affinity

Sticky sessions route a user or client to the same backend.

Use it when:

- Legacy services keep local session state.
- Cache locality matters.
- Long-lived connections need stable placement.

Avoid it when:

- It creates hot backends.
- It hides statefulness that should move to shared storage.
- It makes failover uneven or slow.

### Sub-topic: Deployment Patterns

| Pattern | How Traffic Moves | Use Case |
| --- | --- | --- |
| Rolling update | Gradually replace instances | Routine releases |
| Blue/green | Switch traffic between two full environments | Fast rollback |
| Canary | Send a small percentage to new version | Risk-controlled rollout |
| Weighted routing | Split by explicit percentages | Gradual migrations |

All deployment patterns need safe health checks, metrics-based rollback, and gradual traffic shifting.

## Topic: Operational Signals

### Sub-topic: Metrics To Watch

| Metric | Why It Matters |
| --- | --- |
| p95/p99 upstream latency | Detect queueing and overload early |
| Backend error rate by target | Catch unhealthy instances quickly |
| Active connections per backend | Detect imbalance |
| Connection saturation | Prevent balancer tier bottlenecks |
| Failover convergence time | Validate resilience behavior |

### Sub-topic: Failure Modes

- Misconfigured health checks causing mass eviction.
- Overloaded load balancer tier.
- Imbalanced distribution due to stickiness or bad weights.
- TLS termination bottlenecks.
- Retry storms when clients and balancers both retry aggressively.

## Topic: Interview Framing

### Sub-topic: Answer Structure

1. State whether the design needs L4, L7, or both.
2. Pick a routing algorithm and explain why it matches the workload.
3. Explain health checks, draining, and failover.
4. Explain deployment strategy and rollback.
5. Mention observability: backend saturation, error rate, tail latency, and traffic imbalance.

### Sub-topic: Common Pitfalls

- Treating load balancing as round robin only.
- Forgetting backend health and connection draining.
- Using sticky sessions without explaining failure behavior.
- Ignoring load balancer capacity as its own bottleneck.
