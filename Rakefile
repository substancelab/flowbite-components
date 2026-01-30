# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"

# Create a :test task
Minitest::TestTask.create

task default: :test

namespace :docs do
  desc "Refresh YARD documentation registry for the documentation site"
  task :refresh_registry do
    sh "yard doc --db demo/.yardoc --no-output --tag lookbook_embed:name app/components"
  end
end
