require "test_helper"

class Flowbite::Input::ValidationErrorTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_validation_error_message
    render_inline(Flowbite::Input::ValidationError.new) { "This field is required" }

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "This field is required")
  end

  def test_renders_with_empty_message
    render_inline(Flowbite::Input::ValidationError.new) { "" }

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "")
  end

  def test_renders_with_html_escaped_message
    render_inline(Flowbite::Input::ValidationError.new) { "Field must be <strong>valid</strong>" }

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "Field must be <strong>valid</strong>")
    refute_selector("p strong")
  end

  def test_renders_with_multiline_message
    message = "This field has multiple validation errors:\n- Cannot be blank\n- Must be at least 5 characters"
    render_inline(Flowbite::Input::ValidationError.new) { message }

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: message)
  end
end
