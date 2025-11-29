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

  def test_renders_pill_button_in_secondary_style
    render_inline(Flowbite::Button::Pill.new(style: :secondary)) { "Click me" }
    assert_selector("button.text-body.bg-neutral-secondary-medium")
  end

  def test_renders_pill_button_in_tertiary_style
    render_inline(Flowbite::Button::Pill.new(style: :tertiary)) { "Click me" }
    assert_selector("button.text-body.bg-neutral-primary-soft")
  end

  def test_renders_pill_button_in_success_style
    render_inline(Flowbite::Button::Pill.new(style: :success)) { "Click me" }
    assert_selector("button.text-white.bg-success")
  end

  def test_renders_pill_button_in_danger_style
    render_inline(Flowbite::Button::Pill.new(style: :danger)) { "Click me" }
    assert_selector("button.text-white.bg-danger")
  end

  def test_renders_pill_button_in_warning_style
    render_inline(Flowbite::Button::Pill.new(style: :warning)) { "Click me" }
    assert_selector("button.text-white.bg-warning")
  end

  def test_renders_pill_button_in_dark_style
    render_inline(Flowbite::Button::Pill.new(style: :dark)) { "Click me" }
    assert_selector("button.text-white.bg-dark")
  end

  def test_renders_pill_button_in_ghost_style
    render_inline(Flowbite::Button::Pill.new(style: :ghost)) { "Click me" }
    assert_selector("button.text-heading.bg-transparent")
  end

  def test_renders_pill_button_in_default_style
    render_inline(Flowbite::Button::Pill.new) { "Click me" }
    assert_selector("button.text-white.bg-brand")
  end

  def test_renders_pill_button_in_different_sizes
    render_inline(Flowbite::Button::Pill.new(size: :xs)) { "Click me" }
    assert_selector("button.text-white.bg-brand.text-xs")
  end

  def test_renders_outline_button_in_default_style
    render_inline(Flowbite::Button::Outline.new) { "Click me" }
    assert_selector("button.text-brand.border-brand")
  end

  def test_renders_outline_button_in_secondary_style
    render_inline(Flowbite::Button::Outline.new(style: :secondary)) { "Click me" }
    assert_selector("button.text-body.border-default-medium")
  end

  def test_renders_outline_button_in_tertiary_style
    render_inline(Flowbite::Button::Outline.new(style: :tertiary)) { "Click me" }
    assert_selector("button.text-body.border-default")
  end

  def test_renders_outline_button_in_success_style
    render_inline(Flowbite::Button::Outline.new(style: :success)) { "Click me" }
    assert_selector("button.text-success.border-success")
  end

  def test_renders_outline_button_in_danger_style
    render_inline(Flowbite::Button::Outline.new(style: :danger)) { "Click me" }
    assert_selector("button.text-danger.border-danger")
  end

  def test_renders_outline_button_in_warning_style
    render_inline(Flowbite::Button::Outline.new(style: :warning)) { "Click me" }
    assert_selector("button.text-warning.border-warning")
  end

  def test_renders_outline_button_in_dark_style
    render_inline(Flowbite::Button::Outline.new(style: :dark)) { "Click me" }
    assert_selector("button.text-dark.border-dark")
  end

  def test_renders_outline_button_in_different_sizes
    render_inline(Flowbite::Button::Outline.new(size: :xs, style: :success)) { "Click me" }
    assert_selector("button.text-success.border-success.text-xs")
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

    assert_selector("button.bg-brand.text-white.custom-class")
  end
end
