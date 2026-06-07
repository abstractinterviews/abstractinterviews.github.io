---
layout: default
title: "WebSockets and Real-Time"
---

# WebSockets and Real-Time

WebSockets keep persistent full-duplex connections for low-latency push communication.

![Figure 1 - Real-Time Messaging Path](./assets/realtime-messaging-path.png)

*Figure 1: Persistent websocket connection flow through gateway to pub-sub and presence services.*

## Core Concerns

- Connection scaling and sharding
- Heartbeats and idle timeout
- Ordering guarantees per channel
- Offline delivery and reconnect replay

## Practical Patterns

- Stateless gateway + shared pub/sub
- Token-based connection auth
- Backpressure for slow consumers

