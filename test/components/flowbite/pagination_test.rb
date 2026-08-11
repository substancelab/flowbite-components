require "test_helper"

class Flowbite::PaginationTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination.new)

    assert_component_rendered
    assert_selector("nav[aria-label='Pagination']")
  end

  def test_renders_with_proper_list_classes
    render_inline(Flowbite::Pagination.new)

    assert_selector("ul.flex.-space-x-px.text-sm")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Pagination.new(class: ["custom-class"]))

    assert_selector("ul.custom-class")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Pagination.new(id: "my-pagination"))

    assert_selector("nav[id='my-pagination']")
  end

  def test_renders_pages_from_the_pages_slot
    render_inline(Flowbite::Pagination.new) do |pagination|
      pagination.with_page { "<li>Page one</li>".html_safe }
      pagination.with_page { "<li>Page two</li>".html_safe }
    end

    assert_selector("li", text: "Page one")
    assert_selector("li", text: "Page two")
  end

  def test_disables_previous_link_when_no_previous_url_given
    render_inline(Flowbite::Pagination.new)

    assert_selector("li span[aria-disabled='true'] span.sr-only", text: "Previous")
    assert_no_selector("li a", text: "Previous")
  end

  def test_disables_next_link_when_no_next_url_given
    render_inline(Flowbite::Pagination.new)

    assert_selector("li span[aria-disabled='true'] span.sr-only", text: "Next")
    assert_no_selector("li a", text: "Next")
  end

  def test_links_to_given_previous_and_next_urls
    render_inline(Flowbite::Pagination.new(previous_url: "/posts?page=1", next_url: "/posts?page=3"))

    assert_selector("li a[href='/posts?page=1'] span.sr-only", text: "Previous")
    assert_selector("li a[href='/posts?page=3'] span.sr-only", text: "Next")
  end
end

class Flowbite::Pagination::LinkTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::Link.new(page: 2, url: "/posts?page=2"))

    assert_component_rendered
    assert_selector("li a[href='/posts?page=2']", text: "2")
  end

  def test_renders_current_page_with_aria_current
    render_inline(Flowbite::Pagination::Link.new(page: 2, url: "/posts?page=2", current: true))

    assert_selector("a[aria-current='page']")
  end

  def test_does_not_render_aria_current_for_non_current_page
    render_inline(Flowbite::Pagination::Link.new(page: 2, url: "/posts?page=2"))

    assert_no_selector("a[aria-current]")
  end
end

class Flowbite::Pagination::GapTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::Gap.new)

    assert_component_rendered
    assert_selector("li", text: "…")
  end
end

class Flowbite::Pagination::PreviousLinkTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::PreviousLink.new(url: "/posts?page=1"))

    assert_component_rendered
    assert_selector("li a[href='/posts?page=1'] span.sr-only", text: "Previous")
  end

  def test_renders_disabled_state
    render_inline(Flowbite::Pagination::PreviousLink.new(url: "/posts?page=1", disabled: true))

    assert_selector("span[aria-disabled='true'].opacity-50.cursor-not-allowed")
    assert_no_selector("a")
  end
end

class Flowbite::Pagination::NextLinkTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::NextLink.new(url: "/posts?page=2"))

    assert_component_rendered
    assert_selector("li a[href='/posts?page=2'] span.sr-only", text: "Next")
  end

  def test_renders_disabled_state
    render_inline(Flowbite::Pagination::NextLink.new(url: "/posts?page=2", disabled: true))

    assert_selector("span[aria-disabled='true'].opacity-50.cursor-not-allowed")
    assert_no_selector("a")
  end
end

class Flowbite::Pagination::ChevronLeftIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::ChevronLeftIcon.new)

    assert_component_rendered
    assert_selector("svg[aria-hidden='true']")
  end
end

class Flowbite::Pagination::ChevronRightIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Pagination::ChevronRightIcon.new)

    assert_component_rendered
    assert_selector("svg[aria-hidden='true']")
  end
end
