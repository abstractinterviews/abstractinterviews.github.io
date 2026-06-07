---
layout: default
title: "Case Studies"
---

# Case Studies

This section contains full system design walkthroughs for common interview prompts, with enough structure to practice both a five-minute and a fifteen-minute answer.

## Available Walkthroughs

```text
Create a cover infographic titled "System Design Case Studies". Show cards for E-Commerce Inventory and URL Shortener with small architecture thumbnails and challenge tags (overselling, distributed stock, redirects at scale, ID generation). Add an interview timer strip showing 5-minute and 15-minute practice modes. Style: editorial tech visual, white background, bold but clean typography, 16:9.
```

- [E-Commerce Inventory Management](./ecommerce-inventory-management-system/)
- [URL Shortener](./url-shortener/)
- [Chat / Messaging](./chat-messaging/)
- [Notification Service](./notification-service/)
- [Rate Limiter](./rate-limiter/)
- [News Feed](./news-feed/)
- [Distributed Cache](./distributed-cache/)
- [API Gateway](./api-gateway/)

## What Each Walkthrough Should Cover

| Part | What To Explain |
| --- | --- |
| Problem statement | Who uses the system and what success looks like |
| Requirements | Functional scope and non-functional constraints |
| High-level design | Main services and data flow |
| Deep dive | One or two critical bottlenecks or trade-offs |
| Wrap-up | Failure behavior, scaling path, and monitoring |

## How To Practice

1. Read the prompt and restate the requirements before drawing anything.
2. Draw the minimal architecture first, then add scale and resilience.
3. Compare your design against the listed walkthrough to see what you missed.
4. Rehearse the same prompt twice: once quickly and once with deeper reasoning.

## Choosing A Walkthrough

- Pick URL shortener or rate limiter when you want a smaller, infrastructure-heavy problem.
- Pick chat, notification, or news feed when you want to reason about fan-out and real-time delivery.
- Pick e-commerce inventory when you want to discuss correctness, stock consistency, and oversell prevention.
- Pick API gateway or distributed cache when you want to focus on shared platform primitives.

## How to Study

1. Read the problem statement and requirements first.
2. Follow the high-level design before reading the deep dive.
3. Compare the trade-offs section against your own design choices.
4. Practice explaining the system in 5 minutes and then in 15 minutes.

