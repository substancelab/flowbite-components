# frozen_string_literal: true

module Flowbite
  class Alert
    # Renders the info icon shown inside an alert.
    #
    # Flowbite uses the same outlined info icon for all alert styles; the
    # icon inherits its color from the alert via +currentColor+.
    #
    # @param class [String, Array<String>] Additional CSS classes for the svg
    #   element.
    #
    # @see https://flowbite.com/docs/components/alerts/
    class Icon < ViewComponent::Base
      SVG_PATH = "M10 11h2v5m-2 0h4m-2.592-8.5h.01M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"

      class << self
        def classes
          ["w-4", "h-4", "shrink-0"]
        end
      end

      def initialize(class: nil)
        @class = Array.wrap(binding.local_variable_get(:class))
      end

      def call
        tag.svg(
          tag.path(
            d: svg_path,
            stroke: "currentColor",
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2"
          ),
          "aria-hidden": "true",
          class: svg_classes,
          fill: "none",
          viewBox: "0 0 24 24",
          xmlns: "http://www.w3.org/2000/svg"
        )
      end

      def svg_classes
        self.class.classes + @class
      end

      def svg_path
        SVG_PATH
      end
    end
  end
end
