# Scalability and Performance

Scalability is the ability of a system to maintain acceptable performance as load increases.

## 1. Vertical vs Horizontal Scaling

## Vertical scaling (scale up)

- Add CPU, memory, or faster disk to one machine.
- Simple operationally.
- Limited by hardware ceiling.
- Can become a single point of failure.

## Horizontal scaling (scale out)

- Add more machines and distribute traffic.
- Better long-term growth and fault isolation.
- Requires partitioning, coordination, and observability.

## 2. Key Performance Metrics

- Throughput: requests per second the system can process.
- Latency: response time per request.
- Percentiles: p50, p95, p99 give realistic user experience.
- Error rate: fraction of failed requests.
- Saturation: how close resources are to limits.

## 3. Latency Budget

Treat each request as a latency budget distributed across components.

Example budget for a 200 ms p95 endpoint:

- API gateway: 15 ms
- Auth and validation: 20 ms
- Core business logic: 45 ms
- Cache or database access: 90 ms
- Serialization and network overhead: 30 ms

If one component consistently exceeds budget, global latency suffers.

## 4. Common Bottlenecks

- CPU-bound compute hotspots
- Synchronous network fan-out
- Slow database queries or missing indexes
- Lock contention in shared resources
- Cache misses causing database thundering herd
- Chatty service-to-service calls

## 5. Practical Scaling Patterns

- Stateless app tier behind load balancer
- Read-through or cache-aside caching
- Database read replicas
- Partitioning/sharding by key
- Async processing via queues and workers
- CDN for static and edge-cachable content

![Scalable architecture with clients, load balancer, stateless app tier, cache, primary database, read replicas, and async workers.](./assets/scalability-performance.png)

*Figure 1: Scalability and Performance Architecture*

## 6. Useful Queueing Intuition

As utilization approaches 100%, latency rises sharply. Keep critical services below full saturation, especially under bursty traffic.

## 7. Performance Tuning Workflow

1. Measure baseline with p95 and p99.
2. Identify top bottleneck from traces/metrics.
3. Change one thing at a time.
4. Re-measure under representative load.
5. Keep regression tests for latency-sensitive paths.

## 8. Interview Framing

When discussing scalability:

1. Clarify expected QPS, peak multiplier, and growth horizon.
2. Define read/write ratio and data size assumptions.
3. Describe bottleneck boundaries.
4. Explain how the architecture scales each tier.
5. Mention fallback behavior under overload.

## 9. Quick Pitfalls

- Optimizing average latency while ignoring p99.
- Scaling app servers while database stays single-node.
- No backpressure strategy for bursts.
- Ignoring cache invalidation and consistency impact.
