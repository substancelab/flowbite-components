# frozen_string_literal: true

module Flowbite
  class Sidebar
    # Renders the navigation list for a sidebar.
    #
    # This component renders a +<ul>+ with navigation items. It can be used
    # inside a {Flowbite::Sidebar} for a fixed-position sidebar, or standalone
    # in any layout that needs sidebar-style navigation.
    #
    # @example Inside a Sidebar
    #   <%= render(Flowbite::Sidebar.new) do %>
    #     <%= render(Flowbite::Sidebar::Navigation.new) do |nav| %>
    #       <% nav.with_item do %>
    #         <%= render(Flowbite::Sidebar::Item.new(href: "/")) { "Home" } %>
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #
    # @example Standalone
    #   <%= render(Flowbite::Sidebar::Navigation.new) do |nav| %>
    #     <% nav.with_item do %>
    #       <%= render(Flowbite::Sidebar::Item.new(href: "/")) { "Home" } %>
    #     <% end %>
    #   <% end %>
    class Navigation < ViewComponent::Base
      renders_many :items

      class << self
        def classes
          ["space-y-2", "font-medium"]
        end
      end

      # @param class [Array<String>] Additional CSS classes for the list element.
      # @param options [Hash] Additional HTML options for the list element.
      def initialize(class: nil, **options)
        super()
        @class = Array.wrap(binding.local_variable_get(:class))
        @options = options
      end

      def call
        content_tag(:ul, list_options) do
          items.each do |item|
            concat(item)
          end
        end
      end

      private

      def list_classes
        self.class.classes + @class
      end

      def list_options
        {class: list_classes}.merge(@options)
      end
    end
  end
end
