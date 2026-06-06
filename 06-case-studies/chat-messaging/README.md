# Chat / Messaging System

Focus: low-latency delivery, presence, ordering, offline sync.

```text
Figure Name: Figure 1 - Chat System Architecture
Alt Text: Real-time chat architecture with websocket gateway, message broker, presence, and storage.
Create end-to-end architecture for chat with online/offline message flow and delivery acknowledgments.
```

## Core Design

- WebSocket gateway for realtime transport
- Message broker for fan-out
- Per-conversation ordering strategy
- Offline queue + push notifications
