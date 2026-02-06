# frozen_string_literal: true

class ToastPreview < Lookbook::Preview
  def example
    render(Flowbite::Toast.new(message: "Something has happened!"))
  end

  # @!group Styles
  #
  # Use these toast notification styles to show feedback messages to your users.
  # Toast notifications appear with different colors and icons based on the style.
  #
  # @display classes flex flex-col space-y-4

  def default
    render(Flowbite::Toast.new(message: "Improvement archived successfully."))
  end

  def success
    render(Flowbite::Toast.new(message: "Item moved successfully.", style: :success))
  end

  def danger
    render(Flowbite::Toast.new(message: "Item has been deleted.", style: :danger))
  end

  def warning
    render(Flowbite::Toast.new(message: "Improve password difficulty.", style: :warning))
  end

  # @!endgroup

  # @!group Dismissible
  #
  # Control whether the toast can be dismissed with a close button.
  #
  # @display classes flex flex-col space-y-4

  def with_dismiss_button
    render(Flowbite::Toast.new(message: "This toast can be dismissed.", dismissible: true))
  end

  def without_dismiss_button
    render(Flowbite::Toast.new(message: "This toast cannot be dismissed.", dismissible: false))
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the toast container.
  #
  # @display classes flex flex-col space-y-4

  def with_custom_classes
    render(Flowbite::Toast.new(message: "Custom styled toast.", class: ["bg-blue-50", "border-blue-200"]))
  end

  # @!endgroup
end
