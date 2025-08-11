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

    assert_selector("input[name='user[website_url]'].border-gray-300")
  end

  def test_renders_in_error_state
    @user.errors.add(:website_url, :invalid)
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url))

    assert_selector("input[name='user[website_url]'].border-red-500")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, disabled: true))

    assert_selector("input[name='user[website_url]'][disabled].bg-gray-100.border.border-gray-300.text-gray-900.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, size: :sm))

    assert_selector("input[name='user[website_url]'].p-2.text-xs")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, size: :lg))

    assert_selector("input[name='user[website_url]'].text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Url.new(form: @form, attribute: :website_url, options: {placeholder: "Enter website URL"}))

    assert_selector("input[name='user[website_url]'][placeholder='Enter website URL']")
  end
end
