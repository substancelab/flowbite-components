require "test_helper"

class Flowbite::CardTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_a_default_card
    render_inline(Flowbite::Card.new) { "Card Content" }

    assert_selector("div.p-6.bg-white.border.border-gray-200.rounded-lg.shadow-sm")
  end

  def test_passes_options_to_the_card_as_attributes
    render_inline(Flowbite::Card.new(options: {id: "card-1"})) { "Card Content" }

    assert_selector("div#card-1")
  end

  def test_adds_the_classes_to_the_default_classes
    render_inline(Flowbite::Card.new(class: "custom-class another")) { "Card Content" }

    assert_selector("div.p-6.bg-white.border.border-gray-200.rounded-lg.shadow-sm.custom-class.another")
  end

  def test_overrides_the_default_classes
    render_inline(Flowbite::Card.new(options: {class: "custom-class another"})) { "Card Content" }

    assert_no_selector("div.p-6.bg-white.border.border-gray-200.rounded-lg.shadow-sm")
    assert_selector("div.custom-class.another")
  end

  def test_with_title_argument
    render_inline(Flowbite::Card.new(title: "Card Title")) { "Card Content" }

    assert_selector("h5.mb-2.text-2xl.font-bold.tracking-tight.text-gray-900.dark\\:text-white", text: "Card Title")
  end
end
