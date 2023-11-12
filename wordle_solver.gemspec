# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "wordle_solver"
  s.version = File.read("VERSION").strip
  s.authors = ["James Childers"]
  s.email = ["james.childers@gmail.com"]

  s.summary = "Solve Wordle"
  s.description = s.summary
  s.homepage = "https://github.com/jchilders/wordle_solver"
  s.license = "MIT"
  s.required_ruby_version = ">= 2.6.0"

  # s.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = s.homepage
  # s.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  s.files = Dir.glob("lib/**/*.rb") + ["README.md", "VERSION", "LICENSE.txt"]

  s.bindir = "exe"
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
