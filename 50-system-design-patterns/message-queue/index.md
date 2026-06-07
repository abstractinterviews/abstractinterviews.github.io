---
layout: default
title: "Message Queue (Asynchronous)"
date: 2026-06-07
category: Patterns
---

Producers enqueue messages; consumers process them asynchronously at their own pace, decoupling services.

When to use:
- Background processing, smoothing bursts, and decoupling components (email, image processing).

Trade-offs:
- Added operational components and eventual processing delays; ordering and delivery semantics need care.

## Example
- Example: An image upload service places jobs on a queue; worker processes resize images and store results asynchronously.

## Diagram
```mermaid
flowchart LR
	Uploader[User Upload] --> Queue[Message Queue]
	Queue --> Worker[Image Worker]
	Worker --> Storage[Object Store]
```
