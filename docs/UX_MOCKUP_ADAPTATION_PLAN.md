# UX Mockup Adaptation Plan

Status: proposed  
Prepared: 2026-06-19  
Scope: adapt the supplied desktop mockups to Abstract Interviews while preserving Markdown-first authoring.

## 1. Outcome

Adopt the mockups as a reusable Jekyll design system, not as six hand-built pages. Authors will write normal Markdown and a small, documented front matter block. Jekyll layouts, includes, and generators will create the application shell, hero, tabs, cards, table of contents, right rail, breadcrumbs, related content, and responsive behavior.

The finished authoring contract is:

- page content lives in Markdown headings, paragraphs, lists, tables, code fences, Mermaid fences, images, and blockquotes;
- front matter contains page identity and genuinely structured metadata only;
- no page requires custom HTML;
- repeated or inferable information is generated rather than copied into front matter;
- presentation classes and markup live only in `_layouts`, `_includes`, CSS, and JavaScript.

## 2. What the mockups establish

### Shared shell

All six screens use the same desktop frame:

- fixed left navigation with brand, primary sections, progress/promo card, and theme control;
- sticky top bar with search and utility actions;
- a wide central canvas;
- an optional right rail for the table of contents and contextual cards;
- restrained white/gray surfaces, navy text, blue as the primary action color, colored semantic badges, thin borders, and soft shadows.

The shell should be implemented once. Active navigation must come from page metadata or URL ancestry, not page-authored HTML.

### Screen families

| Mockup | Proposed page family | Existing content example | Distinctive modules |
| --- | --- | --- | --- |
| Home | `home` | `/index.md` | learning staircase, roadmap, popular tracks, continue learning, quick actions, recent articles |
| Data Structures | `track` | `/data-structures/index.md` | topic grid, progress, quick links, popular/recent articles, recommended next |
| System Design | `track` | `/architecture/index.md` or `/fundamentals/index.md` | learning path, popular designs, practice problems, article list |
| Queue | `topic` | `/coding-round/data-structures/queues/index.md` | hero visual, section tabs, Markdown article, complexity summary, related/next topics |
| Architecture Patterns | `track` | `/architecture/styles/index.md` | pattern grid, comparison CTA, popular patterns, related topics |
| TinyURL | `case-study` | `/case-studies/url-shortener/index.md` | difficulty and tags, bookmark action, architecture diagram, numbered content, key concepts, related designs |

This yields four renderer modes (`home`, `track`, `topic`, and `case-study`), with `topic` and `case-study` sharing most of the article renderer. It replaces the current growing list of narrowly named modes such as `deep-dive-index`, `deep-dive-post`, `data-structure-overview`, `data-structure-topic`, and `solution`.

### Visual interpretation

- The mockups are a direction, not a pixel contract. Keep their hierarchy, density, spacing, and component relationships while using the site's real taxonomy and content.
- Diagrams should be authored as Mermaid or referenced images. Decorative hero illustrations belong to the theme and may be selected by a front matter key; authors should not construct them with HTML.
- Progress, bookmarks, continue-learning, theme, and search are behaviors rather than article content. They belong to shared JavaScript and local storage initially, with an API-compatible boundary for future accounts.
- The supplied views are desktop-first. Responsive specifications must be added during implementation: collapse the left rail, move utilities into a mobile header, hide or drawer the right rail, allow horizontal tab scrolling, and stack card grids.

## 3. Findings in the current project

The repository already has useful foundations:

- Jekyll with Kramdown/GFM and Rouge;
- a shared application shell in `_layouts/default.html`;
- specialized includes for solution, concept, data-structure, and deep-dive pages;
- Markdown-derived rendering for some solutions and concepts in `_plugins/solution_data_generator.rb`;
- Mermaid, tables, code fences, and responsive CSS support;
- 227 Markdown files and only eight template files, so the content base is already predominantly Markdown.

