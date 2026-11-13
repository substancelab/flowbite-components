# frozen_string_literal: true

# Drawers are attached to the edges of the screen, so they are previewed
# without padding.
#
# @display padding false
class DrawerPreview < Lookbook::Preview
  BODY = "Supercharge your hiring by taking advantage of our limited-time " \
    "sale for Flowbite Docs + Job Board. Unlimited access to over 190K " \
    "top-ranked candidates and the #1 design job board."

  # Shows and hides the drawer using `behavior: :stimulus`. The drawer is
  # rendered shown using `open: true`.
  #
  # @display classes w-full min-h-[480px] p-5
  def example
    render_with_template(template: "drawer_preview/example")
  end

  # The block given to the drawer is used as its body.
  #
  # Drawers are rendered fixed and off screen. They are shown here in the
  # page flow by adding classes from `preview_classes`.
  def body
    render(Flowbite::Drawer.new(class: preview_classes(:left), id: "body-drawer", title: "Drawer heading")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  def without_icon
    render(Flowbite::Drawer.new(class: preview_classes(:left), icon: false, id: "no-icon-drawer", title: "Drawer heading")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  # Use `placement: :left` to slide the drawer in from the left edge of the
  # screen. This is the default.
  def left
    render(Flowbite::Drawer.new(class: preview_classes(:left), id: "left-drawer", placement: :left, title: "Left drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  # Use `placement: :right` to slide the drawer in from the right edge of the
  # screen.
  #
  # @display classes w-full
  def right
    render(Flowbite::Drawer.new(class: preview_classes(:right), id: "right-drawer", placement: :right, title: "Right drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body")
    end
  end

  # Use `placement: :top` to slide the drawer in from the top edge of the
  # screen.
  def top
    render(Flowbite::Drawer.new(class: preview_classes(:top), id: "top-drawer", placement: :top, title: "Top drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body max-w-xl")
    end
  end

  # Use `placement: :bottom` to slide the drawer in from the bottom edge of
  # the screen.
  def bottom
    render(Flowbite::Drawer.new(class: preview_classes(:bottom), id: "bottom-drawer", placement: :bottom, title: "Bottom drawer")) do
      tag.p(BODY, class: "mb-6 text-sm text-body max-w-xl")
    end
  end

  private

  # The embedded previews are only as tall as their content, so the fixed,
  # off screen drawers are moved into the page flow and onto the screen.
  def preview_classes(placement)
    case placement
    when :left
      ["relative!", "translate-x-0!", "h-96!"]
    when :right
      ["relative!", "translate-x-0!", "h-96!", "ms-auto!"]
    else
      ["relative!", "translate-y-0!"]
    end
  end
end
