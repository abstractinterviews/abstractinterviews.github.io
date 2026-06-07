---
layout: default
title: "Core Components"
page_type: deep-dive-index
deep_dive_id: core_components
deep_title: "Deep Dive: Core Components"
subtitle: "Reusable infrastructure building blocks that appear in most system design interviews."
hero_icon: "C"
badges:
  - Fundamental
  - Infrastructure
  - "~50 min read"
stats:
  - value: "8"
    label: "Sub Topics"
  - value: "7+"
    label: "Diagrams"
  - value: "12"
    label: "Patterns"
  - value: "20+"
    label: "Trade-offs"
overview: "Core components are the reusable infrastructure pieces behind scalable systems. Learn when to use them, how they fail, and how to combine them into practical designs."
key_takeaways:
  - Know when each component is needed
  - Explain failure modes clearly
  - Connect components into one design story
  - Mention observability and safeguards
subtopics:
  - title: "Load Balancers"
    description: "Distribute traffic across healthy backends for scale and availability."
    read_time: "10 min read"
    url: "/components/load-balancers/"
    icon: "L"
    color: "violet"
  - title: "Caching Strategies"
    description: "Reduce latency and database load with cache patterns and policies."
    read_time: "25 min read"
    url: "/components/caching/"
    icon: "C"
    color: "green"
  - title: "CDN and Edge Computing"
    description: "Cache and compute closer to users to reduce origin pressure."
    read_time: "9 min read"
    url: "/components/cdn/"
    icon: "E"
    color: "blue"
  - title: "Message Queues and Event Streaming"
    description: "Decouple services and process work asynchronously."
    read_time: "10 min read"
    url: "/components/message-queues/"
    icon: "Q"
    color: "amber"
  - title: "Rate Limiting"
    description: "Protect systems from overload, abuse, and noisy neighbors."
    read_time: "9 min read"
    url: "/components/rate-limiting/"
    icon: "R"
    color: "red"
  - title: "Service Discovery and Health Checks"
    description: "Route clients to healthy instances in dynamic infrastructure."
    read_time: "8 min read"
    url: "/components/service-discovery/"
    icon: "S"
    color: "green"
  - title: "API and Communication"
    description: "Choose protocols, API styles, and edge policies for distributed systems."
    read_time: "30 min read"
    url: "/components/api-and-communication/"
    icon: "A"
    color: "blue"
  - title: "Databases"
    description: "Choose storage models, sharding, replication, and transaction patterns."
    read_time: "35 min read"
    url: "/components/databases/"
    icon: "D"
    color: "violet"
related_concepts:
  - title: "Databases"
    url: "/components/databases/"
  - title: "API Gateway"
    url: "/components/api-and-communication/api-gateway/"
  - title: "Distributed Patterns"
    url: "/fundamentals/patterns/"
---

# Core Components

This section covers reusable infrastructure building blocks that appear in most system design interviews.

## Topic: Topic Map

### Sub-topic: Section Directory

- [Load Balancers](./load-balancers/)
- [Caching Strategies](./caching/)
- [CDN and Edge Computing](./cdn/)
- [Message Queues and Event Streaming](./message-queues/)
- [Rate Limiting](./rate-limiting/)
- [Service Discovery and Health Checks](./service-discovery/)

![Figure 1 - Core Components in System Design](./assets/core-components-in-system-design.png)


## Topic: Study Path

### Sub-topic: Recommended Sequence

1. Learn when each component is needed.
2. Learn failure modes for each component.
3. Practice combining two or three components into one design story.

## Topic: Interview Checklist

### Sub-topic: Answer Structure

- Explain why the component exists in your design.
- Mention at least one trade-off and one failure scenario.
- Describe observability and operational safeguards.

