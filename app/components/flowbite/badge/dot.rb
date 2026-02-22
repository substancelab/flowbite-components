# frozen_string_literal: true

module Flowbite
  class Badge
    # Renders a colored dot indicator for use inside a badge.
    #
    # @param style [Symbol] The color style of the dot (:alternative, :brand,
    #   :danger, :gray, :success, :warning).
    class Dot < ViewComponent::Base
      CLASSES = {
        alternative: ["bg-heading", "me-1", "rounded-full"],
        brand: ["bg-fg-brand-strong", "me-1", "rounded-full"],
        danger: ["bg-fg-danger-strong", "me-1", "rounded-full"],
        gray: ["bg-heading", "me-1", "rounded-full"],
        success: ["bg-fg-success-strong", "me-1", "rounded-full"],
        warning: ["bg-fg-warning", "me-1", "rounded-full"]
      }.freeze

      SIZES = {
        default: ["h-1.5", "w-1.5"]
      }.freeze

      class << self
        def classes(size: :default, style: :brand)
          CLASSES.fetch(style) + sizes.fetch(size)
        end

        def sizes
          SIZES
        end
      end

      attr_reader :size, :style

      def initialize(size: :default, style: :brand)
        @size = size
        @style = style
      end

      def call
        content_tag(:span, nil, class: self.class.classes(size: size, style: style))
      end
    end
  end
end
