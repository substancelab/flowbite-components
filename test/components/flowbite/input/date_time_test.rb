require "test_helper"

require "support/models"

class Flowbite::Input::DateTimeTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald", published_at: Time.new(1925, 4, 10, 12, 0, 0))
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_render_component
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at))

    assert_component_rendered
    assert_selector("input[type='datetime-local']")
  end

  def test_renders_with_name_attribute
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at))

    assert_selector("input[name='book[published_at]']")
  end

  def test_renders_with_id_attribute
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at))

    assert_selector("input[id='book_published_at']")
  end

  def test_renders_small_size
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at, size: :sm))

    assert_selector("input.text-sm.px-2\\.5.py-2")
  end

  def test_renders_default_size
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at))

    assert_selector("input.text-sm.px-3.py-2\\.5")
  end

  def test_renders_large_size
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at, size: :lg))

    assert_selector("input.text-base.px-3\\.5.py-3")
  end

  def test_renders_disabled_state
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at, disabled: true))

    assert_selector("input[disabled]")
  end

  def test_passes_custom_options
    render_inline(Flowbite::Input::DateTime.new(form: @form, attribute: :published_at, options: {placeholder: "Select date and time"}))

    assert_selector("input[placeholder='Select date and time']")
  end
end
