# 🏗️ System Design Interview

> A structured, example-driven reference for mastering system design interviews.  
> Browse any section below — each folder has its own index.

---

## 📚 Table of Contents

| # | Section | Topics |
|---|---------|--------|
| 1 | [**Fundamentals**](./01-fundamentals/) | Scalability, CAP, Consistency, Availability |
| 2 | [**Core Components**](./02-components/) | Load Balancers, Caching, CDN, Message Queues |
| 3 | [**API & Communication**](./03-api-and-communication/) | REST, gRPC, WebSockets, GraphQL |
| 4 | [**Databases**](./04-databases/) | SQL vs NoSQL, Sharding, Replication, Schema Design |
| 5 | [**Patterns**](./05-patterns/) | CQRS, Event Sourcing, Saga, Circuit Breaker |
| 6 | [**Case Studies**](./06-case-studies/) | End-to-end system walkthroughs |
| 7 | [**Interview Prep**](./07-interview-prep/) | Framework, Estimation, Common Questions |

---

## 🗂️ Section Overview

### 01 — [Fundamentals](./01-fundamentals/)

The building blocks every system design answer needs.

- [Scalability & Performance](./01-fundamentals/scalability.md)
- [CAP Theorem & Consistency Models](./01-fundamentals/cap-theorem.md)
- [High Availability & Fault Tolerance](./01-fundamentals/high-availability.md)
- [Back-of-envelope Estimation](./01-fundamentals/estimation.md)

---

### 02 — [Core Components](./02-components/)

Reusable infrastructure pieces that appear in almost every design.

- [Load Balancers](./02-components/load-balancers.md)
- [Caching Strategies](./02-components/caching.md)
- [CDN & Edge Computing](./02-components/cdn.md)
- [Message Queues & Event Streaming](./02-components/message-queues.md)
- [Rate Limiting](./02-components/rate-limiting.md)
- [Service Discovery & Health Checks](./02-components/service-discovery.md)

---

### 03 — [API & Communication](./03-api-and-communication/)

How services talk to each other and to clients.

- [REST API Design](./03-api-and-communication/rest.md)
- [gRPC & Protobuf](./03-api-and-communication/grpc.md)
- [WebSockets & Real-Time](./03-api-and-communication/websockets.md)
- [GraphQL](./03-api-and-communication/graphql.md)
- [API Gateway](./03-api-and-communication/api-gateway.md)

---

### 04 — [Databases](./04-databases/)

Storage decisions — one of the most impactful choices in any design.

- [SQL vs NoSQL](./04-databases/sql-vs-nosql.md)
- [Sharding Strategies](./04-databases/sharding.md)
- [Replication & Failover](./04-databases/replication.md)
- [Schema Design & Evolution](./04-databases/schema-design.md)
- [Distributed Transactions](./04-databases/distributed-transactions.md)
- [Time-Series & Specialized Stores](./04-databases/specialized-stores.md)

---

### 05 — [Patterns](./05-patterns/)

Proven architectural patterns for distributed systems.

- [CQRS](./05-patterns/cqrs.md)
- [Event Sourcing](./05-patterns/event-sourcing.md)
- [Saga Pattern](./05-patterns/saga.md)
- [Circuit Breaker & Bulkhead](./05-patterns/circuit-breaker.md)
- [Outbox Pattern](./05-patterns/outbox.md)
- [Two-Phase Commit vs Eventual Consistency](./05-patterns/2pc-vs-eventual.md)

---

### 06 — [Case Studies](./06-case-studies/)

Full system walkthroughs covering requirements, HLD, deep dives, and trade-offs.

| System | Key Challenges |
|--------|---------------|
| [E-Commerce Inventory Management](./06-case-studies/ecommerce-inventory-management-system/) | Overselling prevention, distributed stock |
| [URL Shortener](./06-case-studies/url-shortener/) | ID generation, redirects at scale |
| [Chat / Messaging](./06-case-studies/chat-messaging/) | Real-time delivery, presence, history |
| [Notification Service](./06-case-studies/notification-service/) | Fan-out, multi-channel, deduplication |
| [Rate Limiter](./06-case-studies/rate-limiter/) | Token bucket, sliding window, distributed |
| [News Feed](./06-case-studies/news-feed/) | Fan-out-on-write vs read, ranking |
| [Distributed Cache](./06-case-studies/distributed-cache/) | Eviction, consistency, cluster failover |
| [API Gateway](./06-case-studies/api-gateway/) | Auth, routing, throttling, observability |

---

### 07 — [Interview Prep](./07-interview-prep/)

Structured guides for performing well under interview conditions.

- [Interview Framework (Step-by-Step)](./07-interview-prep/interview-framework.md)
- [Estimation Cheat Sheet](./07-interview-prep/estimation-cheatsheet.md)
- [Common Mistakes to Avoid](./07-interview-prep/common-mistakes.md)
- [50 Common System Design Questions](./07-interview-prep/common-questions.md)

---

## 🚀 How to Use This Repo

1. **New to system design?** Start with [01-fundamentals](./01-fundamentals/) then work through each section in order.
2. **Preparing for an interview?** Start with [01-fundamentals](./01-fundamentals/), then practice with [06-case-studies](./06-case-studies/).
3. **Practicing a specific system?** Go directly to [06-case-studies](./06-case-studies/) and work through the walkthroughs.
4. **Looking for a component?** Browse [02-components](./02-components/) for reusable building blocks.

---

## 🤝 Contributing

Contributing guide coming soon. For now, follow the existing folder structure and writing style when adding new topics or case studies.

---

## 📌 Quick Reference

<details>
<summary><strong>📐 Estimation Numbers (click to expand)</strong></summary>

| Resource | Approximate Value |
|----------|------------------|
| L1 cache reference | 1 ns |
| L2 cache reference | 4 ns |
| Main memory reference | 100 ns |
| SSD random read | 150 µs |
| HDD seek | 10 ms |
| Round trip in same DC | 500 µs |
| Round trip CA → Netherlands | 150 ms |
| Read 1 MB sequentially from SSD | 1 ms |
| Read 1 MB sequentially from HDD | 20 ms |
| **1 million requests/day** | **~12 req/s** |
| **1 billion requests/day** | **~11,500 req/s** |
| Average web page size | ~2 MB |

</details>

<details>
<summary><strong>⚡ Interview Time Boxing (click to expand)</strong></summary>

| Phase | Time |
|-------|------|
| Clarify requirements | 3–5 min |
| High-level design | 10–15 min |
| Deep dive (1–2 components) | 15–20 min |
| Trade-offs & wrap-up | 3–5 min |

</details>

---

_Maintained as a living reference. PRs and issues welcome._
