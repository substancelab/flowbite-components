# frozen_string_literal: true

class AlertPreview < Lookbook::Preview
  include RenderToString

  def example
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", title: "Info alert!"))
  end

  # @!group Styles
  #
  # Use these alert styles to show feedback messages to your users.
  #
  # @display classes flex flex-col space-y-4

  def danger
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", style: :danger, title: "Danger alert!"))
  end

  def dark
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", style: :dark, title: "Dark alert!"))
  end

  def info
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", style: :info, title: "Info alert!"))
  end

  def success
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", style: :success, title: "Success alert!"))
  end

  def warning
    render(Flowbite::Alert.new(message: "Change a few things up and try submitting again.", style: :warning, title: "Warning alert!"))
  end

  # @!endgroup

  # @!group Without icon
  #
  # Hide the info icon shown at the start of the alert.
  #
  # @display classes flex flex-col space-y-4

  def without_icon
    render(Flowbite::Alert.new(icon: false, message: "Change a few things up and try submitting again.", title: "Info alert!"))
  end

  def without_icon_danger
    render(Flowbite::Alert.new(icon: false, message: "Change a few things up and try submitting again.", style: :danger, title: "Danger alert!"))
  end

  # @!endgroup

  # @!group Bordered
  #
  # Add a border in the color of the alert style.
  #
  # @display classes flex flex-col space-y-4

  def bordered_danger
    render(Flowbite::Alert.new(bordered: true, message: "Change a few things up and try submitting again.", style: :danger, title: "Danger alert!"))
  end

  def bordered_dark
    render(Flowbite::Alert.new(bordered: true, message: "Change a few things up and try submitting again.", style: :dark, title: "Dark alert!"))
  end

  def bordered_info
    render(Flowbite::Alert.new(bordered: true, message: "Change a few things up and try submitting again.", title: "Info alert!"))
  end

  def bordered_success
    render(Flowbite::Alert.new(bordered: true, message: "Change a few things up and try submitting again.", style: :success, title: "Success alert!"))
  end

  def bordered_warning
    render(Flowbite::Alert.new(bordered: true, message: "Change a few things up and try submitting again.", style: :warning, title: "Warning alert!"))
  end

  # @!endgroup

  # @!group Border accent
  #
  # Show a thick border at the top of the alert instead of rounded corners.
  #
  # @display classes flex flex-col space-y-4

  def border_accent_danger
    render(Flowbite::Alert.new(border_accent: true, message: "A simple danger alert. Give it a click if you like.", style: :danger))
  end

  def border_accent_info
    render(Flowbite::Alert.new(border_accent: true, message: "A simple info alert. Give it a click if you like."))
  end

  def border_accent_success
    render(Flowbite::Alert.new(border_accent: true, message: "A simple success alert. Give it a click if you like.", style: :success))
  end

  # @!endgroup

  # @!group With list
  #
  # Pass a block to render richer content, such as a list, below the title.
  #
  # @display classes flex flex-col space-y-4

  def with_list
    render(Flowbite::Alert.new(bordered: true, title: "Ensure that these requirements are met:")) do
      requirements_list
    end
  end

  def with_list_danger
    render(Flowbite::Alert.new(bordered: true, style: :danger, title: "Ensure that these requirements are met:")) do
      requirements_list
    end
  end

  # @!endgroup

  # @!group Additional content
  #
  # Use the additional_content slot to add extra content, such as buttons,
  # below the title and message.
  #
  # @display classes flex flex-col space-y-4

  def with_additional_content
    render(Flowbite::Alert.new(bordered: true, message: "More info about this info alert goes here. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.", title: "This is an info alert")) do |alert|
      alert.with_additional_content do
        render_to_string(Flowbite::Button.new(size: :xs).with_content("View more"))
      end
    end
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the alert container.
  #
  # @display classes flex flex-col space-y-4

  def with_custom_classes
    render(Flowbite::Alert.new(class: ["mb-4", "shadow-md"], message: "Custom styled alert."))
  end

  # @!endgroup

  private

  def requirements_list
    <<~HTML.html_safe
      <ul class="mt-2 list-disc list-outside space-y-1 ps-2.5">
        <li>At least 10 characters (and up to 100 characters)</li>
        <li>At least one lowercase character</li>
        <li>Inclusion of at least one special character, e.g., ! @ # ?</li>
      </ul>
    HTML
  end
end
