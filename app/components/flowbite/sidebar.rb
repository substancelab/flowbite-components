# frozen_string_literal: true

module Flowbite
  # Renders a sidebar navigation component.
  #
  # Use {Flowbite::Sidebar} and the child {Flowbite::Sidebar::Item} components
  # to create a vertical navigation sidebar.
  #
  # @example Usage
  #   <%= render(Flowbite::Sidebar.new) do |sidebar| %>
  #     <% sidebar.with_item do %>
  #       <%= render(Flowbite::Sidebar::Item.new(href: "/dashboard")) do |item| %>
  #         <% item.with_icon do %>
  #           <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 21">
  #             <path d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z"/>
  #           </svg>
  #         <% end %>
  #         Dashboard
  #       <% end %>
  #     <% end %>
  #   <% end %>
  #
  # @viewcomponent_slot items The navigation items rendered in the sidebar.
  #
  # @see https://flowbite.com/docs/components/sidebar/
  # @lookbook_embed SidebarPreview
  class Sidebar < ViewComponent::Base
    renders_many :items

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
          content_tag(:ul, class: list_classes) do
            items.each do |item|
              concat(item)
            end
          end
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

    def list_classes
      ["space-y-2", "font-medium"]
    end

    def wrapper_classes
      ["h-full", "px-3", "py-4", "overflow-y-auto", "bg-neutral-primary-soft"]
    end
  end
end
