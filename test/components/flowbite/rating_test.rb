require "test_helper"

class Flowbite::RatingTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Rating.new(value: 4))

    assert_component_rendered
    assert_selector("div.flex.items-center > div.flex.items-center.space-x-1")
    assert_selector("svg[aria-hidden='true']", count: 5)
  end

  def test_renders_filled_and_empty_stars
    render_inline(Flowbite::Rating.new(value: 4))

    assert_selector("svg.text-fg-yellow", count: 4)
    assert_selector("svg.text-fg-disabled", count: 1)
  end

  def test_rounds_value_to_nearest_star
    render_inline(Flowbite::Rating.new(value: 3.5))

    assert_selector("svg.text-fg-yellow", count: 4)
    assert_selector("svg.text-fg-disabled", count: 1)
  end

  def test_rounds_value_down_to_nearest_star
    render_inline(Flowbite::Rating.new(value: 3.4))

    assert_selector("svg.text-fg-yellow", count: 3)
    assert_selector("svg.text-fg-disabled", count: 2)
  end

  def test_renders_no_filled_stars_for_zero
    render_inline(Flowbite::Rating.new(value: 0))

    assert_no_selector("svg.text-fg-yellow")
    assert_selector("svg.text-fg-disabled", count: 5)
  end

  def test_renders_custom_max
    render_inline(Flowbite::Rating.new(max: 10, value: 7))

    assert_selector("svg", count: 10)
    assert_selector("svg.text-fg-yellow", count: 7)
    assert_selector("svg.text-fg-disabled", count: 3)
  end

  def test_renders_screen_reader_text
    render_inline(Flowbite::Rating.new(value: 4.95))

    assert_selector("span.sr-only", text: "Rated 4.95 out of 5")
  end

  def test_renders_text
    render_inline(Flowbite::Rating.new(text: "4.95 out of 5", value: 4.95))

    assert_selector("p.ms-2.text-sm.font-medium.text-body", text: "4.95 out of 5")
  end

  def test_renders_without_text_by_default
    render_inline(Flowbite::Rating.new(value: 4))

    assert_no_selector("p")
  end

  def test_renders_default_size
    render_inline(Flowbite::Rating.new(value: 4))

    assert_selector("svg.w-5.h-5", count: 5)
  end

  def test_renders_md_size
    render_inline(Flowbite::Rating.new(size: :md, value: 4))

    assert_selector("svg.w-6.h-6", count: 5)
  end

  def test_renders_lg_size
    render_inline(Flowbite::Rating.new(size: :lg, value: 4))

    assert_selector("svg.w-7.h-7", count: 5)
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Rating.new(class: ["custom-class", "another-class"], value: 4))

    assert_selector("div.flex.items-center.custom-class.another-class")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Rating.new("data-controller": "rating", id: "my-rating", value: 4))

    assert_selector("div[id='my-rating'][data-controller='rating']")
  end

  def test_rounds_half_values_up
    render_inline(Flowbite::Rating.new(value: 4.5))

    assert_selector("svg.text-fg-yellow", count: 5)
  end

  def test_clamps_value_above_max
    render_inline(Flowbite::Rating.new(value: 7))

    assert_selector("svg", count: 5)
    assert_selector("svg.text-fg-yellow", count: 5)
  end

  def test_clamps_negative_value
    render_inline(Flowbite::Rating.new(value: -1))

    assert_selector("svg.text-fg-disabled", count: 5)
  end

  def test_renders_screen_reader_text_with_custom_max
    render_inline(Flowbite::Rating.new(max: 10, value: 7))

    assert_selector("span.sr-only", text: "Rated 7 out of 10")
  end
end

class Flowbite::Rating::StarTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Rating::Star.new)

    assert_component_rendered
    assert_selector("svg[aria-hidden='true'][fill='currentColor'] path")
  end

  def test_renders_filled_star_by_default
    render_inline(Flowbite::Rating::Star.new)

    assert_selector("svg.w-5.h-5.text-fg-yellow")
  end

  def test_renders_empty_star
    render_inline(Flowbite::Rating::Star.new(filled: false))

    assert_selector("svg.text-fg-disabled")
    assert_no_selector("svg.text-fg-yellow")
  end

  def test_renders_md_size
    render_inline(Flowbite::Rating::Star.new(size: :md))

    assert_selector("svg.w-6.h-6")
  end

  def test_renders_lg_size
    render_inline(Flowbite::Rating::Star.new(size: :lg))

    assert_selector("svg.w-7.h-7")
  end
end
