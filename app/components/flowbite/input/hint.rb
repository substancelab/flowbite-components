# frozen_string_literal: true

module Flowbite
  class Input
    # A hint element for input fields.
    #
    # Provides additional context or instructions for the user.
    #
    # See https://flowbite.com/docs/forms/input-field/#helper-text
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
          Flowbite::Styles.from_hash(
            {
              default: {
                default: ["mt-2.5", "text-sm", "text-body"]
              }
            }.freeze
          )
        end
      end

      def call
        tag.p(
          content,
          class: classes,
          **@options
        )
      end

      def initialize(attribute:, form:, class: nil, options: {})
        @attribute = attribute
        @class = Array.wrap(binding.local_variable_get(:class))
        @form = form
        @options = options
        @object = form.object
      end

      # Returns an array with the CSS classes to apply to the label element
      def classes
        self.class.classes(state: state) + @class
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
