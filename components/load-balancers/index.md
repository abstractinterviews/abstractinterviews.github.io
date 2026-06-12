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



## Imported System Design Notes

These notes were moved from the old `50-system-design-patterns/load-balancing` bucket during the taxonomy cleanup.

### Load Balancing

Distribute incoming requests across backend instances using algorithms like round-robin, least-connections, or ip-hash.

When to use:
- Any horizontally scaled service to distribute load and improve availability.

Trade-offs:
- Adds latency and can be a bottleneck if not highly available/scale-out.

Related: /fundamentals/patterns/

## Example
- Example: An Nginx load balancer routes HTTP requests across 4 backend app instances using least-connections.

## Diagram
```mermaid
graph LR
  User --> LB[Nginx LB]
  LB --> A[App 1]
  LB --> B[App 2]
  LB --> C[App 3]
```

<!-- interview-module:start -->

## Interview Readiness Module

### Quick Summary

| Question | Interview-Ready Answer |
| --- | --- |
| What is it? | Load Balancers is a system design concept topic used to make a specific engineering decision explicit. |
| Why interviewers ask | They want to see constraints, tradeoffs, and failure-mode reasoning, not memorized definitions. |
| Core signal | You can explain when it helps, when it hurts, and how it behaves at scale. |
| Production lens | Discuss observability, ownership, rollout, and worst-case behavior. |

### Why This Exists

Load Balancers exists because real systems need a reusable way to manage load, coupling, correctness, latency, or change.

### Core Mental Model

Identify the force the pattern controls, the boundary it introduces, and the cost it adds.

### Visual Diagram

```mermaid
flowchart LR
    Problem["Interview prompt"] --> Model["Mental model for Load Balancers"]
    Model --> Choice["Decision and tradeoff"]
    Choice --> Evidence["Complexity, failure modes, examples"]
    Evidence --> Answer["Clear interview answer"]
```

### Internal Working

- Name the participants and what each owns.
- Trace the request, event, or state transition through the boundary.
- Explain what fails independently and what remains coupled.

### Decision Table

| Situation | Strong Choice | Watch Out For |
| --- | --- | --- |
| Low complexity and low scale | Keep the design simple | Premature patterns add accidental complexity. |
| High traffic or high fanout | Add partitioning, caching, or async boundaries | Consistency and observability become harder. |
| Frequent change | Encapsulate the unstable part | Too much abstraction hides behavior. |
| Strict correctness | Prefer explicit state and contracts | Latency and coordination cost may rise. |


### Time & Space Complexity

- Runtime cost: extra hops, serialization, coordination, or storage writes.
- Operational cost: monitoring, retries, backfills, and configuration.
- Cognitive cost: more moving parts and more explicit contracts.

### Advantages

- Gives a reusable vocabulary for solving recurring design pressure.
- Improves consistency across implementations.
- Makes tradeoffs easier to compare in interviews and reviews.

### Disadvantages

- Can become ceremony if the design pressure is weak.
- Adds abstractions that future maintainers must understand.
- May trade local simplicity for global coordination.

### Tradeoffs

| Tradeoff | Upside | Cost |
| --- | --- | --- |
| Simplicity vs capability | Simple designs are easier to reason about | May fail when scale or requirements grow. |
| Speed vs correctness | Faster paths improve latency | More caching, approximation, or async behavior can create stale results. |
| Local optimization vs system behavior | Optimizes the hot path | Can move cost to memory, operations, or consistency. |
| Flexibility vs governance | Enables independent change | Requires contracts, testing, and ownership clarity. |

### Real World Usage

- API platforms, event pipelines, and backend services
- Caching, messaging, resilience, and database access
- Release, migration, and integration workflows

### Production Considerations

> [!IMPORTANT]
> Production reality: the interview answer should mention what happens when assumptions break. For Load Balancers, discuss hot paths, observability, limits, backpressure, and how teams detect and recover from failures.

- Define the dominant read/write path and protect it with metrics.
- Add guardrails for invalid input, overload, and slow dependencies.
- Document ownership: who changes it, who operates it, and who gets paged.
- Prefer incremental rollout when the change affects correctness or latency.

### Common Mistakes

> [!WARNING]
> Senior signal gotcha: Treating the pattern as a default instead of a response to a concrete force.

- Skipping constraints and jumping directly to implementation.
- Describing the tool without explaining why it fits this prompt.
- Ignoring worst-case behavior, memory overhead, or operational ownership.
- Forgetting to compare at least one simpler alternative.

### Failure Modes

- Hot keys, skewed traffic, or adversarial inputs overload the assumed fast path.
- Hidden coupling makes a local change cause downstream breakage.
- Missing observability turns correctness or latency issues into guesswork.
- Data growth changes an acceptable O(n), storage, or network cost into a bottleneck.

### Interview Perspective

Interviewers are testing whether you can connect Load Balancers to constraints, tradeoffs, and failure modes. A strong answer starts simple, states assumptions, chooses the right abstraction, and then explains what would change at larger scale.

