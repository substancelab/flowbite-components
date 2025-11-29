require "test_helper"

require "support/models"

class Flowbite::Input::PasswordTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", password: "secret123")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_password_input
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password))

    assert_selector("input[type='password'][name='user[password]']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password))

    assert_selector("input[name='user[password]'].border-default-medium")
  end

  def test_renders_in_error_state
    @user.errors.add(:password, :invalid)
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password))

    assert_selector("input[name='user[password]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password, disabled: true))

    assert_selector("input[name='user[password]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password, size: :sm))

    assert_selector("input[name='user[password]'].px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password, size: :lg))

    assert_selector("input[name='user[password]'].px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password, options: {placeholder: "Enter password"}))

    assert_selector("input[name='user[password]'][placeholder='Enter password']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Password.new(class: "custom-class", form: @form, attribute: :password))

    assert_selector("input[name='user[password]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_does_not_show_password_value
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password))

    refute_selector("input[value='secret123']")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Password.new(form: @form, attribute: :password, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[password]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("input[name='user[password]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Password.new(class: "ignored", form: @form, attribute: :password, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
