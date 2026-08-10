# frozen_string_literal: true

module Flowbite
  # Renders a loading spinner.
  #
  # @example Basic usage
  #  <%= render(Flowbite::Spinner.new) %>
  #
  # @example With a custom style and size
  #  <%= render(Flowbite::Spinner.new(style: :success, size: :lg)) %>
  #
  # @see https://flowbite.com/docs/components/spinner/
  # @lookbook_embed SpinnerPreview
  class Spinner < ViewComponent::Base
    SIZES = {
      xs: ["w-4", "h-4"],
      sm: ["w-6", "h-6"],
      default: ["w-8", "h-8"],
      lg: ["w-10", "h-10"],
      xl: ["w-12", "h-12"]
    }.freeze

    STYLES = {
      brand: ["fill-brand"],
      danger: ["fill-danger"],
      success: ["fill-success"],
      warning: ["fill-warning"]
    }.freeze

    class << self
      def classes(size: :default, style: :brand)
        ["text-neutral-tertiary", "animate-spin"] + styles.fetch(style) + sizes.fetch(size)
      end

      def sizes
        SIZES
      end

      def styles
        STYLES
      end
    end

    attr_reader :message, :options

    # @param class [String, Array<String>] Additional CSS classes for the spinner icon.
    # @param message [String] Text for screen readers announcing the loading state.
    # @param options [Hash] Additional HTML options for the container element.
    # @param size [Symbol] The size of the spinner (:xs, :sm, :default, :lg, :xl).
    # @param style [Symbol] The color style of the spinner (:brand, :danger, :success, :warning).
    def initialize(class: nil, message: "Loading...", size: :default, style: :brand, **options)
      @class = Array.wrap(binding.local_variable_get(:class))
      @message = message
      @size = size
      @style = style
      @options = options
    end

    private

    def classes
      self.class.classes(size: @size, style: @style) + @class
    end
  end
end
