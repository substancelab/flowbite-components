# frozen_string_literal: true

module Flowbite
  class Pagination
    # Renders a single page number link in a pagination component.
    #
    # This is automatically used by {Flowbite::Pagination}, but can be used
    # standalone if needed.
    #
    # @param current [Boolean] Whether this link represents the current page.
    # @param page [Integer] The page number to display.
    # @param url [String] The URL for the page.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Pagination::Link.new(page: 2, url: "/posts?page=2") %>
    class Link < ViewComponent::Base
      class << self
        def classes(current: false)
          if current
            ["flex", "items-center", "justify-center", "text-fg-brand", "bg-neutral-tertiary-medium", "box-border", "border", "border-default-medium", "hover:text-fg-brand", "font-medium", "text-sm", "w-9", "h-9", "focus:outline-none"]
          else
            ["flex", "items-center", "justify-center", "text-body", "bg-neutral-secondary-medium", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "hover:text-heading", "font-medium", "text-sm", "w-9", "h-9", "focus:outline-none"]
          end
        end
      end

      attr_reader :page, :url

      def initialize(page:, url:, current: false)
        @current = current
        @page = page
        @url = url
      end

      def call
        content_tag(:li) { render_link }
      end

      def current?
        !!@current
      end

      private

      def render_link
        link_options = {class: self.class.classes(current: current?)}
        link_options[:aria] = {current: "page"} if current?
        content_tag(:a, page, href: url, **link_options)
      end
    end
  end
end
