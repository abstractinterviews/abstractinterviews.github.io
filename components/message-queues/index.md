---
layout: default
title: "Message Queues and Event Streaming"
page_type: deep-dive-post
subtitle: "Decouple services, absorb spikes, and process events asynchronously."
difficulty: Intermediate
read_time: "10 min read"
---

# Message Queues and Event Streaming

Queues and streams decouple services, absorb spikes, and enable asynchronous processing.

## Topic: Asynchronous System Boundaries

### Sub-topic: Queue vs Stream Decision

Use queues when each job should be processed by one worker, and use streams when many consumers need independent replayable access to the same event history.

## 1. Queue vs Stream

![Side-by-side comparison of message queue flow and event stream architecture.](../assets/message-queue-vs-event-stream.png)

*Figure 1: Message Queue vs Event Stream*

## Message queue

- Work-distribution model
- Consumer processes and acknowledges message
- Often used for background jobs and task execution

## Event stream

- Append-only log model
- Multiple consumers can read independently
- Often used for event-driven architectures and analytics

## 2. Why Use Them

### Sub-topic: Workload Fit

| Workload | Better Primitive | Why |
| --- | --- | --- |
| Background jobs | Queue | Work distribution and retries |
| Event-driven projections | Stream | Replay and multi-consumer fan-out |
| Analytics ingestion | Stream | Ordered append log and retention |

- Smooth traffic spikes
- Isolate slow downstream dependencies
- Improve system modularity
- Enable retries and failure recovery
- Support fan-out to multiple consumers

## 3. Delivery Semantics

- At-most-once: may lose messages, no duplicates
- At-least-once: no loss preferred, duplicates possible
- Exactly-once: strongest semantics, highest complexity

Most practical systems use at-least-once plus idempotent consumers.

## 4. Ordering Guarantees

- Global ordering is expensive and often unnecessary.
- Partition-level ordering is common and practical.
- Use a stable partition key for entity-level ordering.

## 5. Retry and Dead Letter Strategy

1. Retry transient failures with backoff and jitter.
2. Cap retry attempts.
3. Send poison messages to dead-letter queue.
4. Provide replay tooling for recovery.

## 6. Consumer Design Rules

- Make handlers idempotent.
- Keep processing bounded and observable.
- Commit offsets/acks only after successful processing.
- Support safe reprocessing.

## 7. Backpressure

### Sub-topic: Protective Controls

Define explicit limits on producer throughput and consumer concurrency. Without admission control, lag can grow faster than autoscaling can recover.

Use queue length and processing lag to trigger scaling and admission control.

Important metrics:

- Consumer lag
- Oldest message age
- Retry volume
- Dead-letter rate

## 8. Interview Framing

1. Explain why async is needed.
2. Choose queue or stream model.
3. Define delivery and ordering requirements.
4. Explain retry, DLQ, and replay model.
5. Explain consumer idempotency.

