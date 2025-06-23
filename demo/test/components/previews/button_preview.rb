# frozen_string_literal: true

class ButtonPreview < Lookbook::Preview
  # @!group Default
  # Use these default button styles with multiple colors to indicate an action
  # or link within your website.

  def default
    render(Flowbite::Button.new(label: "Click me"))
  end

  def alternative
    render(Flowbite::Button.new(label: "Click me", style: :alternative))
  end

  # @!endgroup

  # @!group Pills
  # The button pills can be used as an alternative style by using fully rounded edges.

  # @label Default
  def pill_default
    render(Flowbite::Button::Pill.new(label: "Click me", style: :default))
  end

  # @label Alternative
  def pill_alternative
    render(Flowbite::Button::Pill.new(label: "Click me", style: :alternative))
  end

  # @label Dark
  def pill_dark
    render(Flowbite::Button::Pill.new(label: "Click me", style: :dark))
  end

  # @label Light
  def pill_light
    render(Flowbite::Button::Pill.new(label: "Click me", style: :light))
  end

  # @label Green
  def pill_green
    render(Flowbite::Button::Pill.new(label: "Click me", style: :green))
  end

  # @label Purple
  def pill_purple
    render(Flowbite::Button::Pill.new(label: "Click me", style: :purple))
  end

  # @label Red
  def pill_red
    render(Flowbite::Button::Pill.new(label: "Click me", style: :red))
  end

  # @label Yellow
  def pill_yellow
    render(Flowbite::Button::Pill.new(label: "Click me", style: :yellow))
  end

  # @!endgroup
end
