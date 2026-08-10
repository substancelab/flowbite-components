# frozen_string_literal: true

module Flowbite
  # Renders a dropdown menu triggered by a button.
  #
  # The dropdown menu itself is toggled using Flowbite's JavaScript, via the
  # +data-dropdown-toggle+ attribute. Make sure Flowbite's JavaScript is
  # loaded on the page for the toggle behavior to work.
  #
  # @example Usage
  #   <%= render(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button")) do |dropdown| %>
  #     <% dropdown.with_item do %>
  #       <%= render(Flowbite::Dropdown::Item.new(href: "/dashboard")) { "Dashboard" } %>
  #     <% end %>
  #     <% dropdown.with_item do %>
  #       <%= render(Flowbite::Dropdown::Item.new(href: "/settings")) { "Settings" } %>
  #     <% end %>
  #   <% end %>
  #
  # @viewcomponent_slot [Flowbite::Dropdown::Item] items The items of the
  #   dropdown menu.
  #
  # @see https://flowbite.com/docs/components/dropdowns/
  # @lookbook_embed DropdownPreview
  class Dropdown < ViewComponent::Base
    renders_many :items

    class << self
      def menu_classes
        ["z-10", "hidden", "bg-neutral-primary-soft", "divide-y", "divide-default", "rounded-base", "shadow-lg", "w-44"]
      end
    end

    attr_reader :button_options, :id, :label

    # @param button_options [Hash] Additional options passed to the trigger
    #   {Flowbite::Button}, such as +style+ or +size+.
    # @param class [Array<String>] Additional CSS classes for the dropdown menu.
    # @param id [String] A unique id for the dropdown, used to associate the
    #   trigger button with the menu.
    # @param label [String] The text shown on the trigger button.
    def initialize(id:, label:, class: nil, **button_options)
      @id = id
      @label = label
      @class = Array.wrap(binding.local_variable_get(:class))
      @button_options = button_options
    end

    private

    def button_id
      "#{id}-button"
    end

    def menu_classes
      self.class.menu_classes + @class
    end
  end
end
