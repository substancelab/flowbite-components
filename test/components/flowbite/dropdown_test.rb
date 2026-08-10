require "test_helper"

class Flowbite::DropdownTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button"))

    assert_component_rendered
    assert_selector("button", text: "Dropdown button")
    assert_selector("div#user-menu")
  end

  def test_renders_button_with_dropdown_toggle_attribute
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button"))

    assert_selector("button#user-menu-button[data-dropdown-toggle='user-menu']")
  end

  def test_renders_menu_labelled_by_button
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button"))

    assert_selector("ul[aria-labelledby='user-menu-button']")
  end

  def test_renders_menu_hidden_by_default
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button"))

    assert_selector("div#user-menu.hidden")
  end

  def test_passes_button_options_to_trigger_button
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button", style: :secondary))

    assert_selector("button.bg-neutral-secondary-medium")
  end

  def test_renders_with_additional_menu_classes
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button", class: ["custom-class"]))

    assert_selector("div#user-menu.custom-class")
  end

  def test_renders_items
    render_inline(Flowbite::Dropdown.new(id: "user-menu", label: "Dropdown button")) do |dropdown|
      dropdown.with_item { "<li><a href='/dashboard'>Dashboard</a></li>".html_safe }
      dropdown.with_item { "<li><a href='/settings'>Settings</a></li>".html_safe }
    end

    assert_selector("li a[href='/dashboard']", text: "Dashboard")
    assert_selector("li a[href='/settings']", text: "Settings")
  end
end

class Flowbite::Dropdown::ItemTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Dropdown::Item.new(href: "/dashboard")) { "Dashboard" }

    assert_component_rendered
    assert_selector("li a[href='/dashboard']", text: "Dashboard")
  end

  def test_renders_as_button_without_href
    render_inline(Flowbite::Dropdown::Item.new) { "Sign out" }

    assert_selector("li button[type='button']", text: "Sign out")
    assert_no_selector("a")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Dropdown::Item.new(href: "/dashboard", class: ["custom-class"])) { "Dashboard" }

    assert_selector("a.custom-class")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Dropdown::Item.new(href: "/dashboard", id: "my-item")) { "Dashboard" }

    assert_selector("a#my-item")
  end
end

class Flowbite::Dropdown::ChevronIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Dropdown::ChevronIcon.new)

    assert_component_rendered
    assert_selector("svg[aria-hidden='true']")
  end
end
