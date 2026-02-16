# frozen_string_literal: true

module Flowbite
  class Badge
    # Renders a colored dot indicator for use inside a badge.
    #
    # @param style [Symbol] The color style of the dot (:alternative, :brand,
    #   :danger, :gray, :success, :warning).
    class Dot < ViewComponent::Base
      CLASSES = {
        alternative: ["bg-heading", "h-1.5", "me-1", "rounded-full", "w-1.5"],
        brand: ["bg-fg-brand-strong", "h-1.5", "me-1", "rounded-full", "w-1.5"],
        danger: ["bg-fg-danger-strong", "h-1.5", "me-1", "rounded-full", "w-1.5"],
        gray: ["bg-heading", "h-1.5", "me-1", "rounded-full", "w-1.5"],
        success: ["bg-fg-success-strong", "h-1.5", "me-1", "rounded-full", "w-1.5"],
        warning: ["bg-fg-warning", "h-1.5", "me-1", "rounded-full", "w-1.5"]
      }.freeze

      class << self
        def classes(style: :brand)
          CLASSES.fetch(style)
        end
      end

      attr_reader :style

      def initialize(style: :brand)
        @style = style
      end

      def call
        content_tag(:span, nil, class: self.class.classes(style: style))
      end
    end
  end
end
