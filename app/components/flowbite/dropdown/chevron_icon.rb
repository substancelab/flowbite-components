# frozen_string_literal: true

module Flowbite
  class Dropdown
    # Renders the chevron-down icon shown on a dropdown's trigger button.
    #
    # This is automatically used by {Flowbite::Dropdown}, but can be used
    # standalone if needed.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Dropdown::ChevronIcon.new %>
    class ChevronIcon < ViewComponent::Base
      def call
        tag.svg(
          class: "w-2.5 h-2.5 ms-3",
          "aria-hidden": "true",
          xmlns: "http://www.w3.org/2000/svg",
          fill: "none",
          viewBox: "0 0 10 6"
        ) do
          tag.path(
            stroke: "currentColor",
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "m1 1 4 4 4-4"
          )
        end
      end
    end
  end
end
