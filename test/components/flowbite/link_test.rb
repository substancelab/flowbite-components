require "test_helper"

class Flowbite::LinkTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_a_clickable_link
    render_inline(Flowbite::Link.new(href: "https://uchiadmin.com")) { "Rails Admin Panel" }

    assert_selector("a[href='https://uchiadmin.com']", text: "Rails Admin Panel")
  end

  def test_adds_options_as_attributes
    render_inline(
      Flowbite::Link.new(
        href: "https://uchiadmin.com",
        data: {
          turbo: true
        }
      )
    ) { "Click me" }

    assert_selector("a[data-turbo='true']", text: "Click me")
  end
end
