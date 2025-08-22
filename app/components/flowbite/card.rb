module Flowbite
  # Renders a card element.
  #
  # See https://flowbite.com/docs/components/cards/
  class Card < ViewComponent::Base
    class << self
      def classes(state: :default, style: :default)
        style = styles.fetch(style)
        style.fetch(state)
      end

      # rubocop:disable Layout/LineLength
      def styles
        {
          default: Flowbite::Style.new(
            default: ["max-w-sm", "p-6", "bg-white", "border", "border-gray-200", "rounded-lg", "shadow-sm", "dark:bg-gray-800", "dark:border-gray-700"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    def call
      content_tag(:div, {class: self.class.classes}.merge(@options)) do
        concat(content_tag(:div, content, class: "font-normal text-gray-700 dark:text-gray-400"))
      end
    end

    # @param options [Hash] Additional HTML options for the card container
    #   (e.g., custom classes, data attributes). These options are merged into
    #   the card's root element.
    def initialize(options: {})
      @options = options || {}
    end
  end
end
