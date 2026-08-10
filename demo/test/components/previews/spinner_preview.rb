# frozen_string_literal: true

class SpinnerPreview < Lookbook::Preview
  def example
    render(Flowbite::Spinner.new)
  end

  # @!group Styles
  #
  # Use these spinner styles to match the surrounding context.
  #
  # @display classes flex items-center space-x-4

  def brand
    render(Flowbite::Spinner.new(style: :brand))
  end

  def success
    render(Flowbite::Spinner.new(style: :success))
  end

  def danger
    render(Flowbite::Spinner.new(style: :danger))
  end

  def warning
    render(Flowbite::Spinner.new(style: :warning))
  end

  # @!endgroup

  # @!group Sizes
  #
  # Control the size of the spinner.
  #
  # @display classes flex items-center space-x-4

  def xs
    render(Flowbite::Spinner.new(size: :xs))
  end

  def sm
    render(Flowbite::Spinner.new(size: :sm))
  end

  def default
    render(Flowbite::Spinner.new(size: :default))
  end

  def lg
    render(Flowbite::Spinner.new(size: :lg))
  end

  def xl
    render(Flowbite::Spinner.new(size: :xl))
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the spinner icon.
  #
  # @display classes flex items-center space-x-4

  def with_custom_classes
    render(Flowbite::Spinner.new(class: ["opacity-75"]))
  end

  # @!endgroup
end
