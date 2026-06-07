---
layout: post
title: "50 System Design Patterns — Concise Reference"
date: 2026-06-07
---

This reference summarizes 50 widely used system design patterns organized into 10 categories. Each entry gives a short explanation, when to reach for the pattern, and the main trade-offs. The descriptions are original paraphrases intended for study and interview prep.

## Category 1 — Data Storage Patterns

1. Primary-Replica (Leader-Follower)
- What: One node accepts writes; replicas copy data and serve reads.
- When: Read-heavy systems where horizontal read scaling is needed.
- Trade-off: Replica lag and failover complexity.

2. Sharding (Horizontal Partitioning)
- What: Split data across multiple servers by a shard key.
- When: Single-node storage or write throughput becomes a bottleneck.
- Trade-off: Cross-shard queries and painful resharding.

3. Consistent Hashing
- What: Map keys and nodes onto a ring so adding/removing nodes moves minimal keys.
- When: Distributed caches or storage where membership changes often.
- Trade-off: More complexity and potential unevenness without virtual nodes.

4. Write-Ahead Log (WAL)
- What: Append operations to a durable log before applying to primary storage.
- When: Databases and systems requiring crash recovery and replication.
- Trade-off: Extra write overhead and log maintenance.

5. Event Sourcing
- What: Persist a sequence of events; derive current state by replaying them.
- When: Auditability, reconstructing past states, or multiple projections.
- Trade-off: Larger storage and harder schema evolution.

6. CQRS (Command Query Responsibility Segregation)
- What: Separate write (command) and read (query) models, often with different stores.
- When: Systems with divergent read/write optimization needs.
- Trade-off: Added complexity and eventual consistency between models.

## Category 2 — Caching Patterns

7. Cache-Aside (Lazy Loading)
- What: App checks cache first, falls back to DB on miss and populates cache.
- When: General-purpose caching when reads dominate.
- Trade-off: Cold-start misses and cache/DB staleness risks.

8. Write-Through
- What: Writes go to cache and backing store synchronously.
- When: Need read-after-write consistency.
- Trade-off: Slower writes and possible wasted cache space.

9. Write-Behind (Write-Back)
- What: Writes commit to cache; cache flushes to DB asynchronously.
- When: Write-heavy workloads where low-latency writes matter.
- Trade-off: Risk of data loss if cache fails before flush.

10. Read-Through
- What: Cache transparently loads from DB on miss; app talks only to cache.
- When: Offload caching logic from app into cache layer.
- Trade-off: Tighter coupling between cache and storage logic.

11. Cache Stampede Prevention
- What: Throttle or coalesce concurrent misses for the same key.
- When: Popular keys that expire simultaneously.
- Trade-off: Adds coordination complexity (locks, probabilistic refresh).

## Category 3 — Communication Patterns

12. Request-Response (Synchronous)
- What: Client sends request and waits for immediate reply (REST/gRPC).
- When: Operations that require an immediate answer.
- Trade-off: Blocking callers and cascading latency.

13. Message Queue (Asynchronous)
- What: Producer enqueues messages; consumers process at their pace.
- When: Decoupling and smoothing bursty workloads.
- Trade-off: Increased operational surface and eventual processing delay.

14. Publish-Subscribe (Pub/Sub)
- What: Messages published to a topic are delivered to all subscribers.
- When: Multiple independent services must react to the same event.
- Trade-off: Duplicates and ordering guarantees vary by system.

15. Event-Driven Architecture
- What: System components emit and react to events rather than direct calls.
- When: Loose coupling and independent evolution of services.
- Trade-off: Distributed workflows are harder to reason about and debug.

16. Webhooks
- What: Push notifications to client-provided URLs when events occur.
- When: Third-party integrations and callbacks.
- Trade-off: Delivery reliability, retries, and security concerns.

17. Server-Sent Events (SSE)
- What: One-way server pushes to clients over long-lived HTTP connections.
- When: Live feeds where the server needs to push updates.
- Trade-off: Unidirectional and connection limits from browsers.

18. Bidirectional Streaming (WebSockets / gRPC Streaming)
- What: Persistent two-way channels for real-time messaging.
- When: Chat, multiplayer games, collaborative apps.
- Trade-off: Scale and connection management complexity.

## Category 4 — Reliability Patterns

19. Circuit Breaker
- What: Stop calling failing dependencies and return fallback.
- When: Prevent cascading failures from unstable services.
- Trade-off: Must tune thresholds and fallback accuracy.

20. Retry with Exponential Backoff
- What: Retry failed requests with increasing delays and jitter.
- When: Transient network or service errors.
- Trade-off: Retries can amplify overload unless capped.

21. Bulkhead
- What: Isolate resources into separate pools so failures don't spread.
- When: Multi-tenant or mixed workloads that should not interfere.
- Trade-off: Potential underutilization of reserved resources.

22. Timeout
- What: Enforce maximum duration for external calls.
- When: Every external dependency to avoid unbounded hangs.
- Trade-off: Too-short timeouts cause false failures; too-long delay detection.

23. Idempotency
- What: Make operations safe to retry without side effects multiplying.
- When: Write APIs where clients may retry uncertain requests.
- Trade-off: Requires tracking idempotency keys and extra checks.

24. Dead Letter Queue (DLQ)
- What: Route repeatedly-failing messages to a separate queue for inspection.
- When: Message-driven systems to avoid blocking progress.
- Trade-off: Requires monitoring and manual or automated remediation.

25. Graceful Degradation
- What: Serve reduced functionality when parts fail instead of total outages.
- When: User-facing systems where partial service preserves core experience.
- Trade-off: Extra design and testing for degraded modes.

