---
layout: default
title: "API Gateway"
page_type: deep-dive-post
subtitle: "Centralize auth, routing, throttling, and observability at the service edge."
difficulty: Intermediate
read_time: "7 min read"
---

# API Gateway

API gateway is the policy edge for auth, routing, throttling, request shaping, and observability before traffic reaches backend services.

![Figure 1 - API Gateway Control Plane](../assets/api-gateway-control-plane.png)

*Figure 1: Gateway handling authentication, rate limits, routing, and metrics before backend services.*

## Topic: Responsibilities

### Sub-topic: Key Idea

- Authentication and authorization
- Request validation
- Rate limiting and quotas
- TLS termination and routing
- Response shaping and headers
- Tracing, access logs, and request metrics

## Topic: Request Flow

### Sub-topic: Request Flow

1. Terminate TLS and parse request.
2. Authenticate caller and attach identity claims.
3. Enforce rate limits and quotas.
4. Route to the correct backend version.
5. Apply timeout, retry, and circuit-breaker policy.
6. Emit metrics, logs, and traces.

## Topic: Policy Placement

### Sub-topic: Options and Selection

| Policy | Gateway | Service |
| --- | --- | --- |
| Authentication | Usually yes | Verify trusted claims |
| Business authorization | Sometimes | Usually yes |
| Input validation | Basic shape | Domain invariants |
| Rate limiting | Global and tenant limits | Operation-specific limits |
| Response shaping | Client compatibility | Domain response |

## Topic: Failure Design

### Sub-topic: System Shape

- Fail-open vs fail-closed policy per endpoint
- Timeout budgets and circuit breaking
- Global error shape and tracing IDs
- Safe config rollout and rollback
- Degraded routing when a backend is partially unavailable

## Topic: Operational Risks

### Sub-topic: Failure Awareness

- Gateway becomes a bottleneck or single point of failure.
- Too much business logic accumulates at the edge.
- Misconfigured retries amplify outages.
- Centralized auth failure can block the whole product.

## Topic: Interview Framing

### Sub-topic: Answer Structure

Use a gateway when many clients and services need shared policy enforcement. Explain what stays at the edge, what belongs in services, and how the gateway scales and fails safely.
