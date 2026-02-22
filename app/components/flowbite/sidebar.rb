# frozen_string_literal: true

module Flowbite
  # Renders a fixed-position sidebar container.
  #
  # Use {Flowbite::Sidebar} as the outer shell and
  # {Flowbite::Sidebar::Navigation} inside it to render the list of
  # {Flowbite::Sidebar::Item}s.
  #
  # @example Usage
  #   <%= render(Flowbite::Sidebar.new) do %>
  #     <%= render(Flowbite::Sidebar::Navigation.new) do |nav| %>
  #       <% nav.with_item do %>
  #         <%= render(Flowbite::Sidebar::Item.new(href: "/dashboard")) { "Dashboard" } %>
  #       <% end %>
  #     <% end %>
  #   <% end %>
  #
  # @see https://flowbite.com/docs/components/sidebar/
  # @lookbook_embed SidebarPreview
  class Sidebar < ViewComponent::Base
    class << self
      def classes
        [
          "fixed", "top-0", "left-0", "z-40", "w-64", "h-screen",
          "transition-transform", "-translate-x-full", "sm:translate-x-0"
        ]
      end
    end

    # @param class [Array<String>] Additional CSS classes for the sidebar
    #   container.
    # @param options [Hash] Additional HTML options for the sidebar container.
    def initialize(class: nil, **options)
      super()
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    def call
      content_tag(:aside, aside_options) do
        content_tag(:div, class: wrapper_classes) do
          content
        end
      end
    end

    private

    def aside_classes
      self.class.classes + @class
    end

    def aside_options
      {class: aside_classes, "aria-label": "Sidebar"}.merge(@options)
    end

    def wrapper_classes
      ["h-full", "px-3", "py-4", "overflow-y-auto", "bg-neutral-primary-soft"]
    end
  end
end
