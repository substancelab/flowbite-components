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

  def alternative
    render(Flowbite::Button.new(style: :alternative)) { "Alternative" }
  end

  def dark
    render(Flowbite::Button.new(style: :dark)) { "Dark" }
  end

  def light
    render(Flowbite::Button.new(style: :light)) { "Light" }
  end

  def green
    render(Flowbite::Button.new(style: :green)) { "Green" }
  end

  def red
    render(Flowbite::Button.new(style: :red)) { "Red" }
  end

  def yellow
    render(Flowbite::Button.new(style: :yellow)) { "Yellow" }
  end

  def purple
    render(Flowbite::Button.new(style: :purple)) { "Purple" }
  end

  # @!endgroup

  # @!group Sizes
  #
  # Use these examples if you want to use smaller or larger buttons.
  #
  # @display classes flex flex-wrap

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
  #
  # @display classes flex flex-wrap space-x-2
  def pill_default
    render(Flowbite::Button::Pill.new(style: :default)) { "Default" }
  end

  def pill_alternative
    render(Flowbite::Button::Pill.new(style: :alternative)) { "Alternative" }
  end

  def pill_dark
    render(Flowbite::Button::Pill.new(style: :dark)) { "Dark" }
  end

  def pill_light
    render(Flowbite::Button::Pill.new(style: :light)) { "Light" }
  end

  def pill_green
    render(Flowbite::Button::Pill.new(style: :green)) { "Green" }
  end

  def pill_purple
    render(Flowbite::Button::Pill.new(style: :purple)) { "Purple" }
  end

  def pill_red
    render(Flowbite::Button::Pill.new(style: :red)) { "Red" }
  end

  def pill_yellow
    render(Flowbite::Button::Pill.new(style: :yellow)) { "Yellow" }
  end

  # @!endgroup
end
