require "test_helper"

require "support/models"

class Flowbite::Input::SelectTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @categories = [
      Category.new(1, "Technology"),
      Category.new(2, "Science"),
      Category.new(3, "Sports")
    ]
    @article = Article.new(title: "Test Article", category_id: 2)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:article, @article, @view_context, {})
  end

  def test_renders_a_select_input
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }))

    assert_selector("select[name='article[category_id]']")
    assert_selector("option[value='1']", text: "Technology")
    assert_selector("option[value='2'][selected]", text: "Science")
    assert_selector("option[value='3']", text: "Sports")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }))

    assert_selector("select[name='article[category_id]'].bg-neutral-secondary-medium.border-default-medium.text-heading.rounded-base")
  end

  def test_renders_in_error_state
    @article.errors.add(:category_id, :invalid)
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }))

    assert_selector("select[name='article[category_id]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, disabled: true))

    assert_selector("select[name='article[category_id]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_include_blank
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, include_blank: true))

    assert_selector("select[name='article[category_id]'] option[value='']", text: "")
  end

  def test_renders_with_multiple_select
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, multiple: true))

    assert_selector("select[name='article[category_id][]'][multiple]")
  end

  def test_renders_with_empty_collection
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: []))

    assert_selector("select[name='article[category_id]']")
    refute_selector("option")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, size: :sm))

    assert_selector("select.px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, size: :lg))

    assert_selector("select.px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, options: {"data-controller": "interactive"}))

    assert_selector("select[name='article[category_id]'][data-controller='interactive']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Select.new(class: "custom-class", form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }))

    assert_selector("select[name='article[category_id]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Select.new(form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, options: {class: "custom-class"}))

    assert_no_selector("select[name='article[category_id]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("select[name='article[category_id]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Select.new(class: "ignored", form: @form, attribute: :category_id, collection: @categories.map { |c| [c.name, c.id] }, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