The adaptation should also correct current friction:

- `index.md` contains substantial structural HTML and is the clearest violation of the target authoring model;
- page type and breadcrumbs are partly inferred from URL string checks in the main layout;
- `_layouts/default.html` owns shell, routing, page rendering, right rails, and behavior, making it difficult to evolve safely;
- several page types represent styling differences rather than meaningful content models;
- rich pages can require large arrays in front matter, which moves article content out of Markdown;
- navigation and table-of-contents logic is duplicated across renderers;
- generated `_data/solutions` files are written into the source tree during builds, although they are derived artifacts.

## 4. Authoring model

### Minimal front matter

Every enhanced page should need only identity metadata:

```yaml
---
title: Queue
description: First-in-first-out state for traversal and buffering.
kind: topic
track: data-structures
difficulty: beginner
tags: [linear-data-structure, fifo]
---
```

Defaults in `_config.yml` should infer `layout: default` and, where practical, `kind` and `track` from directory scope. Authors should not need to repeat `layout`, `slug`, categories, or a title inside both front matter and the Markdown body.

### Optional front matter

Use optional fields only when Markdown or ancestry cannot express the value:

```yaml
hero:
  visual: queue
  image: /assets/diagrams/queue.svg
badges: [FIFO, Beginner Friendly]
next: /coding-round/data-structures/deques/
featured: true
aliases: [FIFO Queue]
```

Rules:

- `hero.visual` selects a theme-owned decorative preset; `hero.image` references a content image. Use at most one.
- `badges` are short labels, not paragraphs or card data.
- `next` is an escape hatch. The normal previous/next relationship is derived from track ordering.
- `featured` supports generated home and track listings.
- Large arrays of cards, tab definitions, table-of-contents entries, article lists, or repeated summaries are prohibited in page front matter.

### Markdown conventions

The renderer should use normal document structure:

```markdown
## What is a Queue?

A queue follows first in, first out order.

> [!NOTE]
> A printer queue is a familiar real-world example.

## Core Operations

| Operation | Description | Time |
| --- | --- | --- |
| Enqueue | Add at the rear | O(1) |

## Implementation

### Python

```python
from collections import deque
```
```

Generation rules:

- H2 headings create the page table of contents and, when enabled for that family, the horizontal section tabs.
- H3 headings create nested table-of-contents items; language-named H3 headings under an implementation section may become code tabs.
- Markdown tables remain tables; the theme styles them according to context without changing their source.
- GFM alert blockquotes become callouts.
- Mermaid fences become system diagrams.
- the first suitable paragraph supplies an excerpt when `description` is absent;
- reading time is calculated from Markdown text;
- related content is computed from `track`, tags, and explicit Markdown links, with optional overrides only when necessary.

### Track index Markdown

A track landing page should also remain ordinary Markdown:

```markdown
---
title: Data Structures
kind: track
track: data-structures
description: Learn the structures used in coding interviews.
---

## Overview

Choose structures by the operation that dominates the problem.

## Learning Path

1. [Arrays](/coding-round/data-structures/arrays/)
2. [Linked Lists](/coding-round/data-structures/linked-lists/)
3. [Stacks](/coding-round/data-structures/stacks/)

## Featured Topics

- [Queue](/coding-round/data-structures/queues/)
- [Heap](/coding-round/data-structures/heaps/)
```

The renderer upgrades those lists into the cards and path shown in the mockups. Topic descriptions, badges, and counts come from the linked pages' front matter and generated catalog. The index does not duplicate them.

### Home Markdown

Replace the current custom HTML in `index.md` with named Markdown sections and links. The `home` renderer turns them into the staircase, roadmap, track cards, actions, and recent-content modules. Site-wide metrics and recent articles come from the generated catalog, not hard-coded numbers.

## 5. Rendering architecture

### Template boundaries

Refactor toward this shape:

