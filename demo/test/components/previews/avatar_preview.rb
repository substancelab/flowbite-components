# frozen_string_literal: true

class AvatarPreview < Lookbook::Preview
  IMAGE_URL = "https://flowbite.com/docs/images/people/profile-picture-5.jpg"

  def example
    render(Flowbite::Avatar.new(alt: "Rounded avatar", src: IMAGE_URL))
  end

  # @!group Default avatar
  #
  # Use this example to create a circle and rounded avatar on an image
  # element.
  #
  # @display classes flex flex-wrap items-center gap-4

  def circle
    render(Flowbite::Avatar.new(alt: "Rounded avatar", src: IMAGE_URL))
  end

  def rounded
    render(Flowbite::Avatar.new(alt: "Default avatar", shape: :rounded, src: IMAGE_URL))
  end

  # @!endgroup

  # @!group Bordered
  #
  # Apply a border around the avatar component.
  #
  # @display classes flex flex-wrap items-center gap-4

  def bordered
    render(Flowbite::Avatar.new(alt: "Bordered avatar", bordered: true, src: IMAGE_URL))
  end

  def bordered_rounded
    render(Flowbite::Avatar.new(alt: "Bordered avatar", bordered: true, shape: :rounded, src: IMAGE_URL))
  end

  # @!endgroup

  # @!group Placeholder icon
  #
  # When there is no image or initials, a placeholder person icon is shown.
  #
  # @display classes flex flex-wrap items-center gap-4

  def placeholder_icon
    render(Flowbite::Avatar.new)
  end

  def placeholder_icon_rounded
    render(Flowbite::Avatar.new(shape: :rounded))
  end

  # @!endgroup

  # @!group Placeholder initials
  #
  # When there is no image, the initials of the user are shown instead.
  #
  # @display classes flex flex-wrap items-center gap-4

  def placeholder_initials
    render(Flowbite::Avatar.new(initials: "JL"))
  end

  def placeholder_initials_rounded
    render(Flowbite::Avatar.new(initials: "JL", shape: :rounded))
  end

  # @!endgroup

  # @!group Dot indicator
  #
  # Show a colored dot to indicate the status of the user using the
  # `top_dot` or `bottom_dot` slots. Pass a `label` to describe the status
  # for screen readers.
  #
  # @display classes flex flex-wrap items-center gap-4

  def dot_top_success
    render(Flowbite::Avatar.new(src: IMAGE_URL)) do |avatar|
      avatar.with_top_dot(label: "Online", style: :success)
    end
  end

  def dot_top_danger
    render(Flowbite::Avatar.new(shape: :rounded, src: IMAGE_URL)) do |avatar|
      avatar.with_top_dot(label: "Busy", style: :danger)
    end
  end

  def dot_bottom_success
    render(Flowbite::Avatar.new(src: IMAGE_URL)) do |avatar|
      avatar.with_bottom_dot(label: "Online", style: :success)
    end
  end

  def dot_bottom_danger
    render(Flowbite::Avatar.new(shape: :rounded, src: IMAGE_URL)) do |avatar|
      avatar.with_bottom_dot(label: "Busy", style: :danger)
    end
  end

  # @!endgroup

  # @!group Sizes
  #
  # Select a size for the avatar.
  #
  # @display classes flex flex-wrap items-center gap-4

  def xs
    render(Flowbite::Avatar.new(alt: "Extra small avatar", shape: :rounded, size: :xs, src: IMAGE_URL))
  end

  def sm
    render(Flowbite::Avatar.new(alt: "Small avatar", shape: :rounded, size: :sm, src: IMAGE_URL))
  end

  def base
    render(Flowbite::Avatar.new(alt: "Base avatar", shape: :rounded, size: :base, src: IMAGE_URL))
  end

  def default
    render(Flowbite::Avatar.new(alt: "Default avatar", shape: :rounded, size: :default, src: IMAGE_URL))
  end

  def lg
    render(Flowbite::Avatar.new(alt: "Large avatar", shape: :rounded, size: :lg, src: IMAGE_URL))
  end

  def xl
    render(Flowbite::Avatar.new(alt: "xl avatar", shape: :rounded, size: :xl, src: IMAGE_URL))
  end

  def xxl
    render(Flowbite::Avatar.new(alt: "2xl avatar", shape: :rounded, size: :"2xl", src: IMAGE_URL))
  end

  # @!endgroup
end
