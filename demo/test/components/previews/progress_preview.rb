# frozen_string_literal: true

class ProgressPreview < Lookbook::Preview
  # @display classes w-full
  def example
    render(Flowbite::Progress.new(progress: 64))
  end

  # @!group Sizes
  #
  # Use the size argument to control the height of the progress bar.
  #
  # @display classes flex flex-col space-y-4 w-full

  def sm
    render(Flowbite::Progress.new(progress: 45, size: :sm))
  end

  def default
    render(Flowbite::Progress.new(progress: 45, size: :default))
  end

  def lg
    render(Flowbite::Progress.new(progress: 45, size: :lg))
  end

  # @!endgroup

  # @!group Label position
  #
  # Show the progress percentage inside or outside the progress bar.
  #
  # @display classes flex flex-col space-y-4 w-full

  def label_inside
    render(Flowbite::Progress.new(label_position: :inside, progress: 45))
  end

  def label_outside
    render(Flowbite::Progress.new(label: "Flowbite", label_position: :outside, progress: 45))
  end

  # @!endgroup

  # @!group Styles
  #
  # Use these progress bar styles to match the surrounding context.
  #
  # @display classes flex flex-col space-y-4 w-full

  def brand
    render(Flowbite::Progress.new(progress: 45, style: :brand))
  end

  def dark
    render(Flowbite::Progress.new(progress: 45, style: :dark))
  end

  def success
    render(Flowbite::Progress.new(progress: 45, style: :success))
  end

  def danger
    render(Flowbite::Progress.new(progress: 45, style: :danger))
  end

  def warning
    render(Flowbite::Progress.new(progress: 45, style: :warning))
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the progress bar track.
  #
  # @display classes flex flex-col space-y-4 w-full

  def with_custom_classes
    render(Flowbite::Progress.new(class: ["max-w-xs"], progress: 45))
  end

  # @!endgroup
end
