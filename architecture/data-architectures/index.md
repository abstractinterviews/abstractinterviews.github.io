---
layout: default
title: "Data Architectures"
page_type: deep-dive-index
deep_dive_id: data-architectures
deep_title: "Data Architectures"
subtitle: "Architectures for analytical, operational, and streaming data platforms."
hero_icon: "A"
badges:
  - Software Architecture
  - Interview Track
  - "5 topics"
stats:
  - value: "5"
    label: "Sub Topics"
  - value: "2+"
    label: "Diagrams Each"
  - value: "Senior"
    label: "Level"
overview: "Architectures for analytical, operational, and streaming data platforms."
key_takeaways:
  - Explain architecture choices through constraints
  - Compare alternatives and operational costs
  - Show evolution and migration paths
  - Connect designs to interview follow-ups
subtopics:
  - title: "Lakehouse"
    description: "Interview-ready guide to Lakehouse, including trade-offs, diagrams, migration notes, and production concerns."
    read_time: "7 min read"
    url: "/architecture/data-architectures/lakehouse/"
    icon: "A"
    color: "blue"
  - title: "Data Mesh"
    description: "Interview-ready guide to Data Mesh, including trade-offs, diagrams, migration notes, and production concerns."
    read_time: "7 min read"
    url: "/architecture/data-architectures/data-mesh/"
    icon: "A"
    color: "blue"
  - title: "Lambda"
    description: "Interview-ready guide to Lambda, including trade-offs, diagrams, migration notes, and production concerns."
    read_time: "7 min read"
    url: "/architecture/data-architectures/lambda/"
    icon: "A"
    color: "blue"
  - title: "Kappa"
    description: "Interview-ready guide to Kappa, including trade-offs, diagrams, migration notes, and production concerns."
    read_time: "7 min read"
    url: "/architecture/data-architectures/kappa/"
    icon: "A"
    color: "blue"
  - title: "Medallion"
    description: "Interview-ready guide to Medallion, including trade-offs, diagrams, migration notes, and production concerns."
    read_time: "7 min read"
    url: "/architecture/data-architectures/medallion/"
    icon: "A"
    color: "blue"
related_concepts:
  - title: "Software Architecture"
    url: "/architecture/"
  - title: "Architecture Fundamentals"
    url: "/architecture/fundamentals/"
---

# Data Architectures

## Topic: How To Use This Section

Use this section as an interview map. Start with the simplest architecture that satisfies the requirements, then move to a more specialized option only when constraints justify it.

## Topic: Category Decision Flow

~~~mermaid
flowchart LR
    A["Clarify requirements"] --> B["Select candidate architecture"]
    B --> C["Compare alternatives"]
    C --> D["Name trade-offs"]
    D --> E["Plan migration and operations"]
~~~

## Topic: Subtopics

| Subtopic | Interview Use |
| --- | --- |
| [Lakehouse]({{ '/architecture/data-architectures/lakehouse/' | relative_url }}) | Use this to answer design, migration, and production trade-off questions. |
| [Data Mesh]({{ '/architecture/data-architectures/data-mesh/' | relative_url }}) | Use this to answer design, migration, and production trade-off questions. |
| [Lambda]({{ '/architecture/data-architectures/lambda/' | relative_url }}) | Use this to answer design, migration, and production trade-off questions. |
| [Kappa]({{ '/architecture/data-architectures/kappa/' | relative_url }}) | Use this to answer design, migration, and production trade-off questions. |
| [Medallion]({{ '/architecture/data-architectures/medallion/' | relative_url }}) | Use this to answer design, migration, and production trade-off questions. |

<!-- interview-module:start -->

## Quick Summary

| Item | Interview-Ready Answer |
| --- | --- |
| Core idea | Data Architectures is an architecture concept candidates use to reason about boundaries, trade-offs, evolution, and production readiness. |
| What to emphasize | Explain the problem it solves, the constraints that make it useful, and the operational cost it introduces. |
| Senior signal | Connect the decision to ownership, failure modes, rollout strategy, cost, and long-term maintainability. |
| Common trap | Presenting the architecture as universally good instead of constraint-dependent. |

## Key Takeaways

- Start with the business and engineering constraints before naming the architecture.
- Explain which quality attributes improve: scalability, deployability, resilience, consistency, or maintainability.
- State what becomes harder: debugging, coordination, data ownership, migration, testing, or operations.
- Use a diagram to show boundaries, control flow, data flow, and failure points.
- End with a recommendation and the key trade-off you are accepting.

## Visual Diagrams

~~~mermaid
flowchart LR
    A["Requirements"] --> B["Architecture choice: Data Architectures"]
    B --> C["Benefits"]
    B --> D["Trade-offs"]
    B --> E["Failure modes"]
    C --> F["Recommendation"]
    D --> F
    E --> F
~~~

