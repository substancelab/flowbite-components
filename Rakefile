# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"

# Create a :test task
Minitest::TestTask.create

task default: [:test, "herb:lint"]

namespace :docs do
  desc "Refresh YARD documentation registry for the documentation site"
  task :refresh_registry do
    sh "yard doc --db demo/.yardoc --no-output -e lib/yard/flowbite_viewcomponent.rb --tag lookbook_embed:name app/components"
  end
end

namespace :herb do
  desc "Automatically fix Herb offenses"
  task :fix do
    sh "npm run herb:lint -- --fix"
  end

  desc "Run Herb linter"
  task :lint do
    sh "npm run herb:lint"
  end
end
