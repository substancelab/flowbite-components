# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# Load the Rails application.
require_relative "../demo/config/environment"

require "minitest/autorun"
require "view_component/base"
require "view_component/test_helpers"
