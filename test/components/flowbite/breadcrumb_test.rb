require "test_helper"

class Flowbite::BreadcrumbTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Breadcrumb.new)

    assert_component_rendered
    assert_selector("nav[aria-label='Breadcrumb']")
  end

  def test_renders_nav_with_proper_classes
    render_inline(Flowbite::Breadcrumb.new)

    assert_selector("nav.flex")
  end

  def test_renders_ordered_list_with_proper_classes
    render_inline(Flowbite::Breadcrumb.new)

    assert_selector("ol.inline-flex.items-center.space-x-1")
  end

  def test_renders_with_items
    render_inline(Flowbite::Breadcrumb.new) do |breadcrumb|
      breadcrumb.with_item { "<li>Home</li>".html_safe }
      breadcrumb.with_item { "<li>Projects</li>".html_safe }
    end

    assert_selector("li", count: 2)
  end
end

class Flowbite::BreadcrumbItemTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::BreadcrumbItem.new(href: "/projects")) { "Projects" }

    assert_component_rendered
    assert_selector("li")
  end

  def test_renders_link_with_href
    render_inline(Flowbite::BreadcrumbItem.new(href: "/projects")) { "Projects" }

    assert_selector("a[href='/projects']", text: "Projects")
  end

  def test_renders_link_with_proper_classes
    render_inline(Flowbite::BreadcrumbItem.new(href: "/projects")) { "Projects" }

    assert_selector("a.ms-1.text-sm.font-medium.text-body")
  end

  def test_renders_with_custom_options
    render_inline(Flowbite::BreadcrumbItem.new(href: "/projects", id: "projects-link", "data-action": "click->breadcrumb#navigate")) { "Projects" }

    assert_selector("a[id='projects-link'][data-action='click->breadcrumb#navigate']")
  end

  def test_renders_with_flex_container
    render_inline(Flowbite::BreadcrumbItem.new(href: "/projects")) { "Projects" }

    assert_selector("div.flex.items-center")
  end
end

class Flowbite::BreadcrumbItem::CurrentTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::BreadcrumbItem::Current.new) { "Current Page" }

    assert_component_rendered
    assert_selector("li")
  end

  def test_renders_as_span_not_link
    render_inline(Flowbite::BreadcrumbItem::Current.new) { "Current Page" }

    assert_selector("span", text: "Current Page")
    assert_no_selector("a")
  end

  def test_renders_with_aria_current_attribute
    render_inline(Flowbite::BreadcrumbItem::Current.new) { "Current Page" }

    assert_selector("li[aria-current='page']")
  end

  def test_renders_with_proper_classes
    render_inline(Flowbite::BreadcrumbItem::Current.new) { "Current Page" }

    assert_selector("span.ms-1.text-sm.font-medium.text-body-subtle")
  end

  def test_renders_with_custom_options
    render_inline(Flowbite::BreadcrumbItem::Current.new(id: "current-page")) { "Current Page" }

    assert_selector("span[id='current-page']")
  end
end

class Flowbite::BreadcrumbItem::FirstTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/")) { "Home" }

    assert_component_rendered
    assert_selector("li")
  end

  def test_renders_link_with_href
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/")) { "Home" }

    assert_selector("a[href='/']", text: "Home")
  end

  def test_renders_with_home_icon
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/")) { "Home" }

    assert_selector("svg.w-3.h-3.me-2\\.5")
  end

  def test_renders_with_proper_classes
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/")) { "Home" }

    assert_selector("a.text-sm.font-medium.inline-flex.items-center.text-body")
  end

  def test_renders_without_separator
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/")) { "Home" }

    # The first item should not have a separator
    assert_no_selector("svg.rtl\\:rotate-180")
  end

  def test_renders_with_custom_options
    render_inline(Flowbite::BreadcrumbItem::First.new(href: "/", id: "home-link")) { "Home" }

    assert_selector("a[id='home-link']")
  end
end

class Flowbite::Breadcrumb::HomeIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Breadcrumb::HomeIcon.new)

    assert_component_rendered
    assert_selector("svg")
  end

  def test_renders_svg_with_proper_classes
    render_inline(Flowbite::Breadcrumb::HomeIcon.new)

    assert_selector("svg.w-3.h-3.me-2\\.5")
  end

  def test_renders_svg_with_proper_attributes
    render_inline(Flowbite::Breadcrumb::HomeIcon.new)

    assert_selector("svg[aria-hidden='true']")
    assert_selector("svg[fill='currentColor']")
  end

  def test_renders_path_element
    render_inline(Flowbite::Breadcrumb::HomeIcon.new)

    assert_selector("path")
  end
end

class Flowbite::Breadcrumb::SeparatorIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Breadcrumb::SeparatorIcon.new)

    assert_component_rendered
    assert_selector("svg")
  end

  def test_renders_svg_with_proper_classes
    render_inline(Flowbite::Breadcrumb::SeparatorIcon.new)

    assert_selector("svg.w-3\\.5.h-3\\.5.rtl\\:rotate-180.text-body")
  end

  def test_renders_svg_with_proper_attributes
    render_inline(Flowbite::Breadcrumb::SeparatorIcon.new)

    assert_selector("svg[aria-hidden='true']")
    assert_selector("svg[fill='none']")
  end

  def test_renders_path_element
    render_inline(Flowbite::Breadcrumb::SeparatorIcon.new)

    assert_selector("path[stroke='currentColor']")
  end

  def test_renders_chevron_path
    render_inline(Flowbite::Breadcrumb::SeparatorIcon.new)

    assert_selector("path[d='m9 5 7 7-7 7']")
  end
end
