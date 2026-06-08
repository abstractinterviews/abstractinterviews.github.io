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

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Load Balancers helps candidates discuss component responsibility, integration contracts, bottlenecks, scaling limits, and failure behavior with clarity. |
| What to emphasize | Start with the problem it solves, then explain trade-offs, constraints, and production impact. |
| Senior signal | Connect the concept to scale, reliability, operability, cost, and team ownership. |
| Common trap | Giving a definition without explaining when the approach works, when it fails, and how to validate it. |

## Key Takeaways

- Define Load Balancers in one or two crisp sentences before expanding.
- Anchor the answer in constraints: scale, latency, consistency, correctness, cost, and maintainability.
- Compare at least one alternative and explain why it is weaker or stronger for the given scenario.
- Mention operational concerns such as monitoring, rollback, testing, ownership, and failure handling.
- Close with a practical rule of thumb that helps the interviewer see judgment, not memorization.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Clarify the prompt"] --> B["Define Load Balancers"]
    B --> C["Identify constraints"]
    C --> D["Choose an approach"]
    D --> E["Discuss trade-offs"]
    E --> F["Cover production concerns"]
    F --> G["Answer follow-ups"]
~~~

~~~mermaid
flowchart TD
    Problem["Problem or requirement"] --> Concept["Load Balancers"]
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
| Problem first | Explain what problem Load Balancers solves before naming tools or patterns. |
| Constraints shape design | A solution changes when throughput, latency, consistency, team size, or compliance changes. |
| Trade-off triangle | Balance correctness, complexity, and cost rather than claiming one perfect answer. |
| Failure-first thinking | Ask what breaks, how it is detected, and how the system recovers. |
| Evolution path | Describe a simple baseline, then evolve it as scale and requirements increase. |

Model the component by responsibilities, inputs, outputs, state, dependencies, and what happens when it fails.

## Real World Examples

| Scenario | How Load Balancers Shows Up |
| --- | --- |
| Startup MVP | Choose the simplest implementation that validates the product without hiding future migration paths. |
| High-scale platform | Focus on bottlenecks, partitioning, caching, queues, rate limits, and operational dashboards. |
| Enterprise environment | Discuss compliance, auditability, access control, data retention, and change management. |
| Incident review | Tie the concept to detection, mitigation, rollback, and prevention. |

Use it when explaining why a system needs this component, how it scales, and how it interacts with neighboring services.

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

Production components require health checks, metrics, backpressure, configuration, versioning, and clear ownership.

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
| What problem does Load Balancers solve? | It helps structure a decision around requirements, constraints, trade-offs, and production impact. |
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

1. Explain Load Balancers to an interviewer in 90 seconds.
2. Draw a diagram showing where this concept fits in a real system.
3. Compare this approach with one alternative and defend your choice.
4. Identify two bottlenecks and two failure modes.
5. Describe how you would test, monitor, and roll out this solution.
6. Re-answer the same question for a small startup and for a large enterprise.

Draw the component in a larger system and explain how traffic, data, and failures move through it.

## Revision Notes

- Start with the problem, not the terminology.
- Use a diagram to make the flow, ownership, or trade-off visible.
- Name constraints explicitly: scale, latency, consistency, correctness, cost, and operability.
- Discuss at least one alternative and one failure mode.
- End with validation: metrics, tests, rollout plan, and rollback strategy.
- Final interview move: summarize the recommendation in one sentence and state the key trade-off.

<!-- interview-module:end -->
