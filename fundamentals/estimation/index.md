---
layout: default
title: "Back-of-the-Envelope Estimation"
page_type: deep-dive-post
subtitle: "Turn rough product assumptions into request, storage, bandwidth, and capacity numbers."
difficulty: Beginner
read_time: "8 min read"
---
# Back-of-the-Envelope Estimation

Estimation is a core interview skill. You do not need exact values; you need defensible approximations to justify architecture choices.

## 1. Estimation Workflow

1. Clarify assumptions.
2. Estimate scale inputs (users, request rate, object size).
3. Compute throughput and storage needs.
4. Apply headroom (2x to 5x) for peaks and growth.
5. Translate numbers into component decisions.

![Back-of-the-envelope estimation workflow from assumptions to RPS, storage, bandwidth, and capacity headroom.](../assets/back-of-envolope-estimation.png)

*Figure 1: Back-of-the-Envelope Estimation Workflow*

## 2. Useful Conversions

- 1 day = 86,400 seconds
- 1 million/day is about 11.6 per second
- 1 billion/day is about 11,574 per second
- 1 KB = 1,024 bytes
- 1 GB is about 10^9 bytes (rough) or 2^30 bytes (binary)

## 3. Throughput Example

Given:

- 50 million daily active users
- Each user sends 20 requests/day

Daily requests:

- $50,000,000 \times 20 = 1,000,000,000$ requests/day

Average RPS:

- $1,000,000,000 / 86,400 \approx 11,574$ RPS

If peak is 5x average, design peak for about 58,000 RPS.

## 4. Storage Example

Given:

- 100 million new records/day
- Average record size 1.2 KB

Daily storage:

- $100,000,000 \times 1.2$ KB = 120,000,000 KB
- about 120 GB/day (decimal approximation)

One year raw:

- about 43.8 TB/year before replicas/index overhead

## 5. Bandwidth Example

Given:

- 20,000 RPS peak
- average response payload 8 KB

Peak egress:

- $20,000 \times 8$ KB/s = 160,000 KB/s
- about 156 MB/s
- about 1.25 Gbps (rough)

## 6. Capacity Safety Margins

- Keep CPU targets conservative for critical services.
- Plan room for cache miss spikes.
- Consider replication and backup overhead.
- Include growth horizon (for example, 12 to 24 months).

## 7. Interview Communication Template

Use this concise structure:

1. "I will assume X users and Y actions/day."
2. "That gives us average and peak RPS of A and B."
3. "With payload size P, bandwidth is Q."
4. "With record size R, storage growth is S/day and T/year."
5. "So we need sharding/replicas/cache at these thresholds."

## 8. Common Mistakes

- Using average traffic for sizing without peak multiplier.
- Ignoring replication factor in storage.
- Forgetting index overhead.
- Not stating assumptions clearly.

