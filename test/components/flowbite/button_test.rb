require "test_helper"

class Flowbite::ButtonTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Button.new(label: "Click me"))

    assert_component_rendered
    assert_selector("button", text: "Click me")
  end

  def test_renders_a_xs_button
    render_inline(Flowbite::Button.new(label: "Click me", size: :xs))
    assert_selector("button.text-xs")
  end

  def test_renders_a_sm_button
    render_inline(Flowbite::Button.new(label: "Click me", size: :sm))
    assert_selector("button.text-sm")
  end

  def test_renders_a_lg_button
    render_inline(Flowbite::Button.new(label: "Click me", size: :lg))
    assert_selector("button.text-base.px-5")
  end

  def test_renders_a_xl_button
    render_inline(Flowbite::Button.new(label: "Click me", size: :xl))
    assert_selector("button.text-base.px-6")
  end
end
