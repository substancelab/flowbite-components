require "test_helper"

class Flowbite::BadgeTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Badge.new) { "Default" }

    assert_component_rendered
    assert_selector("span", text: "Default")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Badge.new) { "Badge" }

    assert_selector("span.bg-brand-softer.text-fg-brand-strong.text-xs.font-medium.rounded")
  end

  # Styles

  def test_renders_brand_style
    render_inline(Flowbite::Badge.new(style: :brand)) { "Brand" }

    assert_selector("span.bg-brand-softer.text-fg-brand-strong")
  end

  def test_renders_danger_style
    render_inline(Flowbite::Badge.new(style: :danger)) { "Danger" }

    assert_selector("span.bg-danger-soft.text-fg-danger-strong")
  end

  def test_renders_alternative_style
    render_inline(Flowbite::Badge.new(style: :alternative)) { "Alternative" }

    assert_selector("span.bg-neutral-primary-soft.text-heading")
  end

  def test_renders_gray_style
    render_inline(Flowbite::Badge.new(style: :gray)) { "Gray" }

    assert_selector("span.bg-neutral-secondary-medium.text-heading")
  end

  def test_renders_success_style
    render_inline(Flowbite::Badge.new(style: :success)) { "Success" }

    assert_selector("span.bg-success-soft.text-fg-success-strong")
  end

  def test_renders_warning_style
    render_inline(Flowbite::Badge.new(style: :warning)) { "Warning" }

    assert_selector("span.bg-warning-soft.text-fg-warning")
  end

  # Sizes

  def test_renders_default_size
    render_inline(Flowbite::Badge.new(size: :default)) { "Badge" }

    assert_selector("span.text-xs.px-1\\.5.py-0\\.5")
  end

  def test_renders_large_size
    render_inline(Flowbite::Badge.new(size: :lg)) { "Badge" }

    assert_selector("span.text-sm.px-2.py-1")
  end

  # Bordered

  def test_renders_with_border
    render_inline(Flowbite::Badge.new(bordered: true)) { "Badge" }

    assert_selector("span.border.border-brand-subtle")
  end

  def test_renders_bordered_with_matching_style
    render_inline(Flowbite::Badge.new(bordered: true, style: :danger)) { "Badge" }

    assert_selector("span.border.border-danger-subtle")
  end

  # Rounding

  def test_renders_default_rounding
    render_inline(Flowbite::Badge.new) { "Badge" }

    assert_selector("span.rounded")
  end

  # Link

  def test_renders_as_link_when_href_provided
    render_inline(Flowbite::Badge.new(href: "/path")) { "Badge" }

    assert_selector("a[href='/path']", text: "Badge")
  end

  def test_link_badge_has_hover_style
    render_inline(Flowbite::Badge.new(href: "/path")) { "Badge" }

    assert_selector("a.hover\\:bg-brand-soft")
  end

  def test_renders_as_span_without_href
    render_inline(Flowbite::Badge.new) { "Badge" }

    assert_selector("span")
    assert_no_selector("a")
  end

  # Dot

  def test_renders_with_dot_indicator
    render_inline(Flowbite::Badge.new(dot: true)) { "Badge" }

    assert_selector("span.inline-flex.items-center")
    assert_selector("span span.rounded-full.bg-fg-brand-strong")
  end

  def test_dot_has_correct_size_classes
    render_inline(Flowbite::Badge.new(dot: true)) { "Badge" }

    assert_selector("span span.h-1\\.5.w-1\\.5.me-1")
  end

  def test_dot_matches_style_color
    render_inline(Flowbite::Badge.new(dot: true, style: :success)) { "Badge" }

    assert_selector("span span.bg-fg-success-strong")
  end

  # Custom classes

  def test_adds_classes_to_the_default_ones
    render_inline(Flowbite::Badge.new(class: "custom-class")) { "Badge" }

    assert_selector("span.bg-brand-softer.custom-class")
  end

  # Custom options

  def test_passes_additional_options_as_attributes
    render_inline(Flowbite::Badge.new(id: "my-badge", data: {controller: "badge"})) { "Badge" }

    assert_selector("span[id='my-badge'][data-controller='badge']")
  end

  # Combinations

  def test_renders_large_bordered_badge
    render_inline(Flowbite::Badge.new(bordered: true, size: :lg)) { "Badge" }

    assert_selector("span.text-sm.px-2.py-1.border")
  end
end

class Flowbite::Badge::PillTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Badge::Pill.new) { "Pill" }

    assert_component_rendered
    assert_selector("span", text: "Pill")
  end

  def test_renders_with_rounded_full
    render_inline(Flowbite::Badge::Pill.new) { "Pill" }

    assert_selector("span.rounded-full")
  end

  def test_does_not_have_regular_rounded
    render_inline(Flowbite::Badge::Pill.new) { "Pill" }

    assert_no_selector("span.rounded:not(.rounded-full)")
  end

  def test_inherits_style_classes
    render_inline(Flowbite::Badge::Pill.new(style: :success)) { "Pill" }

    assert_selector("span.bg-success-soft.text-fg-success-strong.rounded-full")
  end

  def test_renders_bordered_pill
    render_inline(Flowbite::Badge::Pill.new(bordered: true)) { "Pill" }

    assert_selector("span.rounded-full.border")
  end
end
