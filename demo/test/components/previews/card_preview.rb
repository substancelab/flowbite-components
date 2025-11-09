# frozen_string_literal: true

class CardPreview < Lookbook::Preview
  # @!group Default card

  # Use the following simple card component with a title and description.
  def default
    render(Flowbite::Card.new) { "Use the following simple card component with a title and description." }
  end

  def with_title_argument
    render(Flowbite::Card.new(title: "Card Title")) do
      "This card includes a title with the default styling."
    end
  end

  def with_title_slot
    render(Flowbite::Card.new) do |component|
      component.with_title { "<h1 class=\"text-3xl\">This title replace the entire title element</h1>".html_safe }
      "Use the title slot to control all aspects of the title element"
    end
  end

  # @!endgroup
end