```text
_layouts/
  default.html             # document head only
  app.html                 # application shell

_includes/
  shell/
    sidebar.html
    topbar.html
    mobile-nav.html
  page/
    home.html
    track.html
    article.html
  components/
    breadcrumbs.html
    hero.html
    badges.html
    section-tabs.html
    toc.html
    card-grid.html
    progress-card.html
    related-content.html
    article-list.html
    pager.html
```

Jekyll can use nested layouts (`default` then `app`) or keep one layout with clean includes. The key requirement is that page-family selection occurs in one place and components do not duplicate navigation or TOC logic.

### Generated content catalog

Replace narrow solution/concept parsing with one read-only catalog generator:

1. inspect all Markdown pages after front matter is loaded;
2. normalize `kind`, `track`, title, URL, description, difficulty, tags, featured status, reading time, and headings;
3. derive ancestry, breadcrumbs, track ordering, previous/next, related pages, counts, recent pages, and search records;
4. expose the result as `site.data.catalog` in memory;
5. do not write derived YAML back into `_data` during a normal build.

The current solution parser can remain temporarily behind an adapter so migration is incremental. Once case studies render correctly from Markdown headings, remove the source-tree `_data/solutions` artifacts and their writer.

### Data ownership

| Data | Source of truth |
| --- | --- |
| article prose, code, tables, diagrams, callouts | Markdown body |
| title, description override, kind, track, difficulty, tags | page front matter |
| global navigation labels/order/icons | one `_data/navigation.yml` file |
| track order | track index Markdown links, with optional global fallback |
| breadcrumbs, TOC, tabs, reading time, recent lists, counts | generated catalog |
| progress, bookmarks, theme | browser state initially |
| colors, icons, spacing, markup | theme templates and assets |

### Search

Generate a compact JSON index from the catalog and page text. The first implementation can use a small client-side search library or a dependency-free weighted search. Search title and aliases first, then tags, description, and headings. The top search field and keyboard shortcut must be one shared component.

### Icons and diagrams

- Use a single SVG icon set rendered by an include or SVG sprite; avoid Unicode stand-ins in final UI.
- Use Mermaid for explanatory architecture and flow diagrams whenever text-source diagrams are sufficient.
- Use optimized SVG/WebP/PNG only when a bespoke visual materially improves understanding.
- Decorative illustrations are component assets, never embedded markup in Markdown.

## 6. UX component specification

### Navigation and shell

- Desktop: approximately 220–240 px left rail, flexible content, 260–300 px contextual rail.
- Keep global search visible at the top and sticky.
- Highlight one primary navigation item from the normalized track.
- Theme control must update CSS variables and persist.
- Right rail is sticky within the viewport and omitted when it has no meaningful content.

### Home

- Hero communicates the learning outcome and exposes two clear actions.
- Learning roadmap is generated from the ordered top-level tracks.
- Popular tracks use featured metadata and real article counts.
- Continue Learning reads local progress and disappears gracefully when no progress exists.
- Recent Articles is catalog-driven.
- Do not manufacture activity metrics that the repository cannot substantiate.

### Track pages

- Hero shows title, description, badges, and an optional decorative/diagram visual.
- Cards are generated from linked child pages.
- Learning paths preserve the order of the Markdown list.
- Article and problem lists use catalog queries filtered by track/tags.
- Right-rail modules are selected by available data; empty mockup modules are not rendered.

### Topic and case-study pages

- Preserve the full Markdown article in document order for accessibility and deep linking.
- Horizontal tabs are anchor links, not separate content copies.
- TOC follows H2/H3 headings and highlights the current section with `IntersectionObserver`.
- Complexity, requirements, and trade-offs remain Markdown tables.
- Code stays in fenced blocks with syntax highlighting and a generated copy button.
- Bookmark and progress controls are shared enhancements; the article remains usable with JavaScript disabled.

### Responsive and accessible behavior