### Interview Questions

1. What problem does Load Balancers solve better than the simpler alternative?
2. What assumptions make this choice valid?
3. What is the worst-case behavior, and how would you mitigate it?
4. How would you explain this to a junior engineer on your team?
5. What metrics would prove this is working in production?

### Follow-up Questions

1. How does the answer change if traffic increases by 10x?
2. What breaks if data is skewed, stale, or partially unavailable?
3. Which part would you cache, partition, replicate, or simplify?
4. How would you migrate from the naive version to this approach?
5. What would make you reject Load Balancers?

### Related Topics

- Scalability
- High Availability
- Caching
- Databases
- Monitoring

### Key Takeaways

- Load Balancers is useful only when its core tradeoff matches the prompt.
- The strongest interview answers connect mechanics to constraints and scale.
- Always discuss worst-case behavior, not only average-case or happy-path behavior.
- Production readiness includes observability, ownership, rollout, and recovery.
- Compare it with the simpler alternative and explain the trigger that justifies the added complexity.

### 3-Minute Revision Sheet

1. Define Load Balancers in one sentence.
2. State the problem it solves and the simpler alternative it replaces.
3. Draw the core diagram and trace one request, operation, or decision through it.
4. Name the most important complexity, consistency, or operational tradeoff.
5. Close with one real-world use case and one failure mode.

### Decision Framework

| Step | Candidate Action |
| --- | --- |
| 1. Clarify | Ask about constraints, scale, data shape, and correctness needs. |
| 2. Choose | Pick the simplest approach that satisfies the dominant constraint. |
| 3. Justify | Explain time, space, cost, reliability, and team ownership tradeoffs. |
| 4. Stress test | Walk through failure, growth, and migration scenarios. |
| 5. Communicate | Present the answer as a recommendation, not a list of facts. |

### Why Use It

Use Load Balancers when it directly improves the dominant constraint: lookup speed, coupling, scalability, reliability, delivery speed, or reasoning clarity.

### Why Not Use It

Avoid Load Balancers when the simpler approach already meets the requirements, when operational overhead exceeds the benefit, or when the team cannot own the added complexity.

### Migration Strategy

1. Start with the simplest working design and capture baseline metrics.
2. Introduce Load Balancers behind a narrow interface or compatibility layer.
3. Migrate one path, tenant, or use case at a time.
4. Compare correctness, latency, cost, and operational load before expanding.
5. Keep rollback criteria explicit until the new approach is proven.

### Cost Impact

- Engineering cost: design, implementation, test coverage, and documentation.
- Runtime cost: compute, memory, storage, network, and coordination overhead.
- Operational cost: dashboards, alerts, on-call playbooks, and incident response.

### Organizational Impact

Load Balancers changes how teams communicate. It may require clearer ownership, better contracts, shared vocabulary, and explicit review of cross-team dependencies.

### Operational Complexity

Operational maturity requires dashboards for the hot path, alerts on saturation and errors, runbooks for known failure modes, and a rollout plan that limits blast radius.

## Quick Revision

- Load Balancers solves a specific pressure; name that pressure first.
- The best answer compares it with at least one simpler alternative.
- Discuss average case, worst case, and what changes at scale.
- Mention production guardrails: metrics, limits, retries, ownership, and rollback.
- End with a crisp recommendation and the assumptions behind it.

**Common interview answer:** "I would use Load Balancers when the constraints make its tradeoff worthwhile. I would start with the simplest version, validate the bottleneck, then add this structure or pattern where it improves the hot path while keeping failure modes observable."

**Most important tradeoffs:** performance vs complexity, correctness vs latency, flexibility vs ownership, and short-term speed vs long-term operability.

**Most important pitfalls:** unclear assumptions, ignoring worst-case behavior, skipping observability, and failing to explain why the simpler option is insufficient.

## Flashcards

1. **Q:** What is the main purpose of Load Balancers? **A:** To solve a specific constraint or reasoning problem more clearly than a naive approach.
2. **Q:** What should you clarify before using it? **A:** Scale, data shape, correctness needs, latency goals, and operational constraints.
3. **Q:** What makes an interview answer senior-level? **A:** It explains tradeoffs, failure modes, migration, and production ownership.
4. **Q:** What is the most common mistake? **A:** Naming the concept without tying it to the prompt's constraints.
5. **Q:** How do you discuss complexity? **A:** Cover time, space, coordination, and operational complexity where relevant.
6. **Q:** What should a diagram show? **A:** Boundaries, data flow, ownership, and the hot path.
7. **Q:** How do you handle follow-ups? **A:** Re-check assumptions and explain how the design changes under new constraints.
8. **Q:** What production signal matters most? **A:** Metrics on the hot path: latency, errors, saturation, and correctness drift.
9. **Q:** When should you avoid it? **A:** When it adds more complexity than the requirements justify.
10. **Q:** How should you conclude? **A:** Give a recommendation, list assumptions, and name the next thing you would validate.

<!-- interview-module:end -->
