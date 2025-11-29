require "test_helper"

require "support/models"

class Flowbite::Input::FileTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", avatar: nil)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_file_input
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar))

    assert_selector("input[type='file'][name='user[avatar]']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar))

    assert_selector("input[name='user[avatar]'].border-default-medium")
  end

  def test_renders_in_error_state
    @user.errors.add(:avatar, :invalid)
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar))

    assert_selector("input[name='user[avatar]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, disabled: true))

    assert_selector("input[name='user[avatar]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, size: :sm))

    assert_selector("input[name='user[avatar]'].text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, size: :lg))

    assert_selector("input[name='user[avatar]'].text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, options: {accept: "image/*"}))

    assert_selector("input[name='user[avatar]'][accept='image/*']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::File.new(class: "custom-class", form: @form, attribute: :avatar))

    assert_selector("input[name='user[avatar]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[avatar]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("input[name='user[avatar]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::File.new(class: "ignored", form: @form, attribute: :avatar, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
