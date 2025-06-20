require "test_helper"

require "support/models"

class Flowbite::InputFieldTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_renders_a_hint
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title, hint: "What's the title?"))

    assert_selector("input[type='text'][value='The Great Gatsby']")
    assert_selector("p", text: "What's the title?")
  end

  def test_adds_aria_attributes_for_hint
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title, hint: "What's the title?"))

    assert_selector("input[aria-describedby='book_title_hint']")
    assert_selector("p#book_title_hint", text: "What's the title?")
  end

  def test_renders_an_input_element
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("input[type='text'][value='The Great Gatsby']")
  end

  def test_renders_a_label
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("label[for='book_title']")
  end

  def test_passes_input_attributes_to_input_element
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title, input_attributes: {placeholder: "Enter title"}))

    assert_component_rendered
    assert_selector("input[type='text'][placeholder='Enter title']")
  end
end
