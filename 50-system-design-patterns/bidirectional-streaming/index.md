---
layout: default
title: "Bidirectional Streaming (WebSockets / gRPC Streaming)"
date: 2026-06-07
category: Patterns
---

Persistent two-way channels allowing both client and server to send messages at any time.

When to use:
- Real-time chat, multiplayer games, collaborative editing.

Trade-offs:
- Requires infrastructure to manage many persistent connections and reconnections.

Related: /50-system-design-patterns/

## Example
- Example: A chat server uses WebSockets so clients and servers can exchange messages in real time.

## Diagram
```mermaid
sequenceDiagram
	Client<->>Server: open WebSocket
	Client->>Server: send(message)
	Server->>Client: deliver(message)
```