~~~mermaid
flowchart TD
    Scope["Clarify scope"] --> Boundaries["Define boundaries"]
    Boundaries --> Data["Choose data ownership"]
    Data --> Integration["Select integration style"]
    Integration --> Ops["Plan operations"]
    Ops --> Evolution["Describe evolution path"]
~~~

## Mental Models

| Mental Model | How To Apply It |
| --- | --- |
| Quality attributes first | Architecture exists to protect qualities such as availability, scalability, and maintainability. |
| Cost of change | The more expensive a decision is to reverse, the more architectural it is. |
| Conway's Law | System boundaries often mirror team boundaries, so ownership matters. |
| Failure-first design | Every architecture needs an answer for partial failure, overload, and recovery. |
| Evolutionary architecture | Prefer decisions that preserve optionality when requirements are still changing. |

## Real World Examples

| Context | Example Use |
| --- | --- |
| New product | Keep the design simple while preserving module boundaries for future extraction. |
| Scaling platform | Separate workloads that need different scaling, reliability, or ownership models. |
| Regulated enterprise | Add auditability, governance, data retention, and change-control constraints. |
| Legacy modernization | Migrate incrementally using strangler, facade, event, or data-sync patterns. |

## Interview Perspective

| Interviewer Probe | Strong Response |
| --- | --- |
| Why this architecture? | Tie it to specific constraints rather than preference or trend. |
| What are the trade-offs? | Name both what improves and what gets harder. |
| How do you migrate? | Show an incremental path with rollback and validation. |
| How do you operate it? | Mention metrics, tracing, alerts, deployment strategy, and ownership. |

## Common Mistakes

- Choosing a complex architecture before proving the need.
- Ignoring data ownership and consistency boundaries.
- Forgetting rollout, rollback, observability, and incident response.
- Drawing boxes without explaining ownership, latency, and failure behavior.
- Treating cloud/provider features as a substitute for architecture reasoning.

## Follow-up Questions

1. What constraints would make this architecture a poor choice?
2. How would the design change with 10x traffic or 10x team size?
3. Where are the failure boundaries?
4. How do services or modules communicate?
5. Who owns the data and deployment lifecycle?
6. How would you migrate from the current architecture?
7. What metrics prove the architecture is working?

## Production Insights

| Concern | What To Cover |
| --- | --- |
| Observability | Logs, metrics, traces, dashboards, SLOs, and user-visible health. |
| Reliability | Timeouts, retries, backpressure, circuit breakers, redundancy, and recovery. |
| Security | Trust boundaries, identity, authorization, secrets, and data protection. |
| Cost | Infrastructure cost, operational cost, migration cost, and coordination cost. |
| Governance | Decision records, ownership, standards, dependency rules, and review cadence. |

## Cheat Sheet

| Interview Move | What To Say |
| --- | --- |
| Define | "Data Architectures is useful when..." |
| Justify | "The constraint that pushes me here is..." |
| Trade off | "This improves X but makes Y harder." |
| Operate | "In production I would monitor..." |
| Evolve | "I would migrate incrementally by..." |

## Flashcards

| Front | Back |
| --- | --- |
| What makes Data Architectures architectural? | It affects hard-to-change decisions such as boundaries, ownership, data flow, and deployment. |
| What should you clarify first? | Scale, availability, consistency, latency, team ownership, compliance, and migration constraints. |
| What is a senior-level answer? | A recommendation with trade-offs, failure modes, rollout plan, and observability. |
| What should diagrams show? | Boundaries, dependencies, data movement, control flow, and failure points. |
| How should you end? | Summarize the decision and the main trade-off in one sentence. |

## Related Topics

- [Software Architecture]({{ '/architecture/' | relative_url }})
- [Architecture Fundamentals]({{ '/architecture/fundamentals/' | relative_url }})
- [Architecture Styles]({{ '/architecture/styles/' | relative_url }})
- [Distributed Architectures]({{ '/architecture/distributed-architectures/' | relative_url }})
- [Integration Architectures]({{ '/architecture/integration-architectures/' | relative_url }})

## Practice Questions

1. Explain Data Architectures in 90 seconds using a real product example.
2. Draw the boundary and data-flow diagram for this architecture.
3. Compare it with one simpler and one more complex alternative.
4. Identify two production failure modes and how you would detect them.
5. Describe a migration plan from a legacy system.
6. Explain what would change for a Staff Engineer-level design review.

## Revision Notes

- Architecture answers should connect structure to quality attributes.
- Always explain why the architecture fits the stated constraints.
- Diagrams should show boundaries, communication, data ownership, and failure paths.
- Strong answers include migration, observability, rollback, and ownership.
- Avoid trend-based answers; defend architecture choices with trade-offs.
- Final interview move: state the recommendation, the main trade-off, and the validation plan.

<!-- interview-module:end -->
