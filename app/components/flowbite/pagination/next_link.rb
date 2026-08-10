# frozen_string_literal: true

module Flowbite
  class Pagination
    # Renders the "Next page" link in a pagination component.
    #
    # This is automatically used by {Flowbite::Pagination}, but can be used
    # standalone if needed.
    #
    # @param disabled [Boolean] Whether the link is disabled, i.e. there is no
    #   next page.
    # @param url [String] The URL for the next page. Ignored if +disabled+.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Pagination::NextLink.new(url: "/posts?page=2") %>
    class NextLink < ViewComponent::Base
      class << self
        def classes(disabled: false)
          classes = ["flex", "items-center", "justify-center", "text-body", "bg-neutral-secondary-medium", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "hover:text-heading", "font-medium", "rounded-e-base", "text-sm", "w-9", "h-9", "focus:outline-none"]
          classes += ["opacity-50", "cursor-not-allowed"] if disabled
          classes
        end
      end

      attr_reader :url

      def initialize(url:, disabled: false)
        @disabled = disabled
        @url = url
      end

      def call
        content_tag(:li) { render_link }
      end

      def disabled?
        !!@disabled
      end

      private

      def render_link
        link_options = {class: self.class.classes(disabled: disabled?)}
        link_options[:"aria-disabled"] = "true" if disabled?

        content_tag(:a, href: disabled? ? "#" : url, **link_options) do
          concat(content_tag(:span, "Next", class: "sr-only"))
          concat(render(Flowbite::Pagination::ChevronRightIcon.new))
        end
      end
    end
  end
end
