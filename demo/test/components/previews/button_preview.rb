# frozen_string_literal: true

class ButtonPreview < Lookbook::Preview
  # @!group Default
  #
  # Use these default button styles with multiple colors to indicate an action
  # or link within your website.
  #
  # @display classes flex flex-wrap space-x-2

  def default
    render(Flowbite::Button.new) { "Default" }
  end

  def secondary
    render(Flowbite::Button.new(style: :secondary)) { "Secondary" }
  end

  def tertiary
    render(Flowbite::Button.new(style: :tertiary)) { "Tertiary" }
  end

  def success
    render(Flowbite::Button.new(style: :success)) { "Success" }
  end

  def danger
    render(Flowbite::Button.new(style: :danger)) { "Danger" }
  end

  def warning
    render(Flowbite::Button.new(style: :warning)) { "Warning" }
  end

  def dark
    render(Flowbite::Button.new(style: :dark)) { "Dark" }
  end

  def ghost
    render(Flowbite::Button.new(style: :ghost)) { "Ghost" }
  end

  # @!endgroup

  # @!group Sizes
  #
  # Use these examples if you want to use smaller or larger buttons.
  #
  # @display classes flex flex-wrap space-x-2

  def xs_button
    render(Flowbite::Button.new(size: :xs)) { "Extra small" }
  end

  def sm_button
    render(Flowbite::Button.new(size: :sm)) { "Small" }
  end

  def default_button
    render(Flowbite::Button.new(size: :default)) { "Default" }
  end

  def lg_button
    render(Flowbite::Button.new(size: :lg)) { "Large" }
  end

  def xl_button
    render(Flowbite::Button.new(size: :xl)) { "Extra large" }
  end

  # @!endgroup

  # @!group Pills
  #
  # The button pills can be used as an alternative style by using fully rounded edges.
  # Styled with Flowbite 4.0 semantic design tokens.
  #
  # @display classes flex flex-wrap space-x-2
  def pill_default
    render(Flowbite::Button::Pill.new(style: :default)) { "Default" }
  end

  def pill_secondary
    render(Flowbite::Button::Pill.new(style: :secondary)) { "Secondary" }
  end

  def pill_tertiary
    render(Flowbite::Button::Pill.new(style: :tertiary)) { "Tertiary" }
  end

  def pill_success
    render(Flowbite::Button::Pill.new(style: :success)) { "Success" }
  end

  def pill_danger
    render(Flowbite::Button::Pill.new(style: :danger)) { "Danger" }
  end

  def pill_warning
    render(Flowbite::Button::Pill.new(style: :warning)) { "Warning" }
  end

  def pill_dark
    render(Flowbite::Button::Pill.new(style: :dark)) { "Dark" }
  end

  def pill_ghost
    render(Flowbite::Button::Pill.new(style: :ghost)) { "Ghost" }
  end

  # @!endgroup

  # @!group Outline
  #
  # Use the outline button styles to create bordered buttons with transparent backgrounds.
  # Styled with Flowbite 4.0 semantic design tokens.
  #
  # @display classes flex flex-wrap space-x-2
  def outline_default
    render(Flowbite::Button::Outline.new(style: :default)) { "Default" }
  end

  def outline_secondary
    render(Flowbite::Button::Outline.new(style: :secondary)) { "Secondary" }
  end

  def outline_tertiary
    render(Flowbite::Button::Outline.new(style: :tertiary)) { "Tertiary" }
  end

  def outline_success
    render(Flowbite::Button::Outline.new(style: :success)) { "Success" }
  end

  def outline_danger
    render(Flowbite::Button::Outline.new(style: :danger)) { "Danger" }
  end

  def outline_warning
    render(Flowbite::Button::Outline.new(style: :warning)) { "Warning" }
  end

  def outline_dark
    render(Flowbite::Button::Outline.new(style: :dark)) { "Dark" }
  end

  # @!endgroup
end
