# frozen_string_literal: true

module Flowbite
  class Sidebar
    # Renders a sidebar navigation item.
    #
    # Each item renders as a list item containing a link. Optionally, an icon
    # can be provided using the +icon+ slot, which will be displayed before the
    # label text.
    #
    # @example Basic item
    #   <%= render Flowbite::Sidebar::Item.new(href: "/dashboard") { "Dashboard" } %>
    #
    # @example Item with icon
    #   <%= render(Flowbite::Sidebar::Item.new(href: "/dashboard")) do |item| %>
    #     <% item.with_icon do %>
    #       <svg class="w-5 h-5" ...>...</svg>
    #     <% end %>
    #     Dashboard
    #   <% end %>
    #
    # @viewcomponent_slot icon An optional icon displayed before the label text.
    class Item < ViewComponent::Base
      renders_one :icon

      attr_reader :href, :options

      class << self
        def classes
          [
            "flex", "items-center", "px-2", "py-1.5", "text-body",
            "rounded-base", "hover:bg-neutral-tertiary", "hover:text-fg-brand", "group"
          ]
        end
      end

      # @param class [Array<String>] Additional CSS classes for the link element.
      # @param href [String] The URL for the navigation link.
      # @param options [Hash] Additional HTML attributes for the link element.
      def initialize(href:, class: nil, **options)
        super()
        @class = Array.wrap(binding.local_variable_get(:class))
        @href = href
        @options = options
      end

      def call
        content_tag(:li) do
          link_options = {class: link_classes}.merge(options)
          content_tag(:a, href: href, **link_options) do
            concat(icon) if icon?
            concat(content_tag(:span, content, class: label_classes))
          end
        end
      end

      private

      def label_classes
        "ms-3" if icon?
      end

      def link_classes
        self.class.classes + @class
      end
    end
  end
end
