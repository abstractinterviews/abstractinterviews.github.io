---
layout: default
title: "Notification Service"
---

# Notification Service

Focus: multi-channel fan-out, deduplication, retries, preference controls.

```text
Figure Name: Figure 1 - Notification Pipeline
Alt Text: Notification service pipeline with channel router, retry queues, dedup store, and provider adapters.
Create architecture showing event intake, template render, channel routing, retries, and delivery status tracking.
```

## Core Design

- Event ingestion API
- Template rendering
- Channel adapters (email, SMS, push)
- Retry + DLQ + suppression rules

