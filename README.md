# 🏗️ System Design Interview

> A structured, example-driven reference for mastering system design interviews.  
> Browse any section below — each folder has its own index.

---

## 📚 Table of Contents

| # | Section | Topics |
|---|---------|--------|
| 1 | [**Fundamentals**](./fundamentals/) | Scalability, CAP, Consistency, Availability |
| 2 | [**Core Components**](./components/) | Load Balancers, Caching, CDN, Message Queues |
| 3 | [**API & Communication**](./components/api-and-communication/) | REST, gRPC, WebSockets, GraphQL |
| 4 | [**Databases**](./components/databases/) | SQL vs NoSQL, Sharding, Replication, Schema Design |
| 5 | [**Patterns**](./fundamentals/patterns/) | CQRS, Event Sourcing, Saga, Circuit Breaker |
| 6 | [**Case Studies**](./case-studies/) | End-to-end system walkthroughs |
| 7 | [**Interview Prep**](./interview-prep/) | Framework, Estimation, Common Questions |

---

## 🗂️ Section Overview

### 01 — [Fundamentals](./fundamentals/)

The building blocks every system design answer needs.

- [Scalability & Performance](./fundamentals/scalability/)
- [CAP Theorem & Consistency Models](./fundamentals/cap-theorem/)
- [High Availability & Fault Tolerance](./fundamentals/high-availability/)
- [Back-of-envelope Estimation](./fundamentals/estimation/)

---

### 02 — [Core Components](./components/)

Reusable infrastructure pieces that appear in almost every design.

- [Load Balancers](./components/load-balancers/)
- [Caching Strategies](./components/caching/)
- [CDN & Edge Computing](./components/cdn/)
- [Message Queues & Event Streaming](./components/message-queues/)
- [Rate Limiting](./components/rate-limiting/)
- [Service Discovery & Health Checks](./components/service-discovery/)

---

### 03 — [API & Communication](./components/api-and-communication/)

How services talk to each other and to clients.

- [REST API Design](./components/api-and-communication/rest/)
- [gRPC & Protobuf](./components/api-and-communication/grpc/)
- [WebSockets & Real-Time](./components/api-and-communication/websockets/)
- [GraphQL](./components/api-and-communication/graphql/)
- [API Gateway](./components/api-and-communication/api-gateway/)

---

### 04 — [Databases](./components/databases/)

Storage decisions — one of the most impactful choices in any design.

- [SQL vs NoSQL](./components/databases/sql-vs-nosql/)
- [Sharding Strategies](./components/databases/sharding/)
- [Replication & Failover](./components/databases/replication/)
- [Schema Design & Evolution](./components/databases/schema-design/)
- [Distributed Transactions](./components/databases/distributed-transactions/)
- [Time-Series & Specialized Stores](./components/databases/specialized-stores/)

---

### 05 — [Patterns](./fundamentals/patterns/)

Proven architectural patterns for distributed systems.

- [CQRS](./fundamentals/patterns/cqrs/)
- [Event Sourcing](./fundamentals/patterns/event-sourcing/)
- [Saga Pattern](./fundamentals/patterns/saga/)
- [Circuit Breaker & Bulkhead](./fundamentals/patterns/circuit-breaker/)
- [Outbox Pattern](./fundamentals/patterns/outbox/)
- [Two-Phase Commit vs Eventual Consistency](./fundamentals/patterns/2pc-vs-eventual/)

---

### 06 — [Case Studies](./case-studies/)

Full system walkthroughs covering requirements, HLD, deep dives, and trade-offs.

| System | Key Challenges |
|--------|---------------|
| [E-Commerce Inventory Management](./case-studies/ecommerce-inventory-management-system/) | Overselling prevention, distributed stock |
| [URL Shortener](./case-studies/url-shortener/) | ID generation, redirects at scale |
| [Chat / Messaging](./case-studies/chat-messaging/) | Real-time delivery, presence, history |
| [Notification Service](./case-studies/notification-service/) | Fan-out, multi-channel, deduplication |
| [Rate Limiter](./case-studies/rate-limiter/) | Token bucket, sliding window, distributed |
| [News Feed](./case-studies/news-feed/) | Fan-out-on-write vs read, ranking |
| [Distributed Cache](./case-studies/distributed-cache/) | Eviction, consistency, cluster failover |
| [API Gateway](./case-studies/api-gateway/) | Auth, routing, throttling, observability |

---

### 07 — [Interview Prep](./interview-prep/)

Structured guides for performing well under interview conditions.

- [Interview Framework (Step-by-Step)](./interview-prep/interview-framework.md)
- [Estimation Cheat Sheet](./interview-prep/estimation-cheatsheet.md)
- [Common Mistakes to Avoid](./interview-prep/common-mistakes.md)
- [50 Common System Design Questions](./interview-prep/common-questions.md)

---

## 🚀 How to Use This Repo

1. **New to system design?** Start with [fundamentals](./fundamentals/) then work through each section in order.
2. **Preparing for an interview?** Start with [fundamentals](./fundamentals/), then practice with [case-studies](./case-studies/).
3. **Practicing a specific system?** Go directly to [case-studies](./case-studies/) and work through the walkthroughs.
4. **Looking for a component?** Browse [components](./components/) for reusable building blocks.

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

