# frozen_string_literal: true

class RatingPreview < Lookbook::Preview
  # Use this simple example of a star rating component for showing review
  # results.
  def example
    render(Flowbite::Rating.new(value: 4))
  end

  # Use this example to show the rating score next to the stars.
  def rating_with_text
    render(Flowbite::Rating.new(text: "4.95 out of 5", value: 4.95))
  end

  # @!group Sizes
  #
  # Control the size of the stars.
  #
  # @display classes flex flex-col space-y-4

  def default
    render(Flowbite::Rating.new(size: :default, value: 4))
  end

  def md
    render(Flowbite::Rating.new(size: :md, value: 4))
  end

  def lg
    render(Flowbite::Rating.new(size: :lg, value: 4))
  end

  # @!endgroup

  # @!group Number of stars
  #
  # Change the total number of stars using the max argument.
  #
  # @display classes flex flex-col space-y-4

  def three_stars
    render(Flowbite::Rating.new(max: 3, value: 2))
  end

  def ten_stars
    render(Flowbite::Rating.new(max: 10, value: 7))
  end

  # @!endgroup
end
