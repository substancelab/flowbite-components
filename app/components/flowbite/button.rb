# frozen_string_literal: true

module Flowbite
  # Renders a HTML button element.
  #
  # See https://flowbite.com/docs/components/buttons/
  #
  # @param label [String] The text to display on the button.
  # @param type [Symbol] The type of the button. Default is :button.
  class Button < ViewComponent::Base
    SIZES = {
      xs: ["text-xs", "px-3", "py-2"],
      sm: ["text-sm", "px-3", "py-1.5"],
      default: ["text-sm", "px-5", "py-2.5"],
      lg: ["text-base", "px-5", "py-3"],
      xl: ["text-base", "px-6", "py-3.5"]
    }.freeze

    class << self
      def classes(size: :default, state: :default, style: :default)
        style = styles.fetch(style)
        classes = style.fetch(state)
        classes + sizes.fetch(size)
      end

      def sizes
        SIZES
      end

      # rubocop:disable Layout/LineLength
      def styles
        {
          alternative: Flowbite::Style.new(
            default: ["me-2", "mb-2", "font-medium", "text-gray-900", "focus:outline-none", "bg-white", "rounded-lg", "border", "border-gray-200", "hover:bg-gray-100", "hover:text-blue-700", "focus:z-10", "focus:ring-4", "focus:ring-gray-100", "dark:focus:ring-gray-700", "dark:bg-gray-800", "dark:text-gray-400", "dark:border-gray-600", "dark:hover:text-white", "dark:hover:bg-gray-700"]
          ),
          default: Flowbite::Style.new(
            default: ["text-white", "bg-blue-700", "hover:bg-blue-800", "focus:ring-4", "focus:ring-blue-300", "font-medium", "rounded-lg", "me-2", "mb-2", "dark:bg-blue-600", "dark:hover:bg-blue-700", "focus:outline-none", "dark:focus:ring-blue-800"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    attr_reader :label, :size, :style, :type

    def initialize(label:, size: :default, style: :default, type: :button)
      super
      @label = label
      @size = size
      @style = style
      @type = type
    end

    def call
      content_tag(
        :button,
        label,
        class: classes
      )
    end

    private

    def classes
      self.class.classes(size: size, state: :default, style: style)
    end
  end
end
