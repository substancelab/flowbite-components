require "test_helper"

require "support/models"

class Flowbite::InputField::CheckboxTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", subscribed: true)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_checkbox_input_element
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][name='user[subscribed]']")
  end

  def test_renders_a_label
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("label[for='user_subscribed'].font-medium.text-gray-900")
  end

  def test_renders_checked_when_true
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][checked]")
  end

  def test_renders_unchecked_when_false
    @user.subscribed = false
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed))

    assert_selector("input[type='checkbox'][name='user[subscribed]']")
    refute_selector("input[checked]")
  end

  def test_renders_a_hint
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed, hint: "Check to receive updates"))

    assert_selector("p.text-xs.font-normal.text-gray-500", text: "Check to receive updates")
  end

  def test_adds_aria_attributes_for_hint
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed, hint: "Check to receive updates"))

    assert_selector("input[aria-describedby='user_subscribed_hint']")
    assert_selector("p#user_subscribed_hint", text: "Check to receive updates")
  end

  def test_passes_input_options_to_input_element
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed, input: {options: {"data-controller": "checkbox"}}))

    assert_selector("input[type='checkbox'][data-controller='checkbox']")
  end

  def test_renders_disabled_checkbox
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed, disabled: true))

    assert_selector("input[type='checkbox'][disabled]")
  end

  def test_renders_disabled_label
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed, disabled: true))

    assert_selector("label[for='user_subscribed'].text-gray-400")
  end

  def test_renders_enabled_checkbox_by_default
    render_inline(Flowbite::InputField::Checkbox.new(form: @form, attribute: :subscribed))

    assert_no_selector("input[disabled]")
  end
end
