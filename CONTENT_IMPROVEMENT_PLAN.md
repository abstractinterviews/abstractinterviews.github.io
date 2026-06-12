# Content Improvement Plan

This plan converts Abstract Interviews from a concept-reference site into a practical interview-preparation platform while preserving front matter, URLs, and navigation.

## Principles

- Prefer structured Markdown and metadata-driven rendering over page-specific HTML.
- Teach decision-making, not definitions.
- Every topic should answer: why it exists, how it works, where it fails, and how to explain it in an interview.
- Keep diagrams close to the concept they explain.
- End every page with revision material and flashcards.

## Phase 1: Baseline Content Standard

Completed by this migration:

- Classified 222 Markdown pages by content type.
- Replaced or added reusable interview-readiness modules in topic pages.
- Added Mermaid diagrams, tradeoff framing, production considerations, common mistakes, failure modes, interview questions, follow-ups, quick revision, and flashcards.
- Generated `CONTENT_GAP_REPORT.md` for ongoing editorial tracking.

## Phase 2: Track-Specific Deepening

### Architecture Track

- Add richer page metadata for right-rail summaries, related topics, and go-deeper prompts.
- Expand each architecture page with concrete company-style examples, migration paths, cost modeling, and operational runbooks.
- Keep the architecture diagram and sequence diagram as first-class content blocks.

### System Design Track

- For concept pages, emphasize request flow, failure scenarios, scaling bottlenecks, monitoring, and interview probes.
- For problem pages, standardize requirements, capacity estimation, APIs, data model, HLD, deep dives, bottlenecks, multi-region strategy, and alternatives.

### Coding Round Track

- Organize pages by pattern recognition signals, invariant, reusable template, complexity proof, edge cases, and problem progression.
- Add language-specific notes where the implementation changes memory, ordering, concurrency, or runtime guarantees.

### Data Structures Track

- Add visualizations, memory layout, operation tables, variants, and production mappings such as indexes, caches, queues, schedulers, and runtimes.
- Promote senior gotchas like hash collisions, mutable keys, cache locality, allocator overhead, and adversarial inputs into callouts.

### Design Pattern Track

- Standardize each pattern around problem pressure, bad design smell, solution structure, UML, code sketch, pros, cons, tradeoffs, and interview discussion.

## Phase 3: UX and Metadata Alignment

- Move repeated visual sections into front matter where the layout supports them.
- Use Markdown content for substance and metadata arrays for cards, tabs, right-rail summaries, problem groups, and related topics.
- Avoid hardcoded HTML inside Markdown except where existing layouts explicitly require it.

## Quality Gates

- Build must pass with `bundle exec jekyll build`.
- No page should lose front matter, permalink, title, or navigation metadata.
- Every major topic should include at least one Mermaid diagram.
- Every topic page should end with Quick Revision and 10 Flashcards.
- Content should be interview-answer driven: constraints, tradeoffs, failure modes, and production implications.

## Editorial Backlog

1. Replace remaining generic examples with page-specific examples for the top 30 traffic pages.
2. Add language tabs for coding/data-structure pages where runtime differences matter.
3. Add interactive problem progressions and answer frameworks to coding pages.
4. Add company-style case studies to architecture and system design pages.
5. Convert mature repeated Markdown structures into reusable metadata-driven components.
