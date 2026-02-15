# frozen_string_literal: true

class BadgePreview < Lookbook::Preview
  def example
    render(Flowbite::Badge.new) { "Default" }
  end

  # @!group Styles
  #
  # Use these badge styles with multiple colors to indicate status or categories.
  #
  # @display classes flex flex-wrap gap-2

  def alternative
    render(Flowbite::Badge.new(style: :alternative)) { "Alternative" }
  end

  def brand
    render(Flowbite::Badge.new(style: :brand)) { "Brand" }
  end

  def danger
    render(Flowbite::Badge.new(style: :danger)) { "Danger" }
  end

  def gray
    render(Flowbite::Badge.new(style: :gray)) { "Gray" }
  end

  def success
    render(Flowbite::Badge.new(style: :success)) { "Success" }
  end

  def warning
    render(Flowbite::Badge.new(style: :warning)) { "Warning" }
  end

  # @!endgroup

  # @!group Bordered
  #
  # Add a border accent in a matching color scheme.
  #
  # @display classes flex flex-wrap gap-2

  def bordered_alternative
    render(Flowbite::Badge.new(bordered: true, style: :alternative)) { "Alternative" }
  end

  def bordered_brand
    render(Flowbite::Badge.new(bordered: true, style: :brand)) { "Brand" }
  end

  def bordered_danger
    render(Flowbite::Badge.new(bordered: true, style: :danger)) { "Danger" }
  end

  def bordered_gray
    render(Flowbite::Badge.new(bordered: true, style: :gray)) { "Gray" }
  end

  def bordered_success
    render(Flowbite::Badge.new(bordered: true, style: :success)) { "Success" }
  end

  def bordered_warning
    render(Flowbite::Badge.new(bordered: true, style: :warning)) { "Warning" }
  end

  # @!endgroup

  # @!group Large
  #
  # Increase the paddings to create a larger badge variant.
  #
  # @display classes flex flex-wrap gap-2

  def large_brand
    render(Flowbite::Badge.new(size: :lg, style: :brand)) { "Brand" }
  end

  def large_bordered
    render(Flowbite::Badge.new(bordered: true, size: :lg, style: :brand)) { "Brand" }
  end

  # @!endgroup

  # @!group Pill
  #
  # Make the corners even more rounded like pills.
  #
  # @display classes flex flex-wrap gap-2

  def pill_alternative
    render(Flowbite::Badge::Pill.new(style: :alternative)) { "Alternative" }
  end

  def pill_brand
    render(Flowbite::Badge::Pill.new(style: :brand)) { "Brand" }
  end

  def pill_danger
    render(Flowbite::Badge::Pill.new(style: :danger)) { "Danger" }
  end

  def pill_gray
    render(Flowbite::Badge::Pill.new(style: :gray)) { "Gray" }
  end

  def pill_success
    render(Flowbite::Badge::Pill.new(style: :success)) { "Success" }
  end

  def pill_warning
    render(Flowbite::Badge::Pill.new(style: :warning)) { "Warning" }
  end

  # @!endgroup

  # @!group Link
  #
  # Use badges as anchor elements to link to another page.
  #
  # @display classes flex flex-wrap gap-2

  def link_badge
    render(Flowbite::Badge.new(bordered: true, href: "#", style: :brand)) { "Brand" }
  end

  def link_pill
    render(Flowbite::Badge::Pill.new(bordered: true, href: "#", style: :brand)) { "Brand" }
  end

  # @!endgroup

  # @!group Dot
  #
  # Add a colored dot indicator before the badge text.
  #
  # @display classes flex flex-wrap gap-2

  def dot_alternative
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :alternative)) { "Alternative" }
  end

  def dot_brand
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :brand)) { "Brand" }
  end

  def dot_danger
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :danger)) { "Danger" }
  end

  def dot_gray
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :gray)) { "Gray" }
  end

  def dot_success
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :success)) { "Success" }
  end

  def dot_warning
    render(Flowbite::Badge.new(bordered: true, dot: true, style: :warning)) { "Warning" }
  end

  # @!endgroup
end
