---
layout: default
title: "Interview Framework (Step-by-Step)"
---

# Interview Framework (Step-by-Step)

This framework gives you a repeatable structure so you do not improvise the interview under pressure.

## Step-by-Step Flow

1. Clarify scope and assumptions.
2. Define APIs and data model.
3. Draw high-level architecture.
4. Deep dive into 1-2 critical components.
5. Discuss bottlenecks, failure handling, and trade-offs.

## What To Say At Each Stage

| Stage | Goal | Good Output |
| --- | --- | --- |
| Requirements | Narrow the problem | Clear scope and constraints |
| API and data model | Define the contract | Endpoints, entities, and invariants |
| HLD | Show structure | Services, queues, caches, databases |
| Deep dive | Prove judgment | One or two hard design choices |
| Wrap-up | Show maturity | Trade-offs, scale path, and monitoring |

## Common Transitions

- Move from requirements to architecture by naming the primary workload shape.
- Move from architecture to deep dive by picking the highest-risk component.
- Move from deep dive to wrap-up by explaining failure behavior and how you would observe it.

```text
Figure Name: Figure 1 - Step-by-Step Interview Framework
Alt Text: Structured interview flow with outputs per stage and time allocation.
Create a checklist flowchart with stages and decision points for candidate answers.
```

## Practice Rule

If you cannot explain a choice in one sentence, the answer is probably not yet structured enough for an interview.

