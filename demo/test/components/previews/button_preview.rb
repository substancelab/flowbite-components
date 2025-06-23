# frozen_string_literal: true

class ButtonPreview < Lookbook::Preview
  def default
    render(Flowbite::Button.new(label: "Click me"))
  end
end
