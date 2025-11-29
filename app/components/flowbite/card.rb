# frozen_string_literal: true

module Flowbite
  # Renders a card element.
  #
  # See https://flowbite.com/docs/components/cards/
  class Card < ViewComponent::Base
    renders_one :title

    class << self
      def classes(state: :default, style: :default)
        style = styles.fetch(style)
        style.fetch(state)
      end

      # rubocop:disable Layout/LineLength
      def styles
        {
          default: Flowbite::Style.new(
            default: ["p-6", "bg-neutral-primary-soft", "border", "border-default", "rounded-base", "shadow-xs"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    # @param class [Array<String>] Additional CSS classes for the card
    #   container.
    #
    # @param options [Hash] Additional HTML options for the card container
    #   (e.g., custom classes, data attributes). These options are merged into
    #   the card's root element.
    #
    # @param title [Hash] An optional title for the card. If provided,
    #   it will be rendered at the top of the card in a h5 tag using the
    #   Card::Title component. The hash can contain:
    #   - `content`: The text content of the title
    #   - `options`: Additional HTML options to pass to the title element
    #   Alternatively, you can use the `title` slot to provide the entire
    #   title element yourself.
    def initialize(class: [], options: {}, title: {})
      @class = Array(binding.local_variable_get(:class)) || []
      @options = options || {}
      @title = title
    end

    protected

    def card_options
      card_options = {}
      card_options[:class] = self.class.classes + @class
      card_options.merge(@options)
    end

    # Returns the HTML to use for the title element if any
    def default_title
      component = Flowbite::Card::Title.new(**default_title_options)

      if default_title_content
        component.with_content(default_title_content)
      else
        component
      end

      render(component)
    end

    def default_title_content
      return nil unless @title

      @title[:content]
    end

    # @return [Hash] The options to pass to the default title component
    def default_title_options
      title_options = @title.dup
      title_options[:options] || {}
    end

    def title?
      @title.present?
    end
  end
end
