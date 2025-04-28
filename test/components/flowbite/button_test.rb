require "test_helper"

class Flowbite::ButtonTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Button.new(label: "Click me"))

    assert_component_rendered
    assert_selector("button", text: "Click me")
  end
end
