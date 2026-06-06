# CQRS

CQRS separates read and write models to optimize each side independently.

![Figure 1 - CQRS Read/Write Split](./assets/cqrs-read-write-split.png)

*Figure 1: Command side writing to source store and event bus, query side serving denormalized read views.*

Best for read-heavy systems with distinct query and mutation behavior.
