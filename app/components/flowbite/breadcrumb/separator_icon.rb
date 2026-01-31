# frozen_string_literal: true

module Flowbite
  class Breadcrumb < ViewComponent::Base
    # Renders a breadcrumb separator icon.
    #
    # This is automatically used by BreadcrumbItem components, but can be
    # used standalone if needed.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Breadcrumb::SeparatorIcon.new %>
    class SeparatorIcon < ViewComponent::Base
      def call
        tag.svg(
          class: "w-3.5 h-3.5 rtl:rotate-180 text-body",
          "aria-hidden": "true",
          xmlns: "http://www.w3.org/2000/svg",
          fill: "none",
          height: 24,
          viewBox: "0 0 24 24",
          width: 24
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
