---
title: "Home"
layout: default
---

<section class="home-hero abstract-hero" id="overview">
  <div class="hero-copy">
    <h1><span>Master</span> the concepts.<br />Ace the interviews.</h1>
    <p>High quality content on System Design, Low Level Design, Architecture, Data Structures, Algorithms and much more.</p>
    <div class="hero-stats">
      <a href="{{ '/fundamentals/' | relative_url }}"><span class="topic-icon blue">▦</span><strong>1200+</strong><small>Topics</small></a>
      <a href="{{ '/components/' | relative_url }}"><span class="topic-icon amber">▧</span><strong>500+</strong><small>Diagrams</small></a>
      <a href="{{ '/coding-round/' | relative_url }}"><span class="topic-icon violet">⌘</span><strong>1000+</strong><small>Practice Problems</small></a>
      <a href="{{ '/interview/' | relative_url }}"><span class="topic-icon green">□</span><strong>Curated</strong><small>For Interviews</small></a>
    </div>
    <label class="mobile-home-search search-box">
      <span aria-hidden="true">⌕</span>
      <input type="search" placeholder="Search topics, patterns, problems..." aria-label="Search resources" />
    </label>
  </div>
  <div class="abstract-hero-visual" aria-hidden="true">
    <span class="tile tile-one">&lt;/&gt;</span>
    <span class="tile tile-two">⌘</span>
    <span class="tile tile-three">▦</span>
    <span class="tile tile-four">▱</span>
    <span class="tile tile-five">⌁</span>
  </div>
</section>

<section class="home-section fundamentals-section" id="fundamentals">
  <h2><span>Fundamentals</span><a class="section-heading-link" href="{{ '/fundamentals/' | relative_url }}">View all</a></h2>
  <div class="fundamental-grid">
    <a class="fundamental-card amber" href="{{ '/data-structures/' | relative_url }}"><span>⌘</span><strong>Data Structures</strong><small>Learn core data structures with visuals and examples.</small><em>85 Topics</em></a>
    <a class="fundamental-card violet" href="{{ '/architecture/styles/' | relative_url }}"><span>◈</span><strong>Architecture Patterns</strong><small>Explore essential architecture patterns and trade-offs.</small><em>60 Topics</em></a>
    <a class="fundamental-card red" href="{{ '/fundamentals/patterns/' | relative_url }}"><span>▧</span><strong>Design Patterns</strong><small>Master classic design patterns with real world examples.</small><em>75 Topics</em></a>
    <a class="fundamental-card blue" href="{{ '/fundamentals/' | relative_url }}"><span>▦</span><strong>System Design Fundamentals</strong><small>Building blocks of scalable and reliable systems.</small><em>70 Topics</em></a>
    <a class="fundamental-card view-all" href="{{ '/fundamentals/' | relative_url }}"><strong>View All Fundamentals</strong><small>See all topics across fundamentals.</small><b aria-hidden="true">→</b></a>
  </div>
</section>

<section class="home-section" id="deep-dives">
  <h2><span>Deep Dive</span><a class="section-heading-link" href="{{ '/components/' | relative_url }}">View all</a></h2>
  <p class="section-subtitle">In-depth coverage of important interview topics.</p>
  <div class="deep-card-grid">
    <a class="deep-card" href="{{ '/components/caching/' | relative_url }}"><span class="mini-diagram flow">User App Cache DB</span><strong>Caching</strong><small>Strategies, patterns, cache invalidation, and real world implementations.</small><em>25 min read <b>Intermediate</b></em></a>
    <a class="deep-card" href="{{ '/components/message-queues/' | relative_url }}"><span class="mini-diagram queue">API SX MQ W</span><strong>Message Queues</strong><small>Message brokers, queues, pub/sub and reliable messaging.</small><em>30 min read <b>Intermediate</b></em></a>
    <a class="deep-card" href="{{ '/components/databases/' | relative_url }}"><span class="mini-diagram tree">Query Index Scan</span><strong>Database Indexing</strong><small>Indexing techniques and query performance optimization.</small><em>28 min read <b>Intermediate</b></em></a>
    <a class="deep-card" href="{{ '/50-system-design-patterns/consistent-hashing/' | relative_url }}"><span class="mini-diagram ring">Hash Ring</span><strong>Consistent Hashing</strong><small>Distributed hashing technique for scalable fault tolerant systems.</small><em>20 min read <b>Intermediate</b></em></a>
    <a class="deep-card" href="{{ '/fundamentals/patterns/cqrs/' | relative_url }}"><span class="mini-diagram split">Write Model → Read Model</span><strong>CQRS Pattern</strong><small>Deep dive into Command Query Responsibility Segregation pattern.</small><em>22 min read <b>Advanced</b></em></a>
  </div>
</section>

<section class="home-section lower-dashboard" id="learning-paths">
  <div>
    <h2><span>Learning Paths</span><a class="section-heading-link" href="{{ '/interview/' | relative_url }}">View all</a></h2>
    <p class="section-subtitle">Structured paths to master key domains.</p>
    <div class="learning-list">
      <a href="{{ '/fundamentals/' | relative_url }}"><span class="topic-icon blue">▱</span><strong>System Design Roadmap</strong><small>Beginner to Advanced · 28 chapters</small><b>›</b></a>
      <a href="{{ '/components/' | relative_url }}"><span class="topic-icon green">◈</span><strong>Low Level Design Roadmap</strong><small>Beginner to Advanced · 24 chapters</small><b>›</b></a>
      <a href="{{ '/data-structures/' | relative_url }}"><span class="topic-icon amber">⌘</span><strong>Data Structures Roadmap</strong><small>Beginner to Advanced · 20 chapters</small><b>›</b></a>
      <a href="{{ '/architecture/' | relative_url }}"><span class="topic-icon violet">▧</span><strong>Backend Developer Roadmap</strong><small>Complete backend interview prep</small><b>›</b></a>
    </div>
  </div>
  <div>
    <h2><span>Interview Practice</span><a class="section-heading-link" href="{{ '/coding-round/' | relative_url }}">View all</a></h2>
    <p class="section-subtitle">Sharpen your skills with curated practice.</p>
    <div class="practice-grid">
      <a href="{{ '/case-studies/' | relative_url }}"><span class="topic-icon blue">□</span><strong>System Design Problems</strong><small>50+ problems</small><b>›</b></a>
      <a href="{{ '/coding-round/' | relative_url }}"><span class="topic-icon green">&lt;/&gt;</span><strong>Coding Problems</strong><small>1000+ problems</small><b>›</b></a>
      <a href="{{ '/fundamentals/patterns/' | relative_url }}"><span class="topic-icon amber">▦</span><strong>Design Patterns Quiz</strong><small>Test your knowledge</small><b>›</b></a>
      <a href="{{ '/coding-round/mock-interviews/' | relative_url }}"><span class="topic-icon violet">♙</span><strong>Mock Interviews</strong><small>Practice real interviews</small><b>›</b></a>
    </div>
  </div>
</section>

<section class="home-benefits" aria-label="Why Abstract Interviews">
  <div><span class="topic-icon blue">♙</span><strong>Interview Focused</strong><small>Curated content that matters for interviews.</small></div>
  <div><span class="topic-icon green">⌘</span><strong>Visual &amp; Practical</strong><small>Diagrams, examples and real world use cases.</small></div>
  <div><span class="topic-icon amber">▧</span><strong>Well Structured</strong><small>Well organized for easy learning and revision.</small></div>
  <div><span class="topic-icon violet">⚙</span><strong>Continuously Updated</strong><small>New content added regularly to keep you ahead.</small></div>
</section>
