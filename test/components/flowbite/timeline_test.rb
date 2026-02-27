require "test_helper"

class Flowbite::TimelineTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Timeline.new) { "Content" }

    assert_component_rendered
    assert_selector("ol", text: "Content")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Timeline.new) { "Content" }

    assert_selector("ol.relative.border-s.border-default")
  end

  # Custom classes

  def test_adds_classes_to_the_default_ones
    render_inline(Flowbite::Timeline.new(class: "custom-class")) { "Content" }

    assert_selector("ol.relative.border-default.custom-class")
  end

  # Custom options

  def test_passes_additional_options_as_attributes
    render_inline(Flowbite::Timeline.new(id: "my-timeline", data: {controller: "timeline"})) { "Content" }

    assert_selector("ol[id='my-timeline'][data-controller='timeline']")
  end
end

class Flowbite::Timeline::ItemTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description" }

    assert_component_rendered
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description" }

    assert_selector("li.mb-10.ms-4")
  end

  # Dot

  def test_renders_dot_marker
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description" }

    assert_selector("li div.absolute.rounded-full.bg-neutral-quaternary.border.border-buffer.h-3.w-3")
  end

  # Datetime

  def test_renders_datetime
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description" }

    assert_selector("time.text-sm.font-normal.text-body", text: "February 2022")
  end

  # Title

  def test_renders_title
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description" }

    assert_selector("h3.text-lg.font-semibold.text-heading", text: "Event title")
  end

  # Body

  def test_renders_body_content
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) { "Description text" }

    assert_selector("p.text-base.font-normal.text-body", text: "Description text")
  end

  # Custom classes

  def test_adds_classes_to_the_default_ones
    render_inline(Flowbite::Timeline::Item.new(class: "custom-class", datetime: "February 2022", title: "Event title")) { "Description" }

    assert_selector("li.mb-10.ms-4.custom-class")
  end

  # Custom options

  def test_passes_additional_options_as_attributes
    render_inline(Flowbite::Timeline::Item.new(datetime: "February 2022", id: "my-item", title: "Event title")) { "Description" }

    assert_selector("li[id='my-item']")
  end
end
