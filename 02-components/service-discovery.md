# Service Discovery and Health Checks

In dynamic distributed systems, service instances appear and disappear frequently. Discovery and health checks ensure clients route traffic only to healthy instances.

## 1. Service Discovery Models

```text
Create a service discovery and health check diagram. Show service instances registering with a registry, heartbeats, readiness and liveness probes, and traffic routing through load balancer/service mesh. Include failure path where unhealthy instances are removed. Style: distributed systems architecture diagram, clean typography, white background, blue/amber accents, 16:9.
```

## Client-side discovery

- Client queries registry (or receives endpoints) and load-balances locally.

Pros:

- Fine-grained control

Cons:

- More client complexity

## Server-side discovery

- Client sends request to load balancer/proxy.
- Proxy discovers healthy backends.

Pros:

- Simpler clients
- Centralized policy

Cons:

- More responsibility on proxy layer

## 2. Service Registry

Registry stores active instances and metadata:

- Service name
- Host/port
- Version/zone
- Health status
- TTL/heartbeat

Instances register at startup and heartbeat periodically.

## 3. Health Check Types

- Liveness: process is alive
- Readiness: instance is ready for traffic
- Startup: app is initialized and warmed up

Avoid expensive dependency checks in high-frequency liveness probes.

## 4. Heartbeats and Timeouts

- Short heartbeat intervals detect failure quickly.
- Too aggressive intervals can create churn.
- Tune expiration and grace windows to reduce false positives.

## 5. Service Mesh and Sidecars

Service meshes can provide:

- Built-in discovery
- mTLS
- Retry and timeout policies
- Traffic shaping and canary support
- Rich telemetry

Trade-off: operational complexity.

## 6. Failure Scenarios

- Registry partition or outage
- Stale endpoints in client caches
- Cascading retries when unhealthy instances are still routed
- Probe misconfiguration causing healthy instances to be ejected

Mitigations:

- Local endpoint cache with TTL
- Retry budget and circuit breakers
- Conservative readiness transitions
- Registry high availability deployment

## 7. Interview Framing

1. Explain discovery model choice.
2. Explain registration and heartbeat flow.
3. Explain liveness/readiness behavior.
4. Explain stale-endpoint and registry-failure handling.
5. Mention metrics: success rate, endpoint churn, probe failure ratio.
