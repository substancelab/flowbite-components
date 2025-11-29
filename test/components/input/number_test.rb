require "test_helper"

require "support/models"

class Flowbite::Input::NumberTest < Minitest::Test
  include ViewComponent::TestHelpers

  def setup
    @product = Product.new(name: "Widget", price: 19.99, quantity: 5)
    @view_context = ActionController::Base.new.view_context
    @form = ActionView::Helpers::FormBuilder.new(:product, @product, @view_context, {})
  end

  def test_renders_a_number_input
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price))

    assert_selector("input[type='number'][name='product[price]'][value='19.99']")
  end

  def test_renders_with_default_state
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price))

    assert_selector("input[name='product[price]'].border-default-medium")
  end

  def test_renders_in_error_state
    @product.errors.add(:price, :invalid)
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price))

    assert_selector("input[name='product[price]'].border-danger-subtle")
  end

  def test_renders_in_disabled_state
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price, disabled: true))

    assert_selector("input[name='product[price]'][disabled].bg-neutral-secondary-medium.border.border-default-medium.text-fg-disabled.cursor-not-allowed")
  end

  def test_renders_with_sm_size
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price, size: :sm))

    assert_selector("input[name='product[price]'].px-2\\.5.py-2.text-sm")
  end

  def test_renders_with_lg_size
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price, size: :lg))

    assert_selector("input[name='product[price]'].px-3\\.5.py-3.text-base")
  end

  def test_adds_attributes_to_input
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price, options: {placeholder: "Enter price", step: "0.01"}))

    assert_selector("input[name='product[price]'][placeholder='Enter price'][step='0.01']")
  end

  def test_adds_class_attribute_to_existing_classes
    render_inline(Flowbite::Input::Number.new(class: "custom-class", form: @form, attribute: :price))

    assert_selector("input[name='product[price]'].bg-neutral-secondary-medium.custom-class")
  end

  def test_renders_integer_field
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :quantity))

    assert_selector("input[type='number'][name='product[quantity]'][value='5']")
  end

  def test_replaces_class_attribute_with_options_class
    render_inline(Flowbite::Input::Number.new(form: @form, attribute: :price, options: {class: "custom-class"}))

    assert_no_selector("input[name='product[price]'].bg-neutral-secondary-medium.custom-class")
    assert_selector("input[name='product[price]'].custom-class")
  end

  def test_ignores_class_attribute_when_options_class_is_present
    render_inline(Flowbite::Input::Number.new(class: "ignored", form: @form, attribute: :price, options: {class: "custom-class"}))

    assert_no_selector(".ignored")
    assert_selector(".custom-class")
  end
end
