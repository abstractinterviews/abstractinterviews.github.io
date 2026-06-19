module AbstractInterviews
  class ContentCatalogGenerator < Jekyll::Generator
    safe true
    priority :low

    KIND_MAP = {
      "data-structure-overview" => "track",
      "deep-dive-index" => "track",
      "data-structure-topic" => "topic",
      "coding-pattern-topic" => "topic",
      "deep-dive-post" => "topic",
      "concept" => "topic",
      "solution" => "case-study",
      "practice" => "topic",
      "practice_problem" => "topic",
      "resource" => "topic"
    }.freeze

    TRACK_RULES = [
      [%r{\A/data-structures/|\A/coding-round/data-structures/}, "data-structures"],
      [%r{\A/architecture/styles/}, "architecture-patterns"],
      [%r{\A/architecture/|\A/fundamentals/|\A/components/|\A/case-studies/}, "system-design"],
      [%r{\A/coding-round/patterns/|\A/coding-round/algorithms/}, "algorithms"],
      [%r{\A/interview/|\A/interview-prep/}, "interview-prep"]
    ].freeze

    def generate(site)
      pages = site.pages.select { |page| page.ext == ".md" || page.path.end_with?(".md") }
      entries = pages.map { |page| normalize(page) }
      by_url = entries.to_h { |entry| [entry["url"], entry] }

      entries.each do |entry|
        page = pages.find { |candidate| candidate.url == entry["url"] }
        next unless page

        entry["breadcrumbs"] = breadcrumbs(entry, by_url)
        entry["related"] = related(entry, entries)
        page.data["catalog_entry"] = entry
        page.data["kind"] ||= entry["kind"]
        page.data["track"] ||= entry["track"]
      end

      site.data["catalog"] = {
        "pages" => entries,
        "by_url" => by_url,
        "recent" => entries.select { |entry| %w[topic case-study].include?(entry["kind"]) }
                           .sort_by { |entry| entry["date"].to_s }
                           .reverse.first(8),
        "tracks" => track_summaries(entries)
      }
    end

    private

    def normalize(page)
      url = page.url.to_s
      kind = page.data["kind"] || KIND_MAP[page.data["page_type"]]
      kind ||= url == "/" ? "home" : "topic"
      track = page.data["track"].to_s.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-|-$|documentation/, "")
      track = infer_track(url) if track.empty?
      headings = page.content.to_s.scan(/^(\#{2,3})\s+(.+?)\s*$/).map do |marks, title|
        clean = title.gsub(/[`*_]/, "").strip
        { "level" => marks.length, "title" => clean, "id" => Jekyll::Utils.slugify(clean) }
      end
      words = page.content.to_s.gsub(/```.*?```/m, " ").scan(/[[:alnum:]]+/).length

      {
        "title" => page.data["title"].to_s,
        "url" => url,
        "kind" => kind,
        "track" => track,
        "description" => description(page),
        "difficulty" => page.data["difficulty"].to_s,
        "tags" => Array(page.data["tags"] || page.data["categories"]).map(&:to_s),
        "featured" => page.data["featured"] == true,
        "date" => page.data["date"],
        "reading_time" => [1, (words / 220.0).ceil].max,
        "headings" => headings,
        "hero" => page.data["hero"] || {},
        "next" => page.data["next"] || page.data.dig("next_topic", "url")
      }
    end

    def description(page)
      explicit = page.data["description"] || page.data["subtitle"]
      return explicit.to_s.strip unless explicit.to_s.strip.empty?

      page.content.to_s.split(/\n{2,}/).map(&:strip).find do |block|
        !block.empty? && !block.start_with?("#", "|", "-", "```", "~~~", "<!--")
      end.to_s.gsub(/\[([^\]]+)\]\([^\)]+\)/, '\\1').gsub(/[*_`]/, "")[0, 220]
    end

    def infer_track(url)
      rule = TRACK_RULES.find { |pattern, _track| url.match?(pattern) }
      rule ? rule.last : "general"
    end

    def breadcrumbs(entry, by_url)
      crumbs = [{ "title" => "Home", "url" => "/" }]
      parts = entry["url"].split("/").reject(&:empty?)
      parts[0...-1].each_index do |index|
        url = "/#{parts[0..index].join('/')}/"
        linked = by_url[url]
        crumbs << { "title" => linked ? linked["title"] : parts[index].tr("-", " ").split.map(&:capitalize).join(" "), "url" => url }
      end
      crumbs << { "title" => entry["title"], "url" => entry["url"] } unless entry["url"] == "/"
      crumbs.uniq { |crumb| crumb["url"] }
    end

    def related(entry, entries)
      candidates = entries.reject { |item| item["url"] == entry["url"] || item["kind"] == "home" }
      candidates.map do |candidate|
        score = 0
        score += 4 if candidate["track"] == entry["track"]
        score += (candidate["tags"] & entry["tags"]).length * 2
        score += 1 if candidate["kind"] == entry["kind"]
        [candidate, score]
      end.select { |_candidate, score| score.positive? }
        .sort_by { |candidate, score| [-score, candidate["title"]] }
        .first(5).map do |candidate, _score|
          {
            "title" => candidate["title"],
            "url" => candidate["url"],
            "kind" => candidate["kind"],
            "track" => candidate["track"],
            "difficulty" => candidate["difficulty"]
          }
        end
    end

    def track_summaries(entries)
      entries.group_by { |entry| entry["track"] }.map do |track, items|
        {
          "id" => track,
          "title" => track.split("-").map(&:capitalize).join(" "),
          "count" => items.count { |item| %w[topic case-study].include?(item["kind"]) },
          "url" => items.find { |item| item["kind"] == "track" }&.dig("url")
        }
      end.sort_by { |track| track["title"] }
    end
  end
end
