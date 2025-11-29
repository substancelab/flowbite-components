# frozen_string_literal: true

module Flowbite
  class Card
    # Renders the title of a card element.
    class Title < ViewComponent::Base
      class << self
        def classes(state: :default, style: :default)
          style = styles.fetch(style)
          style.fetch(state)
        end

        # rubocop:disable Layout/LineLength
        def styles
          {
            default: Flowbite::Style.new(
              default: ["mb-2", "text-2xl", "font-semibold", "tracking-tight", "text-heading"]
            )
          }.freeze
        end
        # rubocop:enable Layout/LineLength
      end

      def call
        title_options = {
          class: self.class.classes
        }.merge(@options)

        content_tag(:h5, content, **title_options)
      end

      def initialize(**options)
        @options = options || {}
      end
    end
  end
end
