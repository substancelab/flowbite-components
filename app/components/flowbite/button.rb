# frozen_string_literal: true

module Flowbite
  # Renders a HTML button element.
  #
  # See https://flowbite.com/docs/components/buttons/
  #
  # @param label [String] The text to display on the button.
  #
  # All other parameters are optional and are passed directly to the button tag
  # as HTML attributes.
  class Button < ViewComponent::Base
    SIZES = {
      xs: ["text-xs", "px-3", "py-2"],
      sm: ["text-sm", "px-3", "py-2"],
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
            default: ["font-medium", "text-gray-900", "focus:outline-none", "bg-white", "rounded-lg", "border", "border-gray-200", "hover:bg-gray-100", "hover:text-blue-700", "focus:z-10", "focus:ring-4", "focus:ring-gray-100", "dark:focus:ring-gray-700", "dark:bg-gray-800", "dark:text-gray-400", "dark:border-gray-600", "dark:hover:text-white", "dark:hover:bg-gray-700"]
          ),
          dark: Flowbite::Style.new(
            default: ["text-white", "bg-gray-800", "hover:bg-gray-900", "focus:ring-4", "focus:ring-gray-300", "font-medium", "rounded-lg", "dark:bg-gray-800", "dark:hover:bg-gray-700", "dark:focus:ring-gray-700", "dark:border-gray-700"]
          ),
          default: Flowbite::Style.new(
            default: ["text-white", "bg-blue-700", "hover:bg-blue-800", "focus:ring-4", "focus:ring-blue-300", "font-medium", "rounded-lg", "dark:bg-blue-600", "dark:hover:bg-blue-700", "focus:outline-none", "dark:focus:ring-blue-800"]
          ),
          green: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-green-700", "hover:bg-green-800", "focus:ring-4", "focus:ring-green-300", "font-medium", "rounded-lg", "dark:bg-green-600", "dark:hover:bg-green-700", "dark:focus:ring-green-800"]
          ),
          light: Flowbite::Style.new(
            default: ["text-gray-900", "bg-white", "border", "border-gray-300", "hover:bg-gray-100", "focus:ring-4", "focus:ring-gray-100", "font-medium", "rounded-lg", "dark:bg-gray-800", "dark:text-white", "dark:border-gray-600", "dark:hover:bg-gray-700", "dark:hover:border-gray-600", "dark:focus:ring-gray-700"]
          ),
          purple: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-purple-700", "hover:bg-purple-800", "focus:ring-4", "focus:ring-purple-300", "font-medium", "rounded-lg", "dark:bg-purple-600", "dark:hover:bg-purple-700", "dark:focus:ring-purple-900"]
          ),
          red: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-red-700", "hover:bg-red-800", "focus:ring-4", "focus:ring-red-300", "font-medium", "rounded-lg", "dark:bg-red-600", "dark:hover:bg-red-700", "dark:focus:ring-red-900"]
          ),
          yellow: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-yellow-400", "hover:bg-yellow-500", "focus:ring-4", "focus:ring-yellow-300", "font-medium", "rounded-lg", "dark:focus:ring-yellow-900"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    attr_reader :button_attributes, :size, :style

    def initialize(size: :default, style: :default, **button_attributes)
      @size = size
      @style = style
      @button_attributes = button_attributes
    end

    def call
      content_tag(
        :button,
        content,
        **options
      )
    end

    private

    def classes
      self.class.classes(size: size, state: :default, style: style)
    end

    def options
      {
        class: classes
      }.merge(button_attributes)
    end
  end
end
