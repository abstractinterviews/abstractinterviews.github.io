---
layout: default
title: "Distributed Transactions"
page_type: deep-dive-post
subtitle: "Coordinate writes across services when a single database transaction is not enough."
difficulty: Advanced
read_time: "8 min read"
---

# Distributed Transactions

Distributed writes across services need consistency patterns beyond a single DB transaction. The right choice depends on whether the business requires strict atomicity or can tolerate eventual consistency.

![Figure 1 - 2PC vs Saga Pattern](../assets/2pc-vs-saga-pattern.png)

*Figure 1: Comparison of two-phase commit coordinator flow and saga compensation workflow.*

## 1. Why They Are Hard

- Multiple services own different data stores.
- Network calls can time out after work succeeds.
- Retries can duplicate side effects.
- Locks held across services reduce availability.
- Partial failure is normal, not exceptional.

## 2. Options

| Pattern | Use When | Cost |
| --- | --- | --- |
| Single owner transaction | One service can own the invariant | Requires boundary discipline |
| 2PC | Strict atomicity across resources is mandatory | Blocking and coordinator coupling |
| Saga | Workflow can be compensated | Eventual consistency and business rollback logic |
| Outbox | Need reliable event publish after DB write | Relay and idempotent consumers required |

## 3. Two-Phase Commit

2PC asks participants to prepare, then commit. It gives strong atomicity, but participants can block while waiting for the coordinator. Use sparingly for high-value invariants where availability trade-offs are acceptable.

## 4. Saga Pattern

A saga breaks a workflow into local transactions. If a later step fails, earlier steps are semantically undone with compensation.

- Reserve inventory.
- Charge payment.
- Create shipment.
- If shipment fails, refund payment and release inventory.

## 5. Idempotency and Recovery

Every distributed transaction strategy needs replay safety.

- Give each command a unique idempotency key.
- Store workflow state durably.
- Make consumers idempotent.
- Reconcile stuck workflows with background jobs.

## 6. Interview Framing

Start by naming the invariant. If it must be atomic, discuss 2PC or a single-owner boundary. If it can converge, choose saga/outbox and describe compensation, retries, idempotency, and reconciliation.
