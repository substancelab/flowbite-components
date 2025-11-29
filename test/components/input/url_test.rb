require "test_helper"

require "support/models"

class Flowbite::Input::UrlTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", website_url: "https://flowbite.com")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_url_input
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url))

    assert_selector("input[type='url'][name='user[website_url]'][value='https://flowbite.com']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url))

    assert_selector("input[name='user[website_url]'].border-default-medium")
  end

  def test_renders_in_error_state
    @user.errors.add(:website_url, :invalid)
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url))

    assert_selector("input[name='user[website_url]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, disabled: true))

    assert_selector("input[name='user[website_url]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, size: :sm))

    assert_selector("input[name='user[website_url]'].px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, size: :lg))

    assert_selector("input[name='user[website_url]'].px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, options: {placeholder: "Enter website URL"}))

    assert_selector("input[name='user[website_url]'][placeholder='Enter website URL']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Url.new(class: "custom-class", form: @form, attribute: :website_url))

    assert_selector("input[name='user[website_url]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, options: {class: "custom-class"}))

    assert_no_selector("input[name='user[website_url]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("input[name='user[website_url]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Url.new(class: "ignored", form: @form, attribute: :website_url, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
