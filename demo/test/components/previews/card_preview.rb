# frozen_string_literal: true

class CardPreview < Lookbook::Preview
  # Use the following simple card component with a title and description.
  def default
    render(Flowbite::Card.new) { "Use the following simple card component with a title and description." }
  end
end
