# frozen_string_literal: true

require "bundler/setup"
require "bundler/gem_tasks"
require "minitest/test_task"
require "rubocop/rake_task"

# Create a :test task
Minitest::TestTask.create

# Create :rubocop tasks
RuboCop::RakeTask.new

task default: [:test, :lint, "herb:format:check"]

desc "Verify code style and formatting of Ruby, ERB, and JavaScript files"
task lint: ["rubocop", "herb:lint", "js:lint"]

namespace :docs do
  desc "Refresh YARD documentation registry for the documentation site"
  task :refresh_registry do
    sh "yard doc --db demo/.yardoc --no-output -e lib/yard/flowbite_viewcomponent.rb --tag lookbook_embed:name app/components"
  end
end

namespace :js do
  desc "Automatically fix code style offenses in JavaScript files using standard"
  task :fix do
    sh "npm run js:lint:fix"
  end

  desc "Lint JavaScript files using standard"
  task :lint do
    sh "npm run js:lint"
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
