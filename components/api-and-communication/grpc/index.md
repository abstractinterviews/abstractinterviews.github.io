---
layout: default
title: "gRPC and Protobuf"
page_type: deep-dive-post
subtitle: "Use typed contracts and HTTP/2 for efficient service-to-service communication."
difficulty: Intermediate
read_time: "8 min read"
---

# gRPC and Protobuf

gRPC is strongly typed RPC over HTTP/2 using Protobuf contracts. It is a strong fit for internal service-to-service communication where teams want explicit schemas and efficient transport.

![Figure 1 - gRPC Contract Flow](../assets/grpc-control-flow.png)

*Figure 1: Client and server generated stubs from protobuf schema with unary and streaming calls.*

## 1. When It Fits

- Low-latency internal service calls
- Strong contracts across teams
- High-throughput microservice traffic
- Bidirectional or server-streaming use cases
- Polyglot services that need generated clients

## 2. Contract Design

Protobuf schemas are the product contract.

- Reserve removed field numbers and names.
- Add fields instead of renaming or changing meaning.
- Keep messages small and explicit.
- Version APIs by package/service when behavior changes significantly.

## 3. Call Types

| Type | Shape | Common Use |
| --- | --- | --- |
| Unary | One request, one response | Service lookup or command |
| Server streaming | One request, many responses | Feed updates or export |
| Client streaming | Many requests, one response | Upload or aggregation |
| Bidirectional streaming | Many requests, many responses | Realtime coordination |

## 4. Operational Concerns

- Propagate deadlines and cancellation.
- Configure retries only for idempotent calls.
- Use load balancing that understands HTTP/2 connection behavior.
- Add interceptors for auth, tracing, metrics, and request logging.
- Keep reflection/debug tooling available in non-production environments.

## 5. Trade-Offs

| Benefit | Cost |
| --- | --- |
| Efficient binary encoding | Harder manual debugging |
| Strong generated contracts | Schema discipline required |
| Streaming support | More complex client behavior |
| Great internal APIs | Browser clients usually need a gateway |

## 6. Interview Framing

Use gRPC when the system has many internal calls, strict contracts, or streaming needs. Compare it against REST by naming operational cost, browser support, observability, and schema evolution.
