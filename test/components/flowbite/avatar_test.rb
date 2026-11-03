require "test_helper"

class Flowbite::AvatarTest < Minitest::Test
  include ViewComponent::TestHelpers

  IMAGE_URL = "https://flowbite.com/docs/images/people/profile-picture-5.jpg"

  def test_render_component
    render_inline(Flowbite::Avatar.new(alt: "Jese Leos", src: IMAGE_URL))

    assert_component_rendered
    assert_selector("img[alt='Jese Leos'][src='#{IMAGE_URL}']")
  end

  def test_renders_image_with_default_classes
    render_inline(Flowbite::Avatar.new(src: IMAGE_URL))

    assert_selector("img.w-10.h-10.rounded-full")
  end

  # Fallbacks

  def test_renders_initials_without_src
    render_inline(Flowbite::Avatar.new(initials: "JL"))

    assert_no_selector("img")
    assert_selector("div.relative.inline-flex.items-center.justify-center.w-10.h-10.overflow-hidden.bg-neutral-tertiary.rounded-full span.font-medium.text-body", text: "JL")
  end

  def test_renders_initials_with_blank_src
    render_inline(Flowbite::Avatar.new(initials: "JL", src: ""))

    assert_no_selector("img")
    assert_selector("span", text: "JL")
  end

  def test_prefers_image_over_initials
    render_inline(Flowbite::Avatar.new(initials: "JL", src: IMAGE_URL))

    assert_selector("img")
    assert_no_text("JL")
  end

  def test_renders_placeholder_icon_without_src_or_initials
    render_inline(Flowbite::Avatar.new)

    assert_no_selector("img")
    assert_selector("div.relative.w-10.h-10.overflow-hidden.bg-neutral-secondary-medium.rounded-full svg.absolute.w-12.h-12.text-body-subtle.-left-1[aria-hidden='true']")
  end

  def test_renders_placeholder_icon_with_blank_initials
    render_inline(Flowbite::Avatar.new(initials: ""))

    assert_selector("div.bg-neutral-secondary-medium svg")
  end

  # Shapes

  def test_renders_rounded_shape
    render_inline(Flowbite::Avatar.new(shape: :rounded, src: IMAGE_URL))

    assert_selector("img.rounded-base")
    assert_no_selector("img.rounded-full")
  end

  def test_renders_small_rounded_shape_with_small_corners
    render_inline(Flowbite::Avatar.new(shape: :rounded, size: :xs, src: IMAGE_URL))

    assert_selector("img.rounded-sm")
  end

  def test_raises_on_unknown_shape
    assert_raises(ArgumentError) do
      render_inline(Flowbite::Avatar.new(shape: :hexagon, src: IMAGE_URL))
    end
  end

  def test_renders_rounded_initials
    render_inline(Flowbite::Avatar.new(initials: "JL", shape: :rounded))

    assert_selector("div.bg-neutral-tertiary.rounded-base")
  end

  # Sizes

  def test_renders_xs_size
    render_inline(Flowbite::Avatar.new(size: :xs, src: IMAGE_URL))

    assert_selector("img.w-4\\.5.h-4\\.5")
  end

  def test_renders_sm_size
    render_inline(Flowbite::Avatar.new(size: :sm, src: IMAGE_URL))

    assert_selector("img.w-6.h-6")
  end

  def test_renders_base_size
    render_inline(Flowbite::Avatar.new(size: :base, src: IMAGE_URL))

    assert_selector("img.w-8.h-8")
  end

  def test_renders_lg_size
    render_inline(Flowbite::Avatar.new(size: :lg, src: IMAGE_URL))

    assert_selector("img.w-11.h-11")
  end

  def test_renders_xl_size
    render_inline(Flowbite::Avatar.new(size: :xl, src: IMAGE_URL))

    assert_selector("img.w-14.h-14")
  end

  def test_renders_2xl_size
    render_inline(Flowbite::Avatar.new(size: :"2xl", src: IMAGE_URL))

    assert_selector("img.w-16.h-16")
  end

  def test_sizes_placeholder_icon
    render_inline(Flowbite::Avatar.new(size: :"2xl"))

    assert_selector("div.w-16.h-16 svg.w-19.h-19")
  end

  # Bordered

  def test_renders_bordered
    render_inline(Flowbite::Avatar.new(bordered: true, src: IMAGE_URL))

    assert_selector("img.p-1.ring-2.ring-default.rounded-full")
  end

  def test_does_not_render_border_by_default
    render_inline(Flowbite::Avatar.new(src: IMAGE_URL))

    assert_no_selector("img.ring-2")
  end

  # Dot

  def test_does_not_render_dot_by_default
    render_inline(Flowbite::Avatar.new(src: IMAGE_URL))

    assert_no_selector("div.relative")
    assert_no_selector("span")
  end

  def test_renders_dot_at_the_top
    render_inline(Flowbite::Avatar.new(dot: :success, src: IMAGE_URL))

    assert_selector("div.relative > img.w-10.h-10")
    assert_selector("div.relative > span.top-0.left-7.absolute.w-3\\.5.h-3\\.5.bg-success.border-2.border-buffer.rounded-full")
  end

  def test_renders_dot_at_the_bottom
    render_inline(Flowbite::Avatar.new(dot: :success, dot_position: :bottom, src: IMAGE_URL))

    assert_selector("div.relative > span.bottom-0.left-7")
  end

  def test_renders_danger_dot
    render_inline(Flowbite::Avatar.new(dot: :danger, src: IMAGE_URL))

    assert_selector("div.relative > span.bg-danger")
  end

  def test_positions_dot_according_to_size
    render_inline(Flowbite::Avatar.new(dot: :success, size: :"2xl", src: IMAGE_URL))

    assert_selector("div.relative > span.left-13")
  end

  def test_renders_dot_on_placeholder
    render_inline(Flowbite::Avatar.new(dot: :success, initials: "JL"))

    assert_selector("div.relative > div.bg-neutral-tertiary", text: "JL")
    assert_selector("div.relative > span.bg-success")
  end

  def test_raises_on_unknown_dot_style
    assert_raises(Flowbite::Styles::StyleNotFoundError) do
      render_inline(Flowbite::Avatar.new(dot: :warning, src: IMAGE_URL))
    end
  end

  # Custom classes

  def test_adds_classes_to_the_default_ones
    render_inline(Flowbite::Avatar.new(class: "custom-class", src: IMAGE_URL))

    assert_selector("img.w-10.h-10.rounded-full.custom-class")
  end

  def test_adds_classes_to_the_initials_container
    render_inline(Flowbite::Avatar.new(class: ["custom-class"], initials: "JL"))

    assert_selector("div.bg-neutral-tertiary.custom-class")
  end

  def test_adds_classes_to_the_placeholder_container
    render_inline(Flowbite::Avatar.new(class: ["custom-class"]))

    assert_selector("div.bg-neutral-secondary-medium.custom-class")
  end

  # Custom options

  def test_passes_additional_options_as_attributes
    render_inline(Flowbite::Avatar.new(data: {controller: "avatar"}, id: "my-avatar", src: IMAGE_URL))

    assert_selector("img[id='my-avatar'][data-controller='avatar']")
  end

  def test_passes_additional_options_to_placeholder
    render_inline(Flowbite::Avatar.new(id: "my-avatar"))

    assert_selector("div#my-avatar.bg-neutral-secondary-medium")
  end
end

class Flowbite::Avatar::DotTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_default_dot
    render_inline(Flowbite::Avatar::Dot.new)

    assert_selector("span.top-0.left-7.absolute.w-3\\.5.h-3\\.5.bg-success.border-2.border-buffer.rounded-full")
  end

  def test_renders_bottom_danger_dot
    render_inline(Flowbite::Avatar::Dot.new(position: :bottom, style: :danger))

    assert_selector("span.bottom-0.bg-danger")
  end
end

class Flowbite::Avatar::PlaceholderIconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_renders_default_icon
    render_inline(Flowbite::Avatar::PlaceholderIcon.new)

    assert_selector("svg.absolute.w-12.h-12.text-body-subtle.-left-1[aria-hidden='true'][fill='currentColor'] path[fill-rule='evenodd']")
  end

  def test_renders_sm_icon
    render_inline(Flowbite::Avatar::PlaceholderIcon.new(size: :sm))

    assert_selector("svg.w-7.h-7.-left-0\\.5")
  end
end
