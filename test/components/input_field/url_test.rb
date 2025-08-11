require "test_helper"

require "support/models"

class Flowbite::InputField::UrlTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @user = User.new(name: "John Doe", website_url: "https://flowbite.com")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:user, @user, @view_context, {})
  end

  def test_renders_a_url_input_element
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url))

    assert_selector("input[type='url'][name='user[website_url]'][value='https://flowbite.com']")
  end

  def test_renders_a_label
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url))

    assert_selector("label[for='user_website_url']")
  end

  def test_renders_a_hint
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, hint: "Enter your website URL"))

    assert_selector("input[type='url']")
    assert_selector("p", text: "Enter your website URL")
  end

  def test_adds_aria_attributes_for_hint
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, hint: "Enter your website URL"))

    assert_selector("input[aria-describedby='user_website_url_hint']")
    assert_selector("p#user_website_url_hint", text: "Enter your website URL")
  end

  def test_passes_input_options_to_input_element
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, input: {options: {placeholder: "Enter website URL"}}))

    assert_selector("input[type='url'][placeholder='Enter website URL']")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, size: :sm))

    assert_selector("input.p-2.text-xs")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, size: :lg))

    assert_selector("input.text-base")
  end

  def test_renders_disabled_url
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url, disabled: true))

    assert_selector("input[type='url'][disabled]")
  end

  def test_renders_enabled_url_by_default
    render_inline(Flowbite::InputField::Url.new(form: @form, attribute: :website_url))

    assert_no_selector("input[disabled]")
  end
end
