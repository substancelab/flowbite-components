# frozen_string_literal: true

module Flowbite
  module Input
    class Hint < ViewComponent::Base
      STATES = [
        DEFAULT = :default
      ].freeze

      class << self
        def classes(state: :default, style: :default)
          style = styles.fetch(style)
          style.fetch(state)
        end

        def styles
          {
            default: Flowbite::Style.new(
              default: ["mt-2", "text-sm", "text-gray-500", "dark:text-gray-400"]
            )
          }.freeze
        end
      end

      def call
        tag.p(
          content,
          class: classes,
          **@options
        )
      end

      def initialize(attribute:, form:, options: {})
        @attribute = attribute
        @form = form
        @options = options
        @object = form.object
      end

      # Returns an array with the CSS classes to apply to the label element
      def classes
        self.class.classes(state: state)
      end

      protected

      # Returns the state of the label.
      #
      # See the STATES constant for valid values.
      #
      # @return [Symbol] the state of the label
      def state
        DEFAULT
      end
    end
  end
end
