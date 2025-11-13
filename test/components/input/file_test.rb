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

    assert_selector("input[name='user[avatar]'].border-gray-300")
  end

  def test_renders_in_error_state
    @user.errors.add(:avatar, :invalid)
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar))

    assert_selector("input[name='user[avatar]'].border-red-500")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, disabled: true))

    assert_selector("input[name='user[avatar]'][disabled].bg-gray-100.border.border-gray-300.text-gray-400.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, size: :sm))

    assert_selector("input[name='user[avatar]'].text-xs")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, size: :lg))

    assert_selector("input[name='user[avatar]'].text-lg")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::File.new(form: @form, attribute: :avatar, options: {accept: "image/*"}))

    assert_selector("input[name='user[avatar]'][accept='image/*']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::File.new(class: "custom-class", form: @form, attribute: :avatar))

    assert_selector("input[name='user[avatar]'].bg-gray-50.custom-class")
  end
end
