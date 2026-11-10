# frozen_string_literal: true

class DrawerPreview < Lookbook::Preview
  BODY = "Supercharge your hiring by taking advantage of our limited-time " \
    "sale for Flowbite Docs + Job Board. Unlimited access to over 190K " \
    "top-ranked candidates and the #1 design job board."

  # The block given to the drawer is used as its body.
  #
  # Drawers are rendered off screen. They are shown here by adding the
  # `translate-x-0!` class.
  def example
    render(Flowbite::Drawer.new(class: "translate-x-0!", id: "example-drawer", title: "Drawer heading")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  def without_icon
    render(Flowbite::Drawer.new(class: "translate-x-0!", icon: false, id: "no-icon-drawer", title: "Drawer heading")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  # @!group Placement
  #
  # Use the `placement` argument to choose the edge of the screen the drawer
  # slides in from.

  def left
    render(Flowbite::Drawer.new(class: "translate-x-0!", id: "left-drawer", placement: :left, title: "Left drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  def right
    render(Flowbite::Drawer.new(class: "translate-x-0!", id: "right-drawer", placement: :right, title: "Right drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  def top
    render(Flowbite::Drawer.new(class: "translate-y-0!", id: "top-drawer", placement: :top, title: "Top drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body max-w-xl")
    end
  end

  def bottom
    render(Flowbite::Drawer.new(class: "translate-y-0!", id: "bottom-drawer", placement: :bottom, title: "Bottom drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body max-w-xl")
    end
  end

  # @!endgroup
end
