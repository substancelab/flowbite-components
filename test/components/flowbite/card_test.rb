require "test_helper"

class Flowbite::CardTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_a_default_card
    render_inline(Flowbite::Card.new) { "Card Content" }

    assert_selector("div.p-6.bg-white.border.border-gray-200.rounded-lg.shadow-sm")
  end
end
