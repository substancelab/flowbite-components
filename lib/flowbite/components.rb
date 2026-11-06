# frozen_string_literal: true

require_relative "components/engine"
require_relative "components/version"

require "view_component"

module Flowbite
  module Components
    class Error < StandardError; end

    # The client-side behavior components render markup for, unless given
    # explicitly using their +behavior+ argument. One of +:none+ (Flowbite's
    # own markup), +:native+, or +:stimulus+. Components that don't support
    # the behavior render Flowbite's own markup. See Flowbite::Behavior.
    #
    # @example In config/initializers/flowbite_components.rb
    #   Flowbite::Components.default_behavior = :stimulus
    mattr_accessor :default_behavior, default: :none
  end
end
