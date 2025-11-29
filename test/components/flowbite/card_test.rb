require "test_helper"

class Flowbite::CardTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_a_default_card
    render_inline(Flowbite::Card.new) { "Card Content" }

    assert_selector("div.p-6.bg-neutral-primary-soft.border.border-default.rounded-base.shadow-xs")
  end

  def test_passes_options_to_the_card_as_attributes
    render_inline(Flowbite::Card.new(options: {id: "card-1"})) { "Card Content" }

    assert_selector("div#card-1")
  end

  def test_adds_the_classes_to_the_default_classes
    render_inline(Flowbite::Card.new(class: "custom-class another")) { "Card Content" }

    assert_selector("div.p-6.bg-neutral-primary-soft.border.border-default.rounded-base.shadow-xs.custom-class.another")
  end

  def test_overrides_the_default_classes
    render_inline(Flowbite::Card.new(options: {class: "custom-class another"})) { "Card Content" }

    assert_no_selector("div.p-6.bg-neutral-primary-soft.border.border-default.rounded-base.shadow-xs")
    assert_selector("div.custom-class.another")
  end

  def test_with_title_argument
    render_inline(Flowbite::Card.new(title: {content: "Card Title"})) { "Card Content" }

    assert_selector("h5.mb-2.text-2xl.font-semibold.tracking-tight.text-heading", text: "Card Title")
  end

  def test_passes_title_options_to_the_title
    render_inline(Flowbite::Card.new(title: {content: "Card Title", options: {class: "custom-title-class"}})) { "Card Content" }

    assert_selector("h5.custom-title-class", text: "Card Title")
  end

  def test_with_title_slot_when_using_with_title
    render_inline(Flowbite::Card.new) do |component|
      component.with_title { "<h1>This is the full title</h1>".html_safe }
    end

    assert_no_selector("h5.mb-2.text-2xl.font-semibold.tracking-tight.text-heading")
    assert_selector("h1", text: "This is the full title")
  end
end
