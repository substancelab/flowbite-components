# frozen_string_literal: true

class DropdownPreview < Lookbook::Preview
  def example
    render(Flowbite::Dropdown.new(id: "example-dropdown", label: "Dropdown button")) do |dropdown|
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Dashboard" } }
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Settings" } }
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Earnings" } }
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Sign out" } }
    end
  end

  # @!group Button styles
  #
  # The trigger button accepts the same style options as {Flowbite::Button}.
  #
  # @display classes flex items-center space-x-4

  def default
    render(Flowbite::Dropdown.new(id: "default-dropdown", label: "Default")) do |dropdown|
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Dashboard" } }
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Settings" } }
    end
  end

  def secondary
    render(Flowbite::Dropdown.new(id: "secondary-dropdown", label: "Secondary", style: :secondary)) do |dropdown|
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Dashboard" } }
      dropdown.with_item { render(Flowbite::Dropdown::Item.new(href: "#")) { "Settings" } }
    end
  end

  # @!endgroup

  # @!group Button items
  #
  # Omit +href+ on an item to render it as a button instead of a link. This is
  # useful for items that submit a form or trigger a JavaScript action.
  #
  # @display classes flex items-center space-x-4

  def with_button_items
    render(Flowbite::Dropdown.new(id: "button-items-dropdown", label: "Dropdown button")) do |dropdown|
      dropdown.with_item { render(Flowbite::Dropdown::Item.new) { "Sign out" } }
    end
  end

  # @!endgroup
end
