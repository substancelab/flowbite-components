require "test_helper"

class Flowbite::Input::HintTest < Minitest::Test
  include ViewComponent::TestHelpers

  class Book
    include ActiveModel::Model

    attr_accessor :title, :author, :published_at

    validates :title, presence: true
    validates :author, presence: true
  end

  def setup
    @book = Book.new(title: "The Great Gatsby", author: "F. Scott Fitzgerald")
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:book, @book, @view_context, {})
  end

  def test_renders_a_hint
    render_inline(Flowbite::Input::Hint.new(@form, :title, hint: "What's the title?"))

    assert_component_rendered
    assert_selector("p.text-sm.text-gray-500", text: "What's the title?")
  end

  def test_accepts_custom_attributes
    render_inline(Flowbite::Input::Hint.new(@form, :title, hint: "What's the title?", id: "custom_hint"))

    assert_selector("p#custom_hint.text-sm.text-gray-500", text: "What's the title?")
  end
end
