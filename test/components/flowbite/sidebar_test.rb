require "test_helper"

class Flowbite::SidebarTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Sidebar.new)

    assert_component_rendered
    assert_selector("aside[aria-label='Sidebar']")
  end

  def test_renders_aside_with_proper_classes
    render_inline(Flowbite::Sidebar.new)

    assert_selector("aside.fixed.top-0.left-0.z-40.w-64.h-screen")
  end

  def test_renders_wrapper_div_with_proper_classes
    render_inline(Flowbite::Sidebar.new)

    assert_selector("aside div.h-full.px-3.py-4.overflow-y-auto.bg-neutral-primary-soft")
  end

  def test_renders_unordered_list
    render_inline(Flowbite::Sidebar.new)

    assert_selector("ul.space-y-2.font-medium")
  end

  def test_renders_with_items
    render_inline(Flowbite::Sidebar.new) do |sidebar|
      sidebar.with_item { "<li>Dashboard</li>".html_safe }
      sidebar.with_item { "<li>Settings</li>".html_safe }
    end

    assert_selector("li", count: 2)
  end

  def test_adds_classes_to_the_default_classes
    render_inline(Flowbite::Sidebar.new(class: "custom-class"))

    assert_selector("aside.fixed.top-0.left-0.custom-class")
  end

  def test_passes_options_as_attributes
    render_inline(Flowbite::Sidebar.new(id: "my-sidebar"))

    assert_selector("aside#my-sidebar")
  end
end

class Flowbite::Sidebar::ItemTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) { "Dashboard" }

    assert_component_rendered
    assert_selector("li")
  end

  def test_renders_link_with_href
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) { "Dashboard" }

    assert_selector("a[href='/dashboard']", text: "Dashboard")
  end

  def test_renders_link_with_proper_classes
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) { "Dashboard" }

    assert_selector("a.flex.items-center.px-2.py-1\\.5.text-body.rounded-base.group")
  end

  def test_renders_text_without_margin_when_no_icon
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) { "Dashboard" }

    assert_selector("span", text: "Dashboard")
    assert_no_selector("span.ms-3")
  end

  def test_renders_icon_slot
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) do |item|
      item.with_icon { "<svg class=\"w-5 h-5\"></svg>".html_safe }
      "Dashboard"
    end

    assert_selector("svg.w-5.h-5")
  end

  def test_renders_text_with_margin_when_icon_is_present
    render_inline(Flowbite::Sidebar::Item.new(href: "/dashboard")) do |item|
      item.with_icon { "<svg></svg>".html_safe }
      "Dashboard"
    end

    assert_selector("span.ms-3", text: "Dashboard")
  end

  def test_adds_classes_to_the_default_classes
    render_inline(Flowbite::Sidebar::Item.new(href: "/", class: "custom-class")) { "Home" }

    assert_selector("a.flex.items-center.px-2.py-1\\.5.text-body.rounded-base.group.custom-class")
  end

  def test_passes_options_as_attributes
    render_inline(Flowbite::Sidebar::Item.new(href: "/", id: "home-link")) { "Home" }

    assert_selector("a[id='home-link']")
  end
end
