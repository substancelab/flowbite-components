require "test_helper"

require "support/models"

class Flowbite::InputField::RadioButtonTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @article = Article.new(state: "draft")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:article, @article, @view_context, {})
  end

  def test_renders_a_radio_button_input_element
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_selector("input[type='radio'][name='article[state]'][value='visible']")
  end

  def test_renders_a_label
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_selector("label[for='article_state_visible'].font-medium.text-gray-900")
  end

  def test_renders_a_label_with_specified_text
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible", label: {content: "Visible"}))

    assert_selector("label[for='article_state_visible'].font-medium.text-gray-900", text: "Visible")
  end

  def test_renders_checked_when_true
    @article.state = "visible"
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_selector("input[type='radio'][checked]")
  end

  def test_renders_unchecked_when_false
    @article.state = "draft"
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_selector("input[type='radio'][name='article[state]'][value='visible']")
    refute_selector("input[checked]")
  end

  def test_renders_a_hint
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible", hint: "Profile can be accessed publicly"))

    assert_selector("p.text-xs.font-normal.text-gray-500", text: "Profile can be accessed publicly")
  end

  def test_adds_aria_attributes_for_hint
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, hint: "Profile can be accessed publicly", value: "visible"))

    assert_selector("input[aria-describedby='article_state_visible_hint']")
    assert_selector("p#article_state_visible_hint", text: "Profile can be accessed publicly")
  end

  def test_passes_input_options_to_input_element
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, input: {options: {"data-controller": "radio"}}, value: "visible"))

    assert_selector("input[type='radio'][data-controller='radio']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, class: "custom-class", value: "visible"))

    assert_selector("div.custom-class input[type='radio']")
  end

  def test_renders_disabled_radio
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, disabled: true, value: "visible"))

    assert_selector("input[type='radio'][disabled]")
  end

  def test_renders_disabled_label
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, disabled: true, value: "visible"))

    assert_selector("label[for='article_state_visible'].text-gray-400")
  end

  def test_renders_enabled_radio_by_default
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_no_selector("input[disabled]")
  end

  def test_renders_error_messages_when_in_error_state
    @article.errors.add(:state, "is not a valid option")
    @article.errors.add(:state, "must be selected")

    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "Is not a valid option")
    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "Must be selected")
  end

  def test_does_not_render_error_messages_when_no_errors
    render_inline(Flowbite::InputField::RadioButton.new(form: @form, attribute: :state, value: "visible"))

    assert_no_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500")
  end
end
