(() => {
  const storage = {
    get(key, fallback = null) {
      try { return JSON.parse(localStorage.getItem(key)) ?? fallback; } catch { return fallback; }
    },
    set(key, value) {
      try { localStorage.setItem(key, JSON.stringify(value)); } catch { /* progressive enhancement */ }
    }
  };

  const readingPage = document.querySelector("[data-reading-page]");
  if (readingPage) {
    const recent = storage.get("ai:recent", []).filter((item) => item.url !== readingPage.dataset.readingPage);
    recent.unshift({ url: readingPage.dataset.readingPage, title: readingPage.dataset.readingTitle, visitedAt: Date.now() });
    storage.set("ai:recent", recent.slice(0, 10));
  }

  const continuePanel = document.querySelector("[data-continue-learning]");
  const lastRead = storage.get("ai:recent", [])[0];
  if (continuePanel && lastRead) {
    const title = continuePanel.querySelector("strong");
    const link = continuePanel.querySelector("a");
    if (title) title.textContent = lastRead.title;
    if (link) link.href = lastRead.url;
  }

  const toc = document.querySelector("[data-catalog-toc]");
  if (toc && "IntersectionObserver" in window) {
    const links = [...toc.querySelectorAll("a[href^='#']")];
    const targets = links.map((link) => document.getElementById(link.hash.slice(1))).filter(Boolean);
    const observer = new IntersectionObserver((entries) => {
      const active = entries.filter((entry) => entry.isIntersecting).sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top)[0];
      if (!active) return;
      links.forEach((link) => link.classList.toggle("is-active", link.hash === `#${active.target.id}`));
    }, { rootMargin: "-15% 0px -70%", threshold: 0 });
    targets.forEach((target) => observer.observe(target));
  }

  document.querySelectorAll(".ux-section-tabs a[href^='#']").forEach((link) => {
    link.addEventListener("click", () => {
      link.parentElement.querySelectorAll("a").forEach((item) => item.classList.toggle("is-active", item === link));
    });
  });
})();
