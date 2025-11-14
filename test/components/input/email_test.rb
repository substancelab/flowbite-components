require "test_helper"

require "support/models"

class Flowbite::Input::EmailTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", email: "john@example.com")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_an_email_input
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email))

    assert_selector("input[type='email'][name='user[email]'][value='john@example.com']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email))

    assert_selector("input[name='user[email]'].border-gray-300")
  end

  def test_renders_in_error_state
    @user.errors.add(:email, :invalid)
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email))

    assert_selector("input[name='user[email]'].border-red-500")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email, disabled: true))

    assert_selector("input[name='user[email]'][disabled].bg-gray-100.border.border-gray-300.text-gray-900.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email, size: :sm))

    assert_selector("input[name='user[email]'].p-2.text-xs")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email, size: :lg))

    assert_selector("input[name='user[email]'].text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email, options: {placeholder: "Enter email address"}))

    assert_selector("input[name='user[email]'][placeholder='Enter email address']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Email.new(class: "custom-class", form: @form, attribute: :email))

    assert_selector("input[name='user[email]'].bg-gray-50.custom-class")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Email.new(form: @form, attribute: :email, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[email]'].bg-gray-50.custom-class")
    assert_selector("input[name='user[email]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Email.new(class: "ignored", form: @form, attribute: :email, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
