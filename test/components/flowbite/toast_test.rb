require "test_helper"

class Flowbite::ToastTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Toast.new(message: "Test message"))

    assert_component_rendered
    assert_selector("div[role='alert']", text: "Test message")
  end

  def test_renders_message
    render_inline(Flowbite::Toast.new(message: "Hello, World!"))

    assert_selector("div", text: "Hello, World!")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Toast.new(message: "Test"))

    assert_selector("div.flex.items-center.w-full.max-w-xs.p-4")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Toast.new(message: "Test", class: ["custom-class", "another-class"]))

    assert_selector("div.custom-class.another-class")
  end

  def test_renders_dismissible_button_by_default
    render_inline(Flowbite::Toast.new(message: "Test"))

    assert_selector("button[type='button'][aria-label='Close']")
  end

  def test_renders_without_dismissible_button
    render_inline(Flowbite::Toast.new(message: "Test", dismissible: false))

    assert_no_selector("button[type='button'][aria-label='Close']")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Toast.new(message: "Test", id: "my-toast", "data-controller": "toast"))

    assert_selector("div[id='my-toast'][data-controller='toast']")
  end

  def test_renders_default_style_icon
    render_inline(Flowbite::Toast.new(message: "Test", style: :default))

    assert_selector("div.text-blue-500.bg-blue-100")
  end

  def test_renders_success_style_icon
    render_inline(Flowbite::Toast.new(message: "Test", style: :success))

    assert_selector("div.text-green-500.bg-green-100")
  end

  def test_renders_danger_style_icon
    render_inline(Flowbite::Toast.new(message: "Test", style: :danger))

    assert_selector("div.text-red-500.bg-red-100")
  end

  def test_renders_warning_style_icon
    render_inline(Flowbite::Toast.new(message: "Test", style: :warning))

    assert_selector("div.text-orange-500.bg-orange-100")
  end
end

class Flowbite::Toast::IconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Toast::Icon.new)

    assert_component_rendered
    assert_selector("svg")
  end

  def test_renders_default_style
    render_inline(Flowbite::Toast::Icon.new(style: :default))

    assert_selector("div.text-blue-500.bg-blue-100")
  end

  def test_renders_success_style
    render_inline(Flowbite::Toast::Icon.new(style: :success))

    assert_selector("div.text-green-500.bg-green-100")
  end

  def test_renders_danger_style
    render_inline(Flowbite::Toast::Icon.new(style: :danger))

    assert_selector("div.text-red-500.bg-red-100")
  end

  def test_renders_warning_style
    render_inline(Flowbite::Toast::Icon.new(style: :warning))

    assert_selector("div.text-orange-500.bg-orange-100")
  end

  def test_renders_svg_with_proper_attributes
    render_inline(Flowbite::Toast::Icon.new)

    assert_selector("svg[aria-hidden='true']")
    assert_selector("svg[fill='currentColor']")
  end

  def test_renders_icon_with_proper_classes
    render_inline(Flowbite::Toast::Icon.new)

    assert_selector("div.inline-flex.items-center.justify-center.shrink-0.w-8.h-8")
  end
end
