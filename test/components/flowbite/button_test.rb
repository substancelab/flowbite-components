require "test_helper"

class Flowbite::ButtonTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Button.new) { "Click me" }

    assert_component_rendered
    assert_selector("button", text: "Click me")
  end

  def test_renders_a_xs_button
    render_inline(Flowbite::Button.new(size: :xs)) { "Click me" }
    assert_selector("button.text-xs")
  end

  def test_renders_a_sm_button
    render_inline(Flowbite::Button.new(size: :sm)) { "Click me" }
    assert_selector("button.text-sm")
  end

  def test_renders_a_lg_button
    render_inline(Flowbite::Button.new(size: :lg)) { "Click me" }
    assert_selector("button.text-base.px-5")
  end

  def test_renders_a_xl_button
    render_inline(Flowbite::Button.new(size: :xl)) { "Click me" }
    assert_selector("button.text-base.px-6")
  end

  def test_renders_pill_button_in_alternative_style
    render_inline(Flowbite::Button::Pill.new(style: :alternative)) { "Click me" }
    assert_selector("button.text-gray-900.bg-white")
  end

  def test_renders_pill_button_in_dark_style
    render_inline(Flowbite::Button::Pill.new(style: :dark)) { "Click me" }
    assert_selector("button.text-white.bg-gray-800")
  end

  def test_renders_pill_button_in_default_style
    render_inline(Flowbite::Button::Pill.new) { "Click me" }
    assert_selector("button.text-white.bg-blue-700")
  end

  def test_renders_pill_button_in_green_style
    render_inline(Flowbite::Button::Pill.new(style: :green)) { "Click me" }
    assert_selector("button.text-white.bg-green-700")
  end

  def test_renders_pill_button_in_light_style
    render_inline(Flowbite::Button::Pill.new(style: :light)) { "Click me" }
    assert_selector("button.text-gray-900.bg-white")
  end

  def test_renders_pill_button_in_red_style
    render_inline(Flowbite::Button::Pill.new(style: :red)) { "Click me" }
    assert_selector("button.text-white.bg-red-700")
  end

  def test_renders_pill_button_in_purple_style
    render_inline(Flowbite::Button::Pill.new(style: :purple)) { "Click me" }
    assert_selector("button.text-white.bg-purple-700")
  end

  def test_renders_pill_button_in_yellow_style
    render_inline(Flowbite::Button::Pill.new(style: :yellow)) { "Click me" }
    assert_selector("button.text-white.bg-yellow-400")
  end

  def test_renders_pill_button_in_different_sizes
    render_inline(Flowbite::Button::Pill.new(size: :xs)) { "Click me" }
    assert_selector("button.text-white.bg-blue-700.text-xs")
  end

  def test_renders_outline_button_in_default_style
    render_inline(Flowbite::Button::Outline.new) { "Click me" }
    assert_selector("button.text-blue-700.border-blue-700")
  end

  def test_renders_outline_button_in_green_style
    render_inline(Flowbite::Button::Outline.new(style: :green)) { "Click me" }
    assert_selector("button.text-green-700.border-green-700")
  end

  def test_renders_outline_button_in_different_sizes
    render_inline(Flowbite::Button::Outline.new(size: :xs, style: :green)) { "Click me" }
    assert_selector("button.text-green-700.border-green-700.text-xs")
  end

  def test_passes_attributes_to_button_tag
    render_inline(Flowbite::Button.new(data: {controller: "button"})) { "Click me" }
    assert_selector("button[data-controller='button']")
  end

  def test_defaults_to_a_button_with_no_type
    render_inline(Flowbite::Button.new) { "Click me" }
    assert_selector("button:not([type])")
  end

  def test_renders_a_basic_button
    render_inline(Flowbite::Button.new(type: "button")) { "Click me" }
    assert_selector("button[type='button']")
  end

  def test_renders_a_submit_button
    render_inline(Flowbite::Button.new(type: "submit")) { "Click me" }
    assert_selector("button[type='submit']")
  end

  def test_adds_classes_to_the_default_ones
    render_inline(Flowbite::Button.new(class: "custom-class")) { "Click me" }

    assert_selector("button.bg-blue-700.text-white.custom-class")
  end
end
