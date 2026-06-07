---
layout: default
title: "System Design Cheat Sheet"
page_type: resource
---

# System Design Cheat Sheet

Quick reference for important concepts and formulas.

<div class="resource-layout" markdown="1">
  <nav class="resource-menu" aria-label="Cheat sheet sections">
    <a class="is-active" href="#scalability">Scalability</a>
    <a href="#load-balancing">Load Balancing</a>
    <a href="#caching">Caching</a>
    <a href="#databases">Databases</a>
    <a href="#consistency">Consistency</a>
    <a href="#capacity">Capacity</a>
  </nav>
  <div markdown="1">

## Scalability

- Vertical Scaling: Add more power to a single machine.
- Horizontal Scaling: Add more machines behind a load balancer.
- Stateless services are easier to scale horizontally.
- Use auto-scaling to handle variable load.

## Load Balancing

| Algorithm | Description |
| --- | --- |
| Round Robin | Distributes requests sequentially. |
| Least Connections | Routes to the server with the fewest active connections. |
| IP Hash | Routes by client IP hash. |
| Weighted Round Robin | Gives stronger servers more requests. |

## Common Capacity Estimation

| Metric | Formula |
| --- | --- |
| Storage | Total Data = QPS × Avg Size × Time |
| Bandwidth | QPS × Avg Response Size |
| Requests | Total Requests = QPS × Time |
| Peak QPS | Average QPS × Peak Multiplier |

  </div>
</div>
