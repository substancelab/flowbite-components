require "test_helper"

require "support/models"

class Flowbite::Input::CheckboxTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", subscribed: true)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_checkbox_input
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][name='user[subscribed]'][value='1']")
  end

  def test_renders_checked_when_true
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][checked]")
  end

  def test_renders_unchecked_when_false
    @user.subscribed = false
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][name='user[subscribed]']")
    refute_selector("input[checked]")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[name='user[subscribed]'].border-gray-300")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, disabled: true))

    assert_selector("input[name='user[subscribed]'][disabled].bg-gray-100.border-gray-300.text-blue-600")
  end

  def test_sets_value
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, value: "yes"))

    assert_selector("input[name='user[subscribed]'][value='yes']")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, options: {"data-controller": "checkbox"}))

    assert_selector("input[name='user[subscribed]'][data-controller='checkbox']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Checkbox.new(class: "custom-class", form: @form, attribute: :subscribed))

    assert_selector("input[name='user[subscribed]'].bg-gray-100.custom-class")
  end

  def test_renders_a_hidden_input_for_the_unchecked_case
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, options: {"data-controller": "checkbox"}))

    assert_selector("input[type='hidden'][name='user[subscribed]'][value='0']", visible: false)
  end

  def test_renders_a_hidden_input_for_the_unchecked_case_with_unchecked_value
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, unchecked_value: "off"))

    assert_selector("input[type='hidden'][name='user[subscribed]'][value='off']", visible: false)
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Checkbox.new(form: @form, attribute: :subscribed, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[subscribed]'].bg-gray-100.custom-class")
    assert_selector("input[name='user[subscribed]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Checkbox.new(class: "ignored", form: @form, attribute: :subscribed, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
