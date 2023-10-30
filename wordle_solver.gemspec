# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "wordle_solver"
  spec.version = File.read("VERSION").strip
  spec.authors = ["James Childers"]
  spec.email = ["james.childers@gmail.com"]

  spec.summary = "Solve Wordle"
  spec.description = spec.summary
  spec.homepage = "https://github.com/jchilders/wordle_solver"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.glob("lib/**/*.rb") + ["README.md", "VERSION", "LICENSE.txt"]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
