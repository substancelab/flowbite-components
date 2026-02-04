# frozen_string_literal: true

module Flowbite
  class Input
    class ValidationError < ViewComponent::Base
      class << self
        def classes(state: :default, style: :default)
          style = styles.fetch(style)
          style.fetch(state)
        end

        # rubocop:disable Layout/LineLength
        def styles
          Flowbite::Styles.from_hash(
            {
              default: {
                default: ["mt-2", "text-sm", "text-red-600", "dark:text-red-500"]
              }
            }.freeze
          )
        end
        # rubocop:enable Layout/LineLength
      end

      def call
        tag.p(content, class: classes)
      end

      def initialize(class: nil)
        @class = Array.wrap(binding.local_variable_get(:class))
      end

      protected

      # Returns the CSS classes to apply to the validation error
      def classes
        self.class.classes + @class
      end
    end
  end
end
