#!/usr/bin/env ruby

require "yaml"
require "date"

ROOT = File.expand_path("..", __dir__)
STRUCTURAL_HTML = /<(?:section|div|article|aside|nav|header|footer)(?:\s|>)/i
VALID_KINDS = %w[home track topic case-study].freeze
VALID_DIFFICULTIES = %w[beginner beginner-friendly core intermediate medium advanced hard essential].freeze

errors = []
checked = 0

Dir.glob(File.join(ROOT, "**", "*.md")).sort.each do |path|
  next if path.include?("/_site/") || path.include?("/.jekyll-cache/")

  source = File.read(path, encoding: "UTF-8")
  match = source.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  next unless match

  front = YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
  next unless front["renderer"] == "app"

  checked += 1
  relative = path.delete_prefix("#{ROOT}/").tr("\\", "/")
  body = source[match.end(0)..]
  kind = front["kind"].to_s

  errors << "#{relative}: missing title" if front["title"].to_s.strip.empty?
  errors << "#{relative}: kind must be one of #{VALID_KINDS.join(', ')}" unless VALID_KINDS.include?(kind)
  errors << "#{relative}: structural HTML is not allowed in app-rendered Markdown" if body.match?(STRUCTURAL_HTML)
  errors << "#{relative}: do not repeat the page title as an H1; front matter owns it" if body.match?(/^#\s+/)

  difficulty = front["difficulty"].to_s.downcase.tr(" ", "-")
  if !difficulty.empty? && !VALID_DIFFICULTIES.include?(difficulty)
    errors << "#{relative}: unknown difficulty '#{front['difficulty']}'"
  end
end

if errors.empty?
  puts "Content validation passed for #{checked} app-rendered Markdown pages."
  exit 0
end

warn errors.join("\n")
warn "Content validation failed with #{errors.length} error(s)."
exit 1
