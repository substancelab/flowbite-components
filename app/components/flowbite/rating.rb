# frozen_string_literal: true

module Flowbite
  # Renders a star rating, showing a value out of a maximum number of stars.
  #
  # The number of filled stars is the value rounded to the nearest whole
  # number (halves round up), clamped between 0 and +max+. The remaining stars
  # are rendered as empty stars. The exact value is announced to screen
  # readers.
  #
  # @example Basic usage
  #  <%= render(Flowbite::Rating.new(value: 4)) %>
  #
  # @example With text and a custom size
  #  <%= render(Flowbite::Rating.new(size: :lg, text: "4.95 out of 5", value: 4.95)) %>
  #
  # @see https://flowbite.com/docs/components/rating/
  # @lookbook_embed RatingPreview
  class Rating < ViewComponent::Base
    class << self
      def classes
        ["flex", "items-center"]
      end
    end

    attr_reader :max, :options, :size, :text, :value

    # @param class [String, Array<String>] Additional CSS classes for the
    #   container element.
    # @param max [Integer] The total number of stars to render (default: 5).
    # @param options [Hash] Additional HTML options for the container element.
    # @param size [Symbol] The size of the stars (:default, :md, :lg).
    # @param text [String] Optional text rendered after the stars, e.g.
    #   "4.95 out of 5".
    # @param value [Numeric] The rating value, e.g. 4 or 4.95.
    def initialize(value:, class: nil, max: 5, size: :default, text: nil, **options)
      @class = Array.wrap(binding.local_variable_get(:class))
      @max = max
      @options = options
      @size = size
      @text = text
      @value = value
    end

    def container_classes
      self.class.classes + @class
    end

    # @return [Integer] The number of stars to render as filled.
    def filled_count
      value.round.clamp(0, max)
    end

    # @return [String] The rating as announced to screen readers.
    def screen_reader_text
      "Rated #{value} out of #{max}"
    end

    # @return [Array<Boolean>] One entry per star, true if the star is filled.
    def stars
      Array.new(max) { |index| index < filled_count }
    end
  end
end