## Category 5 — Scaling Patterns

26. Horizontal Scaling
- What: Add more machines to handle increased load.
- When: Stateless services and workloads that parallelize well.
- Trade-off: Needs load balancing and externalized session/state.

27. Vertical Scaling
- What: Upgrade to a bigger machine (CPU, RAM, disk).
- When: Quick fixes or single-node components like some databases.
- Trade-off: Finite limits and single point of failure.

28. Load Balancing
- What: Distribute requests across backend instances with balancing algorithms.
- When: After adding multiple servers.
- Trade-off: Another layer to scale and monitor; potential latency hop.

29. Auto-Scaling
- What: Automatically adjust instance counts based on metrics.
- When: Cloud workloads with variable traffic.
- Trade-off: Provisioning delay and tuning metrics to avoid flapping.

30. Database Connection Pooling
- What: Reuse a pool of DB connections instead of opening per request.
- When: Any app talking to a database under load.
- Trade-off: Pool sizing must be tuned to avoid waiting or DB overload.

## Category 6 — Data Processing Patterns

31. MapReduce
- What: Split work into map tasks then aggregate with reduce tasks for batch processing.
- When: Large-scale offline data processing and ETL.
- Trade-off: High latency and heavy resource use.

32. Stream Processing
- What: Process events continuously with low latency (Kafka Streams, Flink).
- When: Real-time analytics and event-driven processing needs.
- Trade-off: More complex correctness and operational burden.

33. Lambda Architecture
- What: Combine batch and stream layers: accurate batch + low-latency stream.
- When: Systems needing both correctness and freshness.
- Trade-off: Duplicate pipelines and engineering effort.

34. Change Data Capture (CDC)
- What: Emit DB changes as a stream so other systems can react or replicate.
- When: Syncing search indexes, caches, or data warehouses.
- Trade-off: Depends on DB features and needs schema migration care.

## Category 7 — API Design Patterns

35. API Gateway
- What: Single front door for routing, auth, rate limits, and transformation.
- When: Microservices-based backends to simplify client interactions.
- Trade-off: Can become a bottleneck and must be highly available.

36. Backend for Frontend (BFF)
- What: Tailored API layers per client type (mobile, web) that aggregate backend calls.
- When: Different clients need different payload shapes or latency.
- Trade-off: More layers to maintain and potential duplication.

37. Rate Limiting
- What: Throttle client requests using token buckets or sliding windows.
- When: Public APIs or to protect against abuse.
- Trade-off: Legitimate spikes may be throttled; infra must be very fast.

38. Pagination (Cursor-Based)
- What: Use opaque cursors to page through large ordered result sets.
- When: Large datasets like timelines or logs.
- Trade-off: Harder to jump to arbitrary pages compared to offset pagination.

39. API Versioning
- What: Support multiple API versions to allow safe evolution.
- When: Public APIs or many long-lived consumers.
- Trade-off: Increased testing and maintenance burden.

## Category 8 — Infrastructure Patterns

40. CDN (Content Delivery Network)
- What: Serve static assets from geographically distributed edge servers.
- When: Global user base and heavy static content.
- Trade-off: Cache invalidation delays and bandwidth costs.

41. Reverse Proxy
- What: Front-layer server (Nginx, Envoy) that handles SSL, routing, and caching.
- When: Production web stacks to centralize cross-cutting concerns.
- Trade-off: Another operational component to manage.

42. Service Mesh
- What: Sidecar proxies provide networking features like mTLS, retries, and observability.
- When: Large microservice deployments needing platform-level policies.
- Trade-off: Operational complexity and resource overhead.

43. Sidecar Pattern
- What: Deploy helper process alongside the main service for cross-cutting tasks.
- When: Add logging, config, or discovery without changing app code.
- Trade-off: Extra resource use and ordering/startup concerns.

## Category 9 — Consistency Patterns

44. Two-Phase Commit (2PC)
- What: Coordinator asks participants if they can commit, then commits or aborts.
- When: Strong atomicity across distributed participants is required.
- Trade-off: Blocking, slow, and not scalable across many participants.

45. Saga Pattern
- What: Model distributed transactions as a sequence of local steps with compensations.
- When: Long-running business workflows where 2PC is impractical.
- Trade-off: Designing compensations is hard; temporary inconsistency.

46. Quorum
- What: Require a subset of replicas to acknowledge reads/writes so R+W>N.
- When: Tunable-consistency distributed stores needing guarantees.
- Trade-off: Higher R/W lowers latency but affects throughput.

47. Vector Clocks
- What: Track causal relationships with per-node logical timestamps for conflict detection.
- When: Systems that must detect and reconcile concurrent updates.
- Trade-off: Metadata grows with nodes; conflict resolution is application-specific.

## Category 10 — Observability & Operations Patterns

48. Health Check Endpoint
- What: Expose service liveness/readiness at an endpoint for orchestrators and LB.
- When: Every production service to enable safe routing and restarts.
- Trade-off: Deep checks can add latency or cascade failures if not designed carefully.

49. Distributed Tracing
- What: Propagate trace context and collect spans to see request flow across services.
- When: Microservices where end-to-end latency and bottlenecks must be diagnosed.
- Trade-off: Storage and overhead; often used with sampling.

50. Canary Deployment
- What: Release changes to a small subset of traffic and monitor before full rollout.
- When: Production deployments to catch regressions with real traffic.
- Trade-off: Requires traffic routing and parallel versions; rollout time.

---

Source inspiration: concepts organized by the DesignGurus guide. This page provides original summaries for study and interview prep. If you want, I can:

- add short concrete examples and diagrams for each pattern,
- split the list into separate pages per category,
- or add a printable cheat-sheet version.
