require "test_helper"

require "support/models"

class Flowbite::Input::LabelTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_renders_a_label
    render_inline(Flowbite::Input::Label.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("label[for='book_title']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Label.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("label[for='book_title'].text-gray-900")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Label.new(form: @form, attribute: :title, disabled: true))

    assert_selector("label[for='book_title'].text-gray-400")
  end

  def test_renders_in_error_state
    @book.errors.add(:title, :invalid)
    render_inline(Flowbite::Input::Label.new(form: @form, attribute: :title))

    assert_component_rendered
    assert_selector("label[for='book_title'].text-red-700")
  end

  def test_sets_class_attribute
    render_inline(Flowbite::Input::Label.new(form: @form, attribute: :title, label_attributes: {class: "toggle"}))

    assert_selector("label.toggle")
  end

  def test_renders_specified_label_text
    render_inline(
      Flowbite::Input::Label.new(form: @form, attribute: :title)
        .with_content("This is not the default label")
    )

    assert_selector("label[for='book_title']", text: "This is not the default label")
  end
end
