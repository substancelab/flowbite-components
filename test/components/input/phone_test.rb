require "test_helper"

require "support/models"

class Flowbite::Input::PhoneTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", phone: "+1-555-123-4567")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_phone_input
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone))

    assert_selector("input[type='tel'][name='user[phone]'][value='+1-555-123-4567']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone))

    assert_selector("input[name='user[phone]'].border-default-medium")
  end

  def test_renders_in_error_state
    @user.errors.add(:phone, :invalid)
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone))

    assert_selector("input[name='user[phone]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone, disabled: true))

    assert_selector("input[name='user[phone]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone, size: :sm))

    assert_selector("input[name='user[phone]'].px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone, size: :lg))

    assert_selector("input[name='user[phone]'].px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone, options: {placeholder: "Enter phone number"}))

    assert_selector("input[name='user[phone]'][placeholder='Enter phone number']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Phone.new(class: "custom-class", form: @form, attribute: :phone))

    assert_selector("input[name='user[phone]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Phone.new(form: @form, attribute: :phone, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[phone]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("input[name='user[phone]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Phone.new(class: "ignored", form: @form, attribute: :phone, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
