# High Availability and Fault Tolerance

High availability (HA) means the system remains usable despite failures. Fault tolerance means the system can continue operating when components fail.

## 1. Availability Targets

Availability is commonly expressed as a percentage:

- 99.9%: about 43.8 minutes/month downtime
- 99.99%: about 4.38 minutes/month downtime
- 99.999%: about 26.3 seconds/month downtime

Higher targets require stronger redundancy and faster recovery.

## 2. Core HA Patterns

- Redundancy across instances, zones, and regions
- Health checks and automatic failover
- Stateless service nodes behind load balancer
- Data replication with leader failover
- Circuit breakers and bulkheads
- Retry with backoff and jitter
- Timeouts on every remote call

![High-availability deployment across zones with failover paths, replicated data tier, and resilience mechanisms.](./assets/highavailability-fault-tolerance.png)

*Figure 1: High Availability and Fault Tolerance Design*

## 3. Failure Domains

Design to isolate failures at multiple levels:

- Process crash
- Host failure
- Zone outage
- Region outage
- Dependency outage (database, cache, queue)

The broader the failure domain, the stronger your recovery plan must be.

## 4. Reliability Building Blocks

- Graceful degradation: serve reduced functionality instead of total failure.
- Backpressure: protect downstream systems under load.
- Idempotency: safe retries without duplicate side effects.
- Dead-letter queues: isolate poison messages for later handling.
- Reconciliation jobs: repair drift between systems.

## 5. SLO, SLA, and Error Budget

- SLA: contractual commitment.
- SLO: internal target objective.
- Error budget: allowable failure within SLO window.

Error budgets help balance feature velocity and reliability work.

## 6. Example Incident Mindset

If a cache tier fails:

1. Increase timeout protection and fallback logic.
2. Shed non-critical traffic.
3. Temporarily reduce expensive features.
4. Protect database with strict rate limits.
5. Restore cache and warm hotspots safely.

## 7. Interview Framing

1. State target uptime and latency SLO.
2. Define failure domains and blast radius.
3. Explain failover and degradation behavior.
4. Cover retry/idempotency semantics.
5. Explain detection, alerting, and recovery playbook.

## 8. Common Mistakes

- No timeouts between services.
- Infinite retries creating retry storms.
- Assuming replication alone guarantees availability.
- Missing runbooks and unreliable failover drills.
