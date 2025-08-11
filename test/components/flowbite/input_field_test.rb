require "test_helper"

require "support/models"

class Flowbite::InputFieldTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald", state: "read")
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

  def test_renders_a_label_with_specified_content
    render_inline(
      Flowbite::InputField.new(form: @form, attribute: :title, label: {content: "Custom label"})
    )

    assert_selector("label[for='book_title']", text: "Custom label")
  end

  def test_renders_a_label_with_specified_attributes
    render_inline(
      Flowbite::InputField.new(form: @form, attribute: :title, label: {label_options: {class: "custom-label"}})
    )

    assert_selector("label[for='book_title'].custom-label")
  end

  def test_replaces_the_label_component_using_with_label_content
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title)) do |field|
      field
        .with_label_content("<label id=\"my-label\">Custom label</label>".html_safe)
    end

    assert_no_selector("label[for='book_title'].custom-class")
    assert_selector("label#my-label", text: "Custom label")
  end

  def test_replaces_the_label_component_using_with_label_and_with_content
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title)) do |field|
      field
        .with_label.with_content("Custom label")
    end

    assert_no_selector("label[for='book_title'].custom-class")
    assert_text("Custom label")
  end

  def test_replaces_the_label_component_using_with_label
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title)) do |field|
      field
        .with_label { "Block with a full component" }
    end

    assert_no_selector("label[for='book_title']")
    assert_text("Block with a full component")
  end

  def test_passes_input_options_to_input_element
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title, input: {input_options: {placeholder: "Enter title"}}))

    assert_component_rendered
    assert_selector("input[type='text'][placeholder='Enter title']")
  end

  def test_renders_a_large_select_element
    render_inline(Flowbite::InputField::Select.new(form: @form, attribute: :state, collection: ["read", "unread"], size: :lg))

    assert_selector("select.text-base.px-4.py-3")
  end

  def test_passes_input_options_to_select_element
    render_inline(Flowbite::InputField::Select.new(form: @form, attribute: :state, collection: ["read", "unread"], input: {input_options: {"data-key": "state-select"}}))

    assert_selector("select[data-key='state-select']")
  end

  def test_renders_disabled_input_field
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title, disabled: true))

    assert_selector("input[disabled]")
  end

  def test_renders_enabled_input_field_by_default
    render_inline(Flowbite::InputField.new(form: @form, attribute: :title))

    assert_no_selector("input[disabled]")
  end

  def test_renders_disabled_select
    render_inline(Flowbite::InputField::Select.new(form: @form, attribute: :state, collection: ["read", "unread"], disabled: true))

    assert_selector("select[disabled]")
  end
end
