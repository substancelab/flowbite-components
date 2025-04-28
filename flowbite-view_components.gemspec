# frozen_string_literal: true

require_relative "lib/flowbite/view_components/version"

Gem::Specification.new do |spec|
  spec.name = "flowbite-view_components"
  spec.version = Flowbite::ViewComponents::VERSION
  spec.authors = ["Jakob Skjerning"]
  spec.email = ["jakob@mentalized.net"]

  spec.summary = "Flowbite components for Rails applications"
  spec.description = "A library of Flowbite View Components to be used in Rails applications."
  spec.homepage = "https://github.com/substancelab/flowbite-view_components"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/substancelab/flowbite-view_components/blob/main/CHANGELOG.md"

  spec.files = Dir["CHANGELOG.md", "LICENSE", "README.md", "lib/**/*"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
