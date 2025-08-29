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
            default: ["p-6", "bg-white", "border", "border-gray-200", "rounded-lg", "shadow-sm", "dark:bg-gray-800", "dark:border-gray-700"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    def call
      card_options = {}
      card_options[:class] = self.class.classes + @class

      content_tag(:div, card_options.merge(@options)) do
        concat(content_tag(:div, content, class: "font-normal text-gray-700 dark:text-gray-400"))
      end
    end

    # @param class [Array<String>] Additional CSS classes for the card
    #   container.
    #
    # @param options [Hash] Additional HTML options for the card container
    #   (e.g., custom classes, data attributes). These options are merged into
    #   the card's root element.
    def initialize(class: [], options: {})
      @class = Array(binding.local_variable_get(:class)) || []
      @options = options || {}
    end
  end
end
