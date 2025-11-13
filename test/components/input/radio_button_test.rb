require "test_helper"

require "support/models"

class Flowbite::Input::RadioButtonTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @article = Article.new(state: "published")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:article, @article, @view_context, {})
  end

  def test_renders_a_radio_button
    render_inline(Flowbite::Input::RadioButton.new(form: @form, attribute: :state, value: "published"))

    assert_selector("input[type='radio'][name='article[state]']")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Input::RadioButton.new(form: @form, attribute: :state, value: "published"))

    assert_selector("input[type='radio'][name='article[state]'].text-blue-600.bg-gray-100.border-gray-300")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::RadioButton.new(form: @form, attribute: :state, value: "published", disabled: true))

    assert_selector("input[type='radio'][name='article[state]'][disabled].text-blue-600.bg-gray-100.border-gray-300")
  end

  def test_adds_attributes_to_radio_button
    render_inline(Flowbite::Input::RadioButton.new(form: @form, attribute: :state, value: "published", options: {data: {target: "item"}}))

    assert_selector("input[type='radio'][name='article[state]'][data-target='item']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::RadioButton.new(class: "custom-class", form: @form, attribute: :state, value: "published"))

    assert_selector("input[type='radio'][name='article[state]'].text-blue-600.bg-gray-100.border-gray-300.custom-class")
  end
end
