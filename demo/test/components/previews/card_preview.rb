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

  # @!endgroup
end
