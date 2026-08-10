# frozen_string_literal: true

module Flowbite
  class Dropdown
    # Renders an item in a dropdown menu.
    #
    # If +href+ is given, the item renders as a link. Otherwise, it renders as
    # a button, which is useful for items that trigger a JavaScript action or
    # submit a form.
    #
    # @param class [Array<String>] Additional CSS classes for the item element.
    # @param href [String] The URL for the item. If omitted, the item renders
    #   as a +<button>+ instead of a link.
    # @param options [Hash] Additional HTML attributes for the item element.
    #
    # @example Link item
    #   <%= render Flowbite::Dropdown::Item.new(href: "/dashboard") { "Dashboard" } %>
    #
    # @example Button item
    #   <%= render Flowbite::Dropdown::Item.new(type: "submit") { "Sign out" } %>
    class Item < ViewComponent::Base
      class << self
        def classes
          ["block", "w-full", "px-4", "py-2", "text-left", "text-sm", "text-body", "hover:bg-neutral-tertiary-medium", "hover:text-heading"]
        end
      end

      attr_reader :href, :options

      def initialize(href: nil, class: nil, **options)
        @class = Array.wrap(binding.local_variable_get(:class))
        @href = href
        @options = options
      end

      def call
        content_tag(:li) { render_link }
      end

      private

      def classes
        self.class.classes + @class
      end

      def link?
        href.present?
      end

      def render_link
        link_options = {class: classes}.merge(options)

        if link?
          content_tag(:a, content, href: href, **link_options)
        else
          content_tag(:button, content, type: "button", **link_options)
        end
      end
    end
  end
end
