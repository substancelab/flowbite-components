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

  def test_renders_pill_button_in_alternative_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :alternative))
    assert_selector("button.text-gray-900.bg-white")
  end

  def test_renders_pill_button_in_dark_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :dark))
    assert_selector("button.text-white.bg-gray-800")
  end

  def test_renders_pill_button_in_default_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me"))
    assert_selector("button.text-white.bg-blue-700")
  end

  def test_renders_pill_button_in_green_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :green))
    assert_selector("button.text-white.bg-green-700")
  end

  def test_renders_pill_button_in_light_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :light))
    assert_selector("button.text-gray-900.bg-white")
  end

  def test_renders_pill_button_in_red_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :red))
    assert_selector("button.text-white.bg-red-700")
  end

  def test_renders_pill_button_in_purple_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :purple))
    assert_selector("button.text-white.bg-purple-700")
  end

  def test_renders_pill_button_in_yellow_style
    render_inline(Flowbite::Button::Pill.new(label: "Click me", style: :yellow))
    assert_selector("button.text-white.bg-yellow-400")
  end

  def test_renders_pill_button_in_different_sizes
    render_inline(Flowbite::Button::Pill.new(label: "Click me", size: :xs))
    assert_selector("button.text-white.bg-blue-700.text-xs")
  end

  def test_renders_outline_button_in_default_style
    render_inline(Flowbite::Button::Outline.new(label: "Click me"))
    assert_selector("button.text-blue-700.border-blue-700")
  end

  def test_renders_outline_button_in_green_style
    render_inline(Flowbite::Button::Outline.new(label: "Click me", style: :green))
    assert_selector("button.text-green-700.border-green-700")
  end

  def test_renders_outline_button_in_different_sizes
    render_inline(Flowbite::Button::Outline.new(label: "Click me", size: :xs, style: :green))
    assert_selector("button.text-green-700.border-green-700.text-xs")
  end
end
