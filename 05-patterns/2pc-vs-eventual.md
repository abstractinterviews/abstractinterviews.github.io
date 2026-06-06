# Two-Phase Commit vs Eventual Consistency

2PC favors strict atomicity; eventual consistency favors availability and scalability.

![Figure 1 - Consistency Strategy Comparison](./assets/2pc-vs-eventual-consistency.png)

*Figure 1: Side-by-side of 2PC coordinator prepare/commit and eventual consistency with async reconciliation.*

Pick per business-critical operation rather than globally.
