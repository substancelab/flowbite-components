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
      xs: ["text-xs", "px-3", "py-1.5"],
      sm: ["text-sm", "px-3", "py-2"],
      default: ["text-sm", "px-4", "py-2.5"],
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
          danger: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          dark: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-dark", "box-border", "border", "border-transparent", "hover:bg-dark-strong", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          default: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-brand", "box-border", "border", "border-transparent", "hover:bg-brand-strong", "focus:ring-4", "focus:ring-brand-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          ghost: Flowbite::Style.new(
            default: ["focus:outline-none", "text-heading", "bg-transparent", "box-border", "border", "border-transparent", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "font-medium", "leading-5", "rounded-base"]
          ),
          secondary: Flowbite::Style.new(
            default: ["focus:outline-none", "text-body", "bg-neutral-secondary-medium", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          success: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-success", "box-border", "border", "border-transparent", "hover:bg-success-strong", "focus:ring-4", "focus:ring-success-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          tertiary: Flowbite::Style.new(
            default: ["focus:outline-none", "text-body", "bg-neutral-primary-soft", "box-border", "border", "border-default", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary-soft", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          ),
          warning: Flowbite::Style.new(
            default: ["focus:outline-none", "text-white", "bg-warning", "box-border", "border", "border-transparent", "hover:bg-warning-strong", "focus:ring-4", "focus:ring-warning-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end

    attr_reader :button_attributes, :size, :style

    def initialize(class: nil, size: :default, style: :default, **button_attributes)
      @class = Array.wrap(binding.local_variable_get(:class))
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
      self.class.classes(size: size, state: :default, style: style) + @class
    end

    def options
      {
        class: classes
      }.merge(button_attributes)
    end
  end
end
