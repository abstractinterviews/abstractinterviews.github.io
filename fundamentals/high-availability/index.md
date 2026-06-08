---
layout: default
title: "High Availability and Fault Tolerance"
page_type: deep-dive-post
subtitle: "Design systems that remain useful through failures, retries, failover, and degraded modes."
difficulty: Intermediate
read_time: "9 min read"
---
# High Availability and Fault Tolerance

High availability means the system remains usable despite failures. Fault tolerance means the system can continue operating when components fail.

## Topic: Availability Goals

### Sub-topic: Availability Targets

Availability is commonly expressed as a percentage:

| Target | Approximate Downtime |
| --- | --- |
| 99.9% | 43.8 minutes/month |
| 99.99% | 4.38 minutes/month |
| 99.999% | 26.3 seconds/month |

Higher targets require stronger redundancy, faster detection, and safer failover.

### Sub-topic: SLO, SLA, and Error Budget

- SLA: contractual reliability commitment.
- SLO: internal reliability objective.
- Error budget: allowable failure within the SLO window.

Error budgets help balance feature velocity and reliability work.

## Topic: Failure Modeling

### Sub-topic: Failure Domains

Design to isolate failures at multiple levels:

- Process crash.
- Host failure.
- Zone outage.
- Region outage.
- Dependency outage, such as database, cache, queue, or third-party API.

The broader the failure domain, the stronger your recovery plan must be.

### Sub-topic: Blast Radius

Limit how far a failure can spread.

- Separate critical and non-critical workloads.
- Use bulkheads for resource isolation.
- Apply per-tenant limits to protect shared systems.
- Keep regional failures from becoming global failures.

## Topic: Resilience Patterns

### Sub-topic: Redundancy and Failover

- Run multiple service instances across zones.
- Use health checks and automatic failover.
- Keep stateless service nodes behind load balancers.
- Replicate data and define leader failover behavior.

![High-availability deployment across zones with failover paths, replicated data tier, and resilience mechanisms.](../assets/highavailability-fault-tolerance.png)

*Figure 1: High Availability and Fault Tolerance Design*

### Sub-topic: Timeouts, Retries, and Circuit Breakers

- Put timeouts on every remote call.
- Retry only safe operations.
- Use exponential backoff with jitter.
- Add circuit breakers to stop hammering unhealthy dependencies.

### Sub-topic: Graceful Degradation

Serve reduced functionality instead of total failure.

- Hide expensive recommendations.
- Serve cached or stale-but-safe data.
- Disable non-critical writes.
- Queue work for later processing.

## Topic: Data Reliability

### Sub-topic: Idempotency and Recovery

- Use idempotency keys for retried writes.
- Make consumers safe to reprocess messages.
- Use dead-letter queues for poison messages.
- Run reconciliation jobs to repair drift between systems.

### Sub-topic: Replication Limits

Replication improves durability and failover options, but it does not automatically guarantee availability.

- Async replication can lose recent writes during failover.
- Sync replication can hurt write latency.
- Cross-region replication needs conflict and lag handling.

## Topic: Incident Response

### Sub-topic: Example Cache Failure

If a cache tier fails:

1. Tighten timeout protection and fallback behavior.
2. Shed non-critical traffic.
3. Temporarily reduce expensive features.
4. Protect the database with strict rate limits.
5. Restore cache and warm hotspots safely.

### Sub-topic: Operational Signals

- Error rate by dependency.
- Failover time.
- Retry volume.
- Queue lag.
- Saturation by zone and region.
- User-visible success rate.

## Topic: Interview Framing

### Sub-topic: Answer Structure

1. State target uptime and latency SLO.
2. Define failure domains and blast radius.
3. Explain failover and degradation behavior.
4. Cover retry and idempotency semantics.
5. Explain detection, alerting, and recovery playbook.

### Sub-topic: Common Mistakes

- No timeouts between services.
- Infinite retries creating retry storms.
- Assuming replication alone guarantees availability.
- Missing runbooks and unreliable failover drills.

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | High Availability and Fault Tolerance helps candidates discuss interview readiness, conceptual clarity, trade-offs, and practical application with clarity. |
| What to emphasize | Start with the problem it solves, then explain trade-offs, constraints, and production impact. |
| Senior signal | Connect the concept to scale, reliability, operability, cost, and team ownership. |
| Common trap | Giving a definition without explaining when the approach works, when it fails, and how to validate it. |

## Key Takeaways

- Define High Availability and Fault Tolerance in one or two crisp sentences before expanding.
- Anchor the answer in constraints: scale, latency, consistency, correctness, cost, and maintainability.
- Compare at least one alternative and explain why it is weaker or stronger for the given scenario.
- Mention operational concerns such as monitoring, rollback, testing, ownership, and failure handling.
- Close with a practical rule of thumb that helps the interviewer see judgment, not memorization.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Clarify the prompt"] --> B["Define High Availability and Fault Tolerance"]
    B --> C["Identify constraints"]
    C --> D["Choose an approach"]
    D --> E["Discuss trade-offs"]
    E --> F["Cover production concerns"]
    F --> G["Answer follow-ups"]
~~~

~~~mermaid
flowchart TD
    Problem["Problem or requirement"] --> Concept["High Availability and Fault Tolerance"]
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
| Problem first | Explain what problem High Availability and Fault Tolerance solves before naming tools or patterns. |
| Constraints shape design | A solution changes when throughput, latency, consistency, team size, or compliance changes. |
| Trade-off triangle | Balance correctness, complexity, and cost rather than claiming one perfect answer. |
| Failure-first thinking | Ask what breaks, how it is detected, and how the system recovers. |
| Evolution path | Describe a simple baseline, then evolve it as scale and requirements increase. |

Treat this topic as an interview building block: define it, apply it, discuss trade-offs, and connect it to production reality.

## Real World Examples

| Scenario | How High Availability and Fault Tolerance Shows Up |
| --- | --- |
| Startup MVP | Choose the simplest implementation that validates the product without hiding future migration paths. |
| High-scale platform | Focus on bottlenecks, partitioning, caching, queues, rate limits, and operational dashboards. |
| Enterprise environment | Discuss compliance, auditability, access control, data retention, and change management. |
| Incident review | Tie the concept to detection, mitigation, rollback, and prevention. |

Use it to move from a definition-level answer into an applied, senior-level discussion.

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

Production readiness depends on constraints, observability, failure handling, security, cost, and long-term maintainability.

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
| What problem does High Availability and Fault Tolerance solve? | It helps structure a decision around requirements, constraints, trade-offs, and production impact. |
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

1. Explain High Availability and Fault Tolerance to an interviewer in 90 seconds.
2. Draw a diagram showing where this concept fits in a real system.
3. Compare this approach with one alternative and defend your choice.
4. Identify two bottlenecks and two failure modes.
5. Describe how you would test, monitor, and roll out this solution.
6. Re-answer the same question for a small startup and for a large enterprise.

Give a concise answer first, then expand into trade-offs, examples, and follow-up questions.

## Revision Notes

- Start with the problem, not the terminology.
- Use a diagram to make the flow, ownership, or trade-off visible.
- Name constraints explicitly: scale, latency, consistency, correctness, cost, and operability.
- Discuss at least one alternative and one failure mode.
- End with validation: metrics, tests, rollout plan, and rollback strategy.
- Final interview move: summarize the recommendation in one sentence and state the key trade-off.

<!-- interview-module:end -->