- At tablet width, remove the fixed right rail and expose the TOC through a button/drawer.
- At mobile width, collapse the left navigation, stack hero content, use one-column cards, and allow tabs/tables to scroll horizontally.
- Preserve logical DOM and heading order; do not visually reorder content in a way that changes reading order.
- Meet WCAG 2.2 AA contrast, visible focus, 44 px touch targets, keyboard navigation, reduced-motion preferences, and semantic landmark requirements.
- Decorative graphics use empty alternative text or `aria-hidden`; content diagrams require meaningful alternative text or adjacent explanation.

## 7. Implementation phases

### Phase 0 — Baseline and contracts

1. Capture screenshots of representative existing pages at desktop, tablet, and mobile widths.
2. Add a content inventory report for current `page_type` values, structural HTML in Markdown, large front matter blocks, and missing descriptions/tags.
3. Document the final front matter schema and Markdown heading conventions.
4. Add validation that reports unknown kinds, broken internal links, duplicate titles/URLs, invalid difficulty values, and structural HTML in Markdown.

Exit criteria: the schema is agreed, representative pages are selected, and validation can run locally and in CI.

### Phase 1 — Design tokens and shared shell

1. Extract color, type, spacing, border, shadow, radius, width, and responsive tokens into CSS custom properties.
2. Split sidebar, topbar, mobile navigation, breadcrumbs, and right rail from the current default layout.
3. Replace Unicode UI icons with the shared SVG system.
4. Implement responsive shell behavior and accessible theme persistence.

Exit criteria: every existing page still renders in the new shell, with no content migration required.

### Phase 2 — Catalog and Markdown renderer

1. Build the normalized page catalog in a Jekyll generator.
2. Generate breadcrumbs, TOC, section tabs, reading time, related pages, previous/next links, recent lists, and search data.
3. Add the shared `track` and `article` renderers.
4. Keep compatibility mappings from old `page_type` values to the new `kind` values.
5. Add snapshot/unit tests for heading parsing, nested TOC, tables, code fences, Mermaid, and related-page selection.

Exit criteria: Queue and TinyURL reproduce the information architecture of their mockups from Markdown plus minimal front matter.

### Phase 3 — Track experiences

1. Migrate Data Structures to the `track` renderer.
2. Migrate Architecture Patterns to the same renderer.
3. Migrate the System Design landing page, using the appropriate existing taxonomy rather than creating duplicate content.
4. Generate child cards and lists from Markdown links/catalog metadata.

Exit criteria: three track pages share one renderer, contain no custom HTML, and differ only through content and metadata.

### Phase 4 — Home dashboard

1. Rewrite `index.md` as Markdown sections and links.
2. Implement the home hero, roadmap, popular tracks, recent articles, and quick actions as renderer modules.
3. Add local progress and continue-learning as progressive enhancement.
4. Use catalog-derived counts and dates.

Exit criteria: `index.md` contains no structural HTML and the home screen remains useful without JavaScript.

### Phase 5 — Migration and cleanup

1. Map all old page types to the new taxonomy and migrate by directory in small batches.
2. Move oversized content arrays from front matter back into Markdown lists/tables/headings.
3. Remove URL-string page inference after every page has normalized metadata/defaults.
4. Retire obsolete includes, CSS selectors, parser paths, and generated source-tree YAML.
5. Update the authoring guide and add copy-paste Markdown examples for each family.

Exit criteria: no Markdown file uses structural HTML, compatibility code is removed, and the production build has no broken internal links.

### Phase 6 — Verification and polish

1. Compare all six representative screens at 1536 px, 1024 px, 768 px, and 390 px.
2. Test keyboard-only navigation, screen-reader landmarks/headings, zoom to 200%, reduced motion, and light/dark themes.
3. Measure Lighthouse performance, accessibility, best practices, and SEO.
4. Check long titles, deep TOCs, wide tables, large code blocks, missing images, empty related content, and no-progress states.
5. Establish a small visual regression set for home, track, topic, and case-study pages.

