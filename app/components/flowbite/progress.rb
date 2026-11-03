# frozen_string_literal: true

module Flowbite
  # Renders a progress bar indicating the completion of a task.
  #
  # The progress value is clamped to the range 0 to 100 and used as the
  # width of the bar.
  #
  # @example Basic usage
  #  <%= render(Flowbite::Progress.new(progress: 45)) %>
  #
  # @example With a custom style and size
  #  <%= render(Flowbite::Progress.new(progress: 45, size: :lg, style: :success)) %>
  #
  # @example With the label inside the bar
  #  <%= render(Flowbite::Progress.new(label_position: :inside, progress: 45)) %>
  #
  # @example With a label outside the bar
  #  <%= render(Flowbite::Progress.new(label: "Flowbite", label_position: :outside, progress: 45)) %>
  #
  # @see https://flowbite.com/docs/components/progress/
  # @lookbook_embed ProgressPreview
  class Progress < ViewComponent::Base
    LABEL_POSITIONS = [:inside, :none, :outside].freeze

    SIZES = {
      sm: ["h-1.5"],
      default: ["h-2"],
      lg: ["h-2.5"]
    }.freeze

    INSIDE_LABEL_CLASSES = [
      "text-xs", "font-medium", "text-white", "text-center", "p-0.5",
      "leading-none", "rounded-full", "h-4", "flex", "items-center",
      "justify-center"
    ].freeze

    class << self
      # @return [Array<String>] The CSS classes for the bar indicating the
      #   progress.
      def bar_classes(label_position: :none, size: :default, style: :brand)
        style = styles.fetch(style)
        if label_position == :inside
          style.fetch(:default) + INSIDE_LABEL_CLASSES
        else
          style.fetch(:default) + sizes.fetch(size) + ["rounded-full"]
        end
      end

      # @return [Array<String>] The CSS classes for the track containing the
      #   bar.
      def classes(label_position: :none, size: :default)
        result = ["w-full", "bg-neutral-quaternary", "rounded-full"]
        result += sizes.fetch(size) unless label_position == :inside
        result
      end

      def sizes
        SIZES
      end

      def styles
        Flowbite::Styles.from_hash(
          {
            brand: {default: ["bg-brand"]},
            danger: {default: ["bg-danger"]},
            dark: {default: ["bg-dark"]},
            success: {default: ["bg-success"]},
            warning: {default: ["bg-warning"]}
          }.freeze
        )
      end
    end

    attr_reader :label, :label_position, :options

    # @param class [String, Array<String>] Additional CSS classes for the
    #   track element.
    # @param label [String] Text to show next to the percentage when
    #   label_position is :outside.
    # @param label_position [Symbol] Where to show the percentage (:inside,
    #   :none, :outside).
    # @param options [Hash] Additional HTML options for the track element.
    # @param progress [Numeric] The progress in percent. Values outside the
    #   range 0 to 100 are clamped.
    # @param size [Symbol] The height of the progress bar (:sm, :default,
    #   :lg). Ignored when label_position is :inside.
    # @param style [Symbol] The color style of the bar (:brand, :danger,
    #   :dark, :success, :warning).
    def initialize(progress:, class: nil, label: nil, label_position: :none, size: :default, style: :brand, **options)
      unless LABEL_POSITIONS.include?(label_position)
        raise ArgumentError,
          "Unknown label_position: #{label_position}. " \
          "Available label positions: #{LABEL_POSITIONS.join(", ")}"
      end

      @class = Array.wrap(binding.local_variable_get(:class))
      @label = label
      @label_position = label_position
      @options = options
      @progress = progress
      @size = size
      @style = style
    end

    # @return [Array<String>] The CSS classes for the bar.
    def bar_classes
      self.class.bar_classes(label_position: label_position, size: @size, style: @style)
    end

    # @return [Array<String>] The CSS classes for the track.
    def classes
      self.class.classes(label_position: label_position, size: @size) + @class
    end

    def label_inside?
      label_position == :inside
    end

    def label_outside?
      label_position == :outside
    end

    # @return [String] The progress formatted as a percentage, ie "45%".
    #   Decimal values are rounded to one decimal place.
    def percentage
      value = progress.to_f.round(1)
      value = value.to_i if value == value.to_i
      "#{value}%"
    end

    # @return [Numeric] The progress clamped to the range 0 to 100.
    def progress
      @progress.clamp(0, 100)
    end

    # @return [String] The inline style setting the width of the bar.
    def width_style
      "width: #{percentage}"
    end
  end
end
