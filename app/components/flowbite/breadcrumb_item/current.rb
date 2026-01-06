# frozen_string_literal: true

module Flowbite
  class BreadcrumbItem
    # Renders the current page breadcrumb item.
    # Current items are rendered as non-interactive spans with different styling.
    #
    # @param options [Hash] Additional HTML attributes to pass to the span element.
    #
    # @example Current page item
    #   <%= render Flowbite::BreadcrumbItem::Current.new { "Current Page" } %>
    class Current < BreadcrumbItem
      def initialize(**options)
        super(href: nil, **options)
      end

      protected

      def item_options
        {"aria-current": "page"}
      end

      def render_link
        link_options = {class: link_classes}.merge(options)
        content_tag(:span, content, **link_options)
      end

      def link_classes
        ["ms-1", "text-sm", "font-medium", "text-body-subtle"]
      end
    end
  end
end
