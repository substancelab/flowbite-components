require "test_helper"

class Flowbite::Input::LabelTest < Minitest::Test
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

  def test_renders_a_label
    render_inline(Flowbite::Input::Label.new(@form, :title))

    assert_component_rendered
    assert_selector("label[for='book_title']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Label.new(@form, :title))

    assert_component_rendered
    assert_selector("label[for='book_title'].text-gray-900")
  end

  def test_renders_in_error_state
    @book.errors.add(:title, :invalid)
    render_inline(Flowbite::Input::Label.new(@form, :title))

    assert_component_rendered
    assert_selector("label[for='book_title'].text-red-700")
  end
end
