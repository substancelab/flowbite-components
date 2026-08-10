require "test_helper"

class Flowbite::PaginationTest < Minitest::Test
  include ViewComponent::TestHelpers

  def url_for_page
    ->(page) { "/posts?page=#{page}" }
  end

  def test_render_component
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 5, url_for_page: url_for_page))

    assert_component_rendered
    assert_selector("nav[aria-label='Pagination']")
  end

  def test_does_not_render_with_a_single_page
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 1, url_for_page: url_for_page))

    refute_component_rendered
  end

  def test_renders_with_proper_list_classes
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 5, url_for_page: url_for_page))

    assert_selector("ul.flex.-space-x-px.text-sm")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 5, url_for_page: url_for_page, class: ["custom-class"]))

    assert_selector("ul.custom-class")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 5, url_for_page: url_for_page, id: "my-pagination"))

    assert_selector("nav[id='my-pagination']")
  end

  def test_renders_all_pages_when_there_are_few
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 3, url_for_page: url_for_page))

    assert_selector("li a", text: "1")
    assert_selector("li a", text: "2")
    assert_selector("li a", text: "3")
    assert_no_selector("li", text: "…")
  end

  def test_renders_gaps_when_there_are_many_pages
    render_inline(Flowbite::Pagination.new(current_page: 10, total_pages: 20, url_for_page: url_for_page))

    assert_selector("li a", text: "1")
    assert_selector("li a", text: "20")
    assert_selector("li", text: "…", count: 2)
  end

  def test_renders_current_page_link
    render_inline(Flowbite::Pagination.new(current_page: 2, total_pages: 5, url_for_page: url_for_page))

    assert_selector("li a[aria-current='page']", text: "2")
  end

  def test_disables_previous_link_on_first_page
    render_inline(Flowbite::Pagination.new(current_page: 1, total_pages: 5, url_for_page: url_for_page))

    assert_selector("li a[aria-disabled='true'] span.sr-only", text: "Previous")
  end

  def test_disables_next_link_on_last_page
    render_inline(Flowbite::Pagination.new(current_page: 5, total_pages: 5, url_for_page: url_for_page))

    assert_selector("li a[aria-disabled='true'] span.sr-only", text: "Next")
  end

  def test_links_to_next_and_previous_pages
    render_inline(Flowbite::Pagination.new(current_page: 2, total_pages: 5, url_for_page: url_for_page))

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

    assert_selector("a[href='#'][aria-disabled='true'].opacity-50.cursor-not-allowed")
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

    assert_selector("a[href='#'][aria-disabled='true'].opacity-50.cursor-not-allowed")
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
