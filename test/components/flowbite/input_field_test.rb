require "test_helper"

class Flowbite::InputFieldTest < Minitest::Test
  include ViewComponent::TestHelpers

  class Book
    include ActiveModel::Model

    attr_accessor :title, :author, :published_at

    validates :title, presence: true
    validates :author, presence: true
  end

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
