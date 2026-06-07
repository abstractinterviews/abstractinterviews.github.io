---
layout: default
title: "Common Mistakes to Avoid"
---

# Common Mistakes to Avoid

These are the mistakes that make an answer feel superficial, even when the individual components are technically correct.

## Common Errors

- Jumping to technologies before requirements.
- Ignoring p95/p99 tail latency.
- Skipping failure and recovery discussion.
- Overdesigning without scale assumptions.
- Missing trade-off articulation.

## Better Alternatives

| Mistake | Better Approach |
| --- | --- |
| Start with tools | Start with workloads and constraints |
| Focus on average latency | Discuss tail latency and saturation |
| Assume happy path only | Describe retries, fallbacks, and overload |
| Make every system the same | Tune the design to the problem |

```text
Figure Name: Figure 1 - Common Mistakes Radar
Alt Text: Visual radar of frequent system design interview mistakes and prevention cues.
Create infographic with mistake categories and corrective actions.
```

## Interview Fix

1. State the problem in your own words.
2. Ask about scale, freshness, consistency, and availability.
3. Explain why a choice is good, not just what the choice is.
4. Close with the biggest limitation of your design.