Exit criteria: no critical accessibility issues, no horizontal page overflow at mobile widths, and representative pages meet the agreed visual acceptance threshold.

## 8. Migration map

| Current type | Target kind | Notes |
| --- | --- | --- |
| home inferred from `/` | `home` | rewrite structural HTML as Markdown |
| `data-structure-overview` | `track` | child topics from Markdown links/catalog |
| `deep-dive-index` | `track` | remove large `subtopics` arrays where duplicated |
| `data-structure-topic` | `topic` | headings drive tabs and right rail |
| `coding-pattern-topic` | `topic` | same renderer, different track |
| `deep-dive-post` | `topic` | move content-like arrays into Markdown |
| `concept` | `topic` | adapter first, then retire generated concept data |
| `solution` | `case-study` | Markdown headings/tables/Mermaid become the view model |
| `practice`, `practice_problem`, `resource` | `topic` initially | add a new family only if content semantics require it |

## 9. Validation and test strategy

### Build checks

- `bundle exec jekyll build --trace` succeeds;
- internal links and fragment links resolve;
- generated search/catalog JSON is valid and contains no full duplicate article bodies;
- Markdown lint rejects structural HTML tags outside documented legacy allowlists during migration;
- front matter schema validation produces file and field-level errors.

### Renderer fixtures

Maintain four small fixture pages that cover:

- home sections with empty and populated progress states;
- track links, ordered learning path, featured and recent cards;
- topic callouts, tables, Mermaid, multi-language code, deep headings, and related pages;
- case-study requirements, architecture diagram, trade-offs, code, and numbered headings.

### Visual acceptance

- shell proportions and hierarchy match the mockups;
- cards, borders, spacing, badges, and type are consistent across families;
- no content is clipped or duplicated;
- tabs and TOC point to the same canonical article sections;
- empty data produces a sensible omission or fallback rather than placeholder UI.

## 10. Risks and decisions

| Risk | Mitigation |
| --- | --- |
| Front matter becomes a second page body | enforce a small schema; keep prose, lists, tables, and card membership in Markdown |
| Heading-based parsing becomes brittle | parse rendered document structure consistently, document conventions, and test fixtures; avoid page-specific section-name parsers where possible |
| One renderer cannot express every page | use composable modules selected by available content; introduce a new family only for a real semantic difference |
| Mockup-only features imply an account backend | ship progress/bookmarks as local progressive enhancement and keep storage behind a small interface |
| Existing CSS/layout regressions during refactor | compatibility classes, representative snapshots, and phase-by-phase removal |
| Counts or popularity appear authoritative but are invented | derive counts; label curated/featured lists honestly; omit unavailable analytics |
| Source build mutates the repository | keep generated catalog in memory or `_site`, never write derived data into tracked source during normal builds |

## 11. Recommended implementation slice

Start with one vertical slice before rebuilding every surface:

1. shared shell and tokens;
2. normalized catalog fields;
3. one `track` page: Data Structures;
4. one `topic` page: Queue;
5. one `case-study` page: TinyURL;
6. responsive and accessibility verification for those three pages.

This slice exercises every important component in the mockups while limiting migration risk. After it is accepted, Architecture Patterns, System Design, and Home become applications of proven renderers rather than parallel one-off builds.

## 12. Definition of done

The UX adaptation is complete when:

- all six target experiences are produced by the four shared page families;
- page Markdown contains no custom structural HTML;
- front matter follows the documented minimal schema and contains no duplicated article content;
- headings generate the TOC/tabs and Markdown constructs generate content modules;
- search, theme, bookmarks, and progress behave as progressive enhancements;
- desktop, tablet, and mobile layouts are verified;
- WCAG 2.2 AA essentials and keyboard behavior pass;
- the Jekyll build, content validation, link checks, and visual regression suite pass;
- obsolete page-specific rendering and generated source artifacts are removed.
