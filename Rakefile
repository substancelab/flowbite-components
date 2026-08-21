# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"

# Create a :test task
Minitest::TestTask.create

task default: [:test, "herb:lint", "herb:format:check"]

namespace :docs do
  desc "Refresh YARD documentation registry for the documentation site"
  task :refresh_registry do
    sh "yard doc --db demo/.yardoc --no-output -e lib/yard/flowbite_viewcomponent.rb --tag lookbook_embed:name app/components"
  end
end

namespace :herb do
  desc "Format erb files using Herb"
  task :format do
    sh "npm run herb:format"
  end

  namespace :format do
    desc "Check if erb files are formatted correctly"
    task :check do
      sh "npm run herb:format:check"
    end
  end

  desc "Automatically fix Herb offenses in erb files"
  task :fix do
    sh "npm run herb:lint -- --fix"
  end

  desc "Lint erb files using Herb"
  task :lint do
    sh "npm run herb:lint"
  end
end
