require "test_helper"

require "support/models"

class Flowbite::Input::HintTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_renders_a_hint
    render_inline(Flowbite::Input::Hint.new(form: @form, attribute: :title)) { "What's the title?" }

    assert_component_rendered
    assert_selector("p.mt-2\\.5.text-sm.text-body", text: "What's the title?")
  end

  def test_accepts_custom_id
    render_inline(Flowbite::Input::Hint.new(form: @form, attribute: :title, options: {id: "custom_hint"})) { "What's the title?" }

    assert_selector("p#custom_hint.mt-2\\.5.text-sm.text-body", text: "What's the title?")
  end

  def test_accepts_custom_attributes
    render_inline(Flowbite::Input::Hint.new(form: @form, attribute: :title, options: {"aria-describedby": "someid"})) { "What's the title?" }

    assert_selector("p[aria-describedby='someid']", text: "What's the title?")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Hint.new(class: "custom-class", form: @form, attribute: :title)) { "What's the title?" }

    assert_selector("p.mt-2\\.5.text-sm.text-body.custom-class", text: "What's the title?")
  end
end
