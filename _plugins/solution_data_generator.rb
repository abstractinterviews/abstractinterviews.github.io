require "yaml"
require "fileutils"

module SolutionDataGenerator
  SECTION_ICONS = {
    "overview" => "square",
    "high-level-design" => "nodes",
    "detailed-design" => "link",
    "trade-offs" => "balance",
    "code" => "code"
  }.freeze

  class Generator < Jekyll::Generator
    priority :highest

    def generate(site)
      site.data["solutions"] ||= {}
      site.data["concepts"] ||= {}

      site.pages.each do |page|
        if page.data["page_type"] == "solution" && page.data["solution_id"]
          solution = Parser.new(page).parse
          site.data["solutions"][page.data["solution_id"]] = solution
          write_yaml(site, "solutions", page.data["solution_id"], page.path, solution)
        elsif page.data["page_type"] == "concept" && page.data["concept_id"]
          concept = ConceptParser.new(page).parse
          site.data["concepts"][page.data["concept_id"]] = concept
          write_yaml(site, "concepts", page.data["concept_id"], page.path, concept)
        end
      end
    end

    private

    def write_yaml(site, collection, item_id, source_path, data)
      output_dir = File.join(site.source, "_data", collection)
      FileUtils.mkdir_p(output_dir)
      output_path = File.join(output_dir, "#{item_id}.yml")
      generated = {
        "__generated_from" => source_path,
        "__generated_note" => "Edit the source Markdown, not this file."
      }.merge(data)
      yaml = generated.to_yaml(line_width: -1)
      return if File.exist?(output_path) && File.read(output_path) == yaml

      File.write(output_path, yaml)
    end
  end

  class Parser
    def initialize(page)
      @page = page
      @content = page.content.to_s
    end

    def parse
      sections = split_sections(@content, 2)
      detail_block = sections["Detailed Design"] || {}
      detailed_sections = parse_detailed_sections(detail_block[:body].to_s)
      overview = parse_overview(sections["Overview"])
      high_level = parse_high_level_design(sections["High Level Design"])
      trade_offs = parse_tradeoffs(sections["Trade-offs"])
      code = parse_code(sections["Code (Optional)"] || sections["Code"])

      {
        "title" => @page.data["title"],
        "subtitle" => @page.data["subtitle"] || first_paragraph(@content),
        "difficulty" => @page.data["difficulty"] || "Medium",
        "active_tab" => @page.data["active_tab"] || "detailed-design",
        "tabs" => tabs_for(sections),
        "detail_tabs" => detailed_sections.map.with_index { |section, index| { "id" => section["id"], "label" => "#{index + 1}. #{section["short_title"] || section["title"]}" } },
        "overview" => overview,
        "high_level_design" => high_level,
        "trade_offs" => trade_offs,
        "code" => code,
        "sections" => detailed_sections,
        "right_rail" => right_rail(detailed_sections)
      }.compact
    end

    private

    def split_sections(text, level)
      marker = "#" * level
      sections = {}
      current_title = nil
      current_lines = []

      text.each_line do |line|
        if line =~ /^#{Regexp.escape(marker)}\s+(.+?)\s*$/
          sections[current_title] = { body: current_lines.join.strip } if current_title
          current_title = Regexp.last_match(1).strip
          current_lines = []
        else
          current_lines << line if current_title
        end
      end

      sections[current_title] = { body: current_lines.join.strip } if current_title
      sections
    end

    def parse_overview(section)
      return nil unless section

      subsections = split_sections(section[:body], 3)
      {
        "title" => "Overview",
        "description" => intro_before_heading(section[:body], 3),
        "cards" => subsections.map { |title, data| { "title" => title, "text" => plain_text(data[:body]) } }
      }
    end

    def parse_high_level_design(section)
      return nil unless section

      subsections = split_sections(section[:body], 3)
      {
        "title" => "High Level Design",
        "description" => intro_before_heading(section[:body], 3),
        "components" => list_items(subsections.dig("Components", :body).to_s),
        "notes" => list_items(subsections.dig("Notes", :body).to_s)
      }
    end

    def parse_tradeoffs(section)
      return nil unless section

      rows = markdown_table(section[:body])
      {
        "title" => "Trade-offs",
        "items" => rows.map do |row|
          {
            "choice" => row["Choice"],
            "benefit" => row["Benefit"],
            "cost" => row["Cost"]
          }
        end
      }
    end

    def parse_code(section)
      return nil unless section

      fence = section[:body].match(/```(\w+)?\n(.*?)```/m)
      {
        "title" => "Code (Optional)",
        "description" => intro_before_fence(section[:body]),
        "language" => fence && fence[1] ? fence[1] : "text",
        "snippet" => fence ? fence[2].strip : ""
      }
    end

    def parse_detailed_sections(body)
      split_sections(body, 3).map.with_index do |(title, data), index|
        subsections = split_sections(data[:body], 4)
        table_rows = markdown_table(subsections.dig("Flow Steps", :body).to_s)
        step_rows = markdown_table(subsections.dig("Step Table", :body).to_s)

        result = {
          "id" => slug(title),
          "title" => numbered_title(title),
          "short_title" => short_title(title),
          "description" => intro_before_heading(data[:body], 4)
        }

        if index.zero?
          result["participants"] = list_items(subsections.dig("Participants", :body).to_s)
          result["flow_steps"] = table_rows.map do |row|
            {
              "number" => row["Step"].to_i,
              "from" => row["From"].to_i,
              "to" => row["To"].to_i,
              "end" => row["End"].to_i,
              "label" => row["Label"]
            }
          end
          result["step_table"] = step_rows.map { |row| { "step" => row["Step"].to_i, "description" => row["Description"] } }
          result["key_points"] = list_items(subsections.dig("Key Points", :body).to_s)
          result["tech_choices"] = list_items(subsections.dig("Tech Choices", :body).to_s)
        end

        result
      end
    end

    def tabs_for(sections)
      sections.keys.map do |title|
        id = slug(title)
        { "id" => id, "label" => title, "icon" => SECTION_ICONS.fetch(id, "square") }
      end
    end

    def right_rail(detailed_sections)
      {
        "on_this_page" => detailed_sections.map { |section| { "label" => section["title"], "href" => "##{section["id"]}" } },
        "jump_to" => [
          { "label" => "High Level Design", "href" => "#high-level-design" },
          { "label" => "Trade-offs", "href" => "#trade-offs" },
          { "label" => "Code (Optional)", "href" => "#code" }
        ]
      }
    end

    def markdown_table(text)
      lines = text.each_line.map(&:strip).select { |line| line.start_with?("|") && line.end_with?("|") }
      return [] if lines.length < 3

      headers = split_table_row(lines[0])
      lines.drop(2).map do |line|
        values = split_table_row(line)
        headers.zip(values).to_h
      end
    end

    def split_table_row(line)
      line.sub(/^\|/, "").sub(/\|$/, "").split("|").map { |cell| cell.strip.gsub("<br>", "\n") }
    end

    def list_items(text)
      text.each_line.filter_map do |line|
        next unless line =~ /^\s*[-*]\s+(.+?)\s*$/

        Regexp.last_match(1).strip
      end
    end

    def first_paragraph(text)
      text.sub(/\A---.*?---/m, "").split(/\n{2,}/).map(&:strip).find { |block| block.start_with?("#") == false }.to_s
    end

    def intro_before_heading(text, level)
      marker = "#" * level
      plain_text(text.split(/^#{Regexp.escape(marker)}\s+/).first.to_s)
    end

    def intro_before_fence(text)
      plain_text(text.split(/```/).first.to_s)
    end

    def plain_text(text)
      text.to_s.lines.reject { |line| line.strip.empty? }.join(" ").strip
    end

    def slug(title)
      normalized = numbered_title(title)
      return "code" if normalized.downcase.start_with?("code")

      normalized.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-|-+\z/, "")
    end

    def numbered_title(title)
      title.to_s.sub(/^\d+\.\s*/, "").strip
    end

    def short_title(title)
      numbered_title(title).sub(/\s*\(.+?\)\s*/, "").strip
    end
  end

  class ConceptParser
    def initialize(page)
      @page = page
      @content = page.content.to_s
      @helper = Parser.new(page)
    end

    def parse
      sections = @helper.send(:split_sections, @content, 2)
      hero = parse_hero(sections["Hero Diagram"])
      summary = parse_summary(sections["Quick Summary"])
      content_sections = sections.reject { |title, _| ["Hero Diagram", "Quick Summary"].include?(title) }

      {
        "title" => @page.data["title"],
        "subtitle" => @page.data["subtitle"] || @helper.send(:first_paragraph, @content),
        "difficulty" => @page.data["difficulty"] || "Beginner",
        "read_time" => @page.data["read_time"] || "8 min read",
        "label" => @page.data["concept_label"] || "Core Concept",
        "hero" => hero,
        "summary" => summary,
        "sections" => content_sections.map { |title, data| parse_section(title, data[:body]) },
        "right_rail" => right_rail(content_sections.keys)
      }.compact
    end

    private

    def parse_hero(section)
      return nil unless section

      fence = section[:body].match(/```(\w+)?\n(.*?)```/m)
      title = @helper.send(:intro_before_fence, section[:body])
      {
        "title" => title.empty? ? "How It Works" : title,
        "language" => fence && fence[1] ? fence[1] : "mermaid",
        "diagram" => fence ? fence[2].strip : ""
      }
    end

    def parse_summary(section)
      return nil unless section

      subsections = @helper.send(:split_sections, section[:body], 3)
      {
        "description" => @helper.send(:intro_before_heading, section[:body], 3),
        "benefits" => @helper.send(:list_items, subsections.dig("Benefits", :body).to_s),
        "tradeoffs" => @helper.send(:list_items, subsections.dig("Trade-offs", :body).to_s)
      }
    end

    def parse_section(title, body)
      subsections = @helper.send(:split_sections, body, 3)
      {
        "id" => @helper.send(:slug, title),
        "title" => @helper.send(:numbered_title, title),
        "description" => @helper.send(:intro_before_heading, body, 3),
        "subsections" => subsections.map { |subtitle, data| parse_subsection(subtitle, data[:body]) }
      }
    end

    def parse_subsection(title, body)
      table = @helper.send(:markdown_table, body)
      fence = body.match(/```(\w+)?\n(.*?)```/m)
      result = {
        "id" => @helper.send(:slug, title),
        "title" => @helper.send(:numbered_title, title),
        "text" => subsection_text(body),
        "items" => @helper.send(:list_items, body)
      }
      result["table"] = table unless table.empty?
      if fence
        result["language"] = fence[1] || "text"
        result["diagram"] = fence[2].strip
      end
      result
    end

    def subsection_text(body)
      prose = []
      body.to_s.each_line do |line|
        stripped = line.strip
        break if stripped.start_with?("```", "|", "-", "*")

        prose << line
      end
      @helper.send(:plain_text, prose.join)
    end

    def right_rail(section_titles)
      {
        "on_this_page" => section_titles.map do |title|
          {
            "label" => @helper.send(:numbered_title, title),
            "href" => "##{@helper.send(:slug, title)}"
          }
        end
      }
    end
  end
end
