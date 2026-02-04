require "test_helper"

require "support/models"

class Flowbite::InputTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_renders_a_text_input
    render_inline(Flowbite::Input.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("input[type='text'][name='book[title]'][value='The Great Gatsby']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("input[name='book[title]'].border-default-medium")
  end

  def test_renders_in_error_state
    @book.errors.add(:title, :invalid)
    render_inline(Flowbite::Input.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("input[name='book[title]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input.new(form: @form, attribute: :title, disabled: true))

    assert_component_rendered
    assert_selector("input[name='book[title]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input.new(form: @form, attribute: :title, size: :sm))

    assert_component_rendered
    assert_selector("input[name='book[title]'].px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input.new(form: @form, attribute: :title, size: :lg))

    assert_component_rendered
    assert_selector("input[name='book[title]'].px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input.new(form: @form, attribute: :title, options: {placeholder: "Enter title"}))

    assert_component_rendered
    assert_selector("input[name='book[title]'][placeholder='Enter title']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input.new(class: "custom-class", form: @form, attribute: :title))

    assert_selector("input[name='book[title]'].bg-neutral-secondary-medium.custom-class")
  end
end
