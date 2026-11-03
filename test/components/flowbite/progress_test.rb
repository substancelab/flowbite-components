require "test_helper"

class Flowbite::ProgressTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Progress.new(progress: 45))

    assert_component_rendered
    assert_selector("div.w-full.bg-neutral-quaternary.rounded-full.h-2 > div.bg-brand.h-2.rounded-full")
  end

  def test_renders_progress_as_width
    render_inline(Flowbite::Progress.new(progress: 45))

    assert_selector("div.bg-brand[style='width: 45%']")
  end

  # Clamping

  def test_clamps_progress_below_zero
    render_inline(Flowbite::Progress.new(progress: -10))

    assert_selector("div.bg-brand[style='width: 0%']")
  end

  def test_clamps_progress_above_one_hundred
    render_inline(Flowbite::Progress.new(progress: 150))

    assert_selector("div.bg-brand[style='width: 100%']")
  end

  def test_renders_decimal_progress
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: 45.5))

    assert_selector("div.bg-brand[style='width: 45.5%']", text: "45.5%")
  end

  def test_renders_rational_progress_as_decimal
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: Rational(91, 2)))

    assert_selector("div.bg-brand[style='width: 45.5%']", text: "45.5%")
  end

  def test_renders_big_decimal_progress_as_decimal
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: BigDecimal("45.5")))

    assert_selector("div.bg-brand[style='width: 45.5%']", text: "45.5%")
  end

  def test_rounds_progress_to_one_decimal
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: 100.0 / 3))

    assert_selector("div.bg-brand[style='width: 33.3%']", text: "33.3%")
  end

  def test_renders_clamped_progress_in_label
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: 150))

    assert_selector("div.bg-brand", text: "100%")
  end

  # Sizes

  def test_renders_sm_size
    render_inline(Flowbite::Progress.new(progress: 45, size: :sm))

    assert_selector("div.bg-neutral-quaternary.h-1\\.5 > div.bg-brand.h-1\\.5")
  end

  def test_renders_default_size
    render_inline(Flowbite::Progress.new(progress: 45, size: :default))

    assert_selector("div.bg-neutral-quaternary.h-2 > div.bg-brand.h-2")
  end

  def test_renders_lg_size
    render_inline(Flowbite::Progress.new(progress: 45, size: :lg))

    assert_selector("div.bg-neutral-quaternary.h-2\\.5 > div.bg-brand.h-2\\.5")
  end

  # Styles

  def test_renders_brand_style
    render_inline(Flowbite::Progress.new(progress: 45, style: :brand))

    assert_selector("div.bg-brand")
  end

  def test_renders_danger_style
    render_inline(Flowbite::Progress.new(progress: 45, style: :danger))

    assert_selector("div.bg-danger")
  end

  def test_renders_dark_style
    render_inline(Flowbite::Progress.new(progress: 45, style: :dark))

    assert_selector("div.bg-dark")
  end

  def test_renders_success_style
    render_inline(Flowbite::Progress.new(progress: 45, style: :success))

    assert_selector("div.bg-success")
  end

  def test_renders_warning_style
    render_inline(Flowbite::Progress.new(progress: 45, style: :warning))

    assert_selector("div.bg-warning")
  end

  def test_raises_on_unknown_style
    assert_raises(Flowbite::Styles::StyleNotFoundError) do
      render_inline(Flowbite::Progress.new(progress: 45, style: :unknown))
    end
  end

  # Label positions

  def test_renders_no_label_by_default
    render_inline(Flowbite::Progress.new(progress: 45))

    assert_no_text("45%")
    assert_no_selector("span")
  end

  def test_renders_label_inside
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: 45))

    assert_selector(
      "div.bg-brand.text-xs.font-medium.text-white.text-center.p-0\\.5.leading-none.rounded-full.h-4.flex.items-center.justify-center[style='width: 45%']",
      text: "45%"
    )
  end

  def test_label_inside_track_has_no_height
    render_inline(Flowbite::Progress.new(label_position: :inside, progress: 45, size: :lg))

    assert_selector("div.w-full.bg-neutral-quaternary.rounded-full")
    assert_no_selector("div.bg-neutral-quaternary.h-2\\.5")
    assert_no_selector("div.bg-brand.h-2\\.5")
  end

  def test_renders_label_outside
    render_inline(Flowbite::Progress.new(label: "Flowbite", label_position: :outside, progress: 45))

    assert_selector("div.flex.justify-between.mb-1 span.text-sm.font-medium.text-body", text: "Flowbite")
    assert_selector("div.flex.justify-between.mb-1 span.text-sm.font-medium.text-body", text: "45%")
    assert_selector("div.bg-neutral-quaternary.h-2 > div.bg-brand.h-2[style='width: 45%']", text: "")
  end

  def test_renders_only_percentage_inside_when_label_inside
    render_inline(Flowbite::Progress.new(label: "Flowbite", label_position: :inside, progress: 45))

    assert_no_selector("div.justify-between")
    assert_no_text("Flowbite")
  end

  def test_raises_on_unknown_label_position
    assert_raises(ArgumentError) do
      render_inline(Flowbite::Progress.new(label_position: :top, progress: 45))
    end
  end

  # Classes

  def test_renders_bar_classes
    render_inline(Flowbite::Progress.new(progress: 45, size: :lg, style: :success))

    assert_selector("div > div[class='bg-success h-2.5 rounded-full']")
  end

  def test_renders_track_classes
    render_inline(Flowbite::Progress.new(class: "custom-class", progress: 45, size: :sm))

    assert_selector("div[class='w-full bg-neutral-quaternary rounded-full h-1.5 custom-class']")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Progress.new(class: ["custom-class", "another-class"], progress: 45))

    assert_selector("div.bg-neutral-quaternary.custom-class.another-class")
  end

  # Custom options

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Progress.new(data: {controller: "progress"}, id: "my-progress", progress: 45))

    assert_selector("div.bg-neutral-quaternary[id='my-progress'][data-controller='progress']")
  end
end
