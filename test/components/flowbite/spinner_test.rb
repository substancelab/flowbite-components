require "test_helper"

class Flowbite::SpinnerTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Spinner.new)

    assert_component_rendered
    assert_selector("div[role='status']")
    assert_selector("svg[aria-hidden='true']")
  end

  def test_renders_default_message_for_screen_readers
    render_inline(Flowbite::Spinner.new)

    assert_selector("span.sr-only", text: "Loading...")
  end

  def test_renders_custom_message_for_screen_readers
    render_inline(Flowbite::Spinner.new(message: "Fetching results..."))

    assert_selector("span.sr-only", text: "Fetching results...")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Spinner.new)

    assert_selector("svg.animate-spin.text-neutral-tertiary.fill-brand.w-8.h-8")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Spinner.new(class: ["custom-class", "another-class"]))

    assert_selector("svg.custom-class.another-class")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Spinner.new(id: "my-spinner", "data-controller": "spinner"))

    assert_selector("div[id='my-spinner'][data-controller='spinner']")
  end

  def test_renders_xs_size
    render_inline(Flowbite::Spinner.new(size: :xs))

    assert_selector("svg.w-4.h-4")
  end

  def test_renders_sm_size
    render_inline(Flowbite::Spinner.new(size: :sm))

    assert_selector("svg.w-6.h-6")
  end

  def test_renders_lg_size
    render_inline(Flowbite::Spinner.new(size: :lg))

    assert_selector("svg.w-10.h-10")
  end

  def test_renders_xl_size
    render_inline(Flowbite::Spinner.new(size: :xl))

    assert_selector("svg.w-12.h-12")
  end

  def test_renders_brand_style
    render_inline(Flowbite::Spinner.new(style: :brand))

    assert_selector("svg.fill-brand")
  end

  def test_renders_success_style
    render_inline(Flowbite::Spinner.new(style: :success))

    assert_selector("svg.fill-success")
  end

  def test_renders_danger_style
    render_inline(Flowbite::Spinner.new(style: :danger))

    assert_selector("svg.fill-danger")
  end

  def test_renders_warning_style
    render_inline(Flowbite::Spinner.new(style: :warning))

    assert_selector("svg.fill-warning")
  end
end
