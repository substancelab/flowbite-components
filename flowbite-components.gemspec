# frozen_string_literal: true

require_relative "lib/flowbite/components/version"

Gem::Specification.new do |spec|
  spec.name = "flowbite-components"
  spec.version = Flowbite::Components::VERSION
  spec.authors = ["Jakob Skjerning"]
  spec.email = ["jakob@mentalized.net"]

  spec.summary = "ViewComponents using the Flowbite design system"
  spec.description = "A library of View Components based on the Flowbite design system to be used in Rails applications."
  spec.homepage = "https://github.com/substancelab/flowbite-components"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/substancelab/flowbite-components/blob/main/CHANGELOG.md"

  spec.files = Dir["CHANGELOG.md", "LICENSE", "README.md", "lib/**/*"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "view_component", ">= 4.0.0"
end
