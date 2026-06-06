# Event Sourcing

Event sourcing stores state transitions as immutable events and reconstructs state from the log.

![Figure 1 - Event Store Lifecycle](./assets/event-store-lifecycle.png)

*Figure 1: Aggregate commands producing ordered events, snapshots, and read projections.*

Pros: auditability, temporal replay, debugability. Cons: operational complexity and schema evolution challenges.
