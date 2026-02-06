# frozen_string_literal: true

class LinkPreview < Lookbook::Preview
  # Use this example to set default styles to an inline link element.
  def example
    render(Flowbite::Link.new(href: "https://www.uchiadmin.com")) { "Use this example to set default styles to an inline link element." }
  end
end
