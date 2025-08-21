# frozen_string_literal: true

class ButtonPreview < Lookbook::Preview
  # @!group Default
  #
  # Use these default button styles with multiple colors to indicate an action
  # or link within your website.
  #
  # @display classes flex flex-wrap

  def default
    render(Flowbite::Button.new(label: "Default"))
  end

  def alternative
    render(Flowbite::Button.new(label: "Alternative", style: :alternative))
  end

  def dark
    render(Flowbite::Button.new(label: "Dark", style: :dark))
  end

  def light
    render(Flowbite::Button.new(label: "Light", style: :light))
  end

  def green
    render(Flowbite::Button.new(label: "Green", style: :green))
  end

  def red
    render(Flowbite::Button.new(label: "Red", style: :red))
  end

  def yellow
    render(Flowbite::Button.new(label: "Yellow", style: :yellow))
  end

  def purple
    render(Flowbite::Button.new(label: "Purple", style: :purple))
  end

  # @!endgroup

  # @!group Pills
  #
  # The button pills can be used as an alternative style by using fully rounded edges.
  #
  # @display classes flex
  def pill_default
    render(Flowbite::Button::Pill.new(label: "Default", style: :default))
  end

  def pill_alternative
    render(Flowbite::Button::Pill.new(label: "Alternative", style: :alternative))
  end

  def pill_dark
    render(Flowbite::Button::Pill.new(label: "Dark", style: :dark))
  end

  def pill_light
    render(Flowbite::Button::Pill.new(label: "Light", style: :light))
  end

  def pill_green
    render(Flowbite::Button::Pill.new(label: "Green", style: :green))
  end

  def pill_purple
    render(Flowbite::Button::Pill.new(label: "Purple", style: :purple))
  end

  def pill_red
    render(Flowbite::Button::Pill.new(label: "Red", style: :red))
  end

  def pill_yellow
    render(Flowbite::Button::Pill.new(label: "Yellow", style: :yellow))
  end

  # @!endgroup
end
