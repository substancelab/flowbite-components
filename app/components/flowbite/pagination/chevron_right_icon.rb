# frozen_string_literal: true

module Flowbite
  class Pagination
    # Renders the chevron-right icon shown on a pagination's next link.
    #
    # This is automatically used by {Flowbite::Pagination::NextLink}, but can
    # be used standalone if needed.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Pagination::ChevronRightIcon.new %>
    class ChevronRightIcon < ViewComponent::Base
      def call
        tag.svg(
          class: "w-4 h-4 rtl:rotate-180",
          "aria-hidden": "true",
          xmlns: "http://www.w3.org/2000/svg",
          width: 24,
          height: 24,
          fill: "none",
          viewBox: "0 0 24 24"
        ) do
          tag.path(
            stroke: "currentColor",
            "stroke-linecap": "round",
            "stroke-linejoin": "round",
            "stroke-width": "2",
            d: "m9 5 7 7-7 7"
          )
        end
      end
    end
  end
end
