# frozen_string_literal: true

module Flowbite
  class Breadcrumb
    class Item
      # Renders the first breadcrumb item (typically home).
      # First items don't show a separator icon.
      #
      # @param href [String] The URL for the breadcrumb link.
      # @param options [Hash] Additional HTML attributes to pass to the link element.
      #
      # @example First item
      #   <%= render Flowbite::Breadcrumb::Item::First.new(href: "/") { "Home" } %>
      class First < Item
        protected

        def item_options
          {class: "inline-flex items-center"}
        end

        def link_classes
          ["text-sm", "font-medium", "inline-flex", "items-center", "text-body", "hover:text-fg-brand"]
        end

        def prefix_icon
          nil
        end

        def render_link
          icon = render(Flowbite::Breadcrumb::HomeIcon.new)
          link_options = {class: link_classes}.merge(options)
          content_tag(:a, safe_join([icon, content]), href: href, **link_options)
        end
      end
    end
  end
end
