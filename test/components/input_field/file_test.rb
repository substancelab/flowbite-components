require "test_helper"

require "support/models"

class Flowbite::InputField::FileTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", avatar: nil)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_file_input_element
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar))

    assert_selector("input[type='file'][name='user[avatar]']")
  end

  def test_renders_a_label
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar))

    assert_selector("label[for='user_avatar']")
  end

  def test_renders_a_hint
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, hint: {content: "Upload your profile picture"}))

    assert_selector("input[type='file']")
    assert_selector("p", text: "Upload your profile picture")
  end

  def test_adds_aria_attributes_for_hint
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, hint: {content: "Upload your profile picture"}))

    assert_selector("input[aria-describedby='user_avatar_hint']")
    assert_selector("p#user_avatar_hint", text: "Upload your profile picture")
  end

  def test_passes_input_options_to_input_element
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, input: {options: {accept: "image/*"}}))

    assert_selector("input[type='file'][accept='image/*']")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, size: :sm))

    assert_selector("input.text-xs")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, size: :lg))

    assert_selector("input.text-lg")
  end

  def test_renders_disabled_file
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar, disabled: true))

    assert_selector("input[type='file'][disabled]")
  end

  def test_renders_enabled_file_by_default
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar))

    assert_no_selector("input[disabled]")
  end

  def test_renders_error_messages_when_in_error_state
    @user.errors.add(:avatar, "file is too large")
    @user.errors.add(:avatar, "must be an image")

    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar))

    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "File is too large")
    assert_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500", text: "Must be an image")
  end

  def test_does_not_render_error_messages_when_no_errors
    render_inline(Flowbite::InputField::File.new(form: @form, attribute: :avatar))

    assert_no_selector("p.mt-2.text-sm.text-red-600.dark\\:text-red-500")
  end
end
