# frozen_string_literal: true

class ModalPreview < Lookbook::Preview
  include RenderToString

  BODY = "With less than a month to go before the European Union enacts new " \
    "consumer privacy laws for its citizens, companies around the world are " \
    "updating their terms of service agreements to comply."

  # The block given to the modal is used as its body.
  #
  # Modals are rendered hidden. They are shown here by adding the `flex!`
  # class.
  def example
    render(Flowbite::Modal.new(class: "flex!", id: "example-modal", title: "Terms of Service")) { BODY }
  end

  # Use the footer slot to add action buttons.
  def with_footer
    render(Flowbite::Modal.new(class: "flex!", id: "footer-modal", title: "Terms of Service")) do |modal|
      modal.with_footer do
        render_to_string(Flowbite::Button.new.with_content("I accept")) +
          render_to_string(Flowbite::Button.new(style: :secondary).with_content("Decline"))
      end
      BODY
    end
  end

  # @!group Sizes
  #
  # Use the `size` argument to change the maximum width of the modal.

  def small
    render(Flowbite::Modal.new(class: "flex!", id: "small-modal", size: :sm, title: "Small modal")) { BODY }
  end

  def default
    render(Flowbite::Modal.new(class: "flex!", id: "default-modal", title: "Default modal")) { BODY }
  end

  def large
    render(Flowbite::Modal.new(class: "flex!", id: "large-modal", size: :lg, title: "Large modal")) { BODY }
  end

  def extra_large
    render(Flowbite::Modal.new(class: "flex!", id: "extra-large-modal", size: :xl, title: "Extra large modal")) { BODY }
  end

  # @!endgroup
end
