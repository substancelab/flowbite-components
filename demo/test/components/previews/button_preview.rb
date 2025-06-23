# frozen_string_literal: true

class ButtonPreview < Lookbook::Preview
  # @!group Styles

  # Use these default button styles with multiple colors to indicate an action
  # or link within your website.

  def default
    render(Flowbite::Button.new(label: "Click me"))
  end

  def alternative
    render(Flowbite::Button.new(label: "Click me", style: :alternative))
  end

  # @!endgroup
end
