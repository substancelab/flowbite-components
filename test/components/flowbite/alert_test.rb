require "test_helper"

class Flowbite::AlertTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Alert.new) { "Test message" }

    assert_component_rendered
    assert_selector("div[role='alert']", text: "Test message")
  end

  def test_renders_block_as_message
    render_inline(Flowbite::Alert.new) { "Hello, World!" }

    assert_selector("div[role='alert'] > div", text: "Hello, World!")
  end

  def test_renders_with_default_classes
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_selector("div[role='alert'].flex.items-start.p-4.text-sm.rounded-base")
  end

  def test_renders_without_flex_classes_when_icon_is_hidden
    render_inline(Flowbite::Alert.new(icon: false)) { "Test" }

    assert_selector("div[role='alert'].p-4.text-sm.rounded-base")
    assert_no_selector("div[role='alert'].flex")
  end

  def test_renders_with_additional_classes
    render_inline(Flowbite::Alert.new(class: ["custom-class", "another-class"])) { "Test" }

    assert_selector("div.custom-class.another-class")
  end

  def test_renders_title
    render_inline(Flowbite::Alert.new(title: "Heads up!")) { "Test" }

    assert_selector("span.font-medium", text: "Heads up!")
    assert_selector("div[role='alert']", text: /Heads up!\s+Test/)
  end

  def test_renders_title_without_icon
    render_inline(Flowbite::Alert.new(icon: false, title: "Heads up!")) { "Test" }

    assert_selector("div[role='alert'] > span.font-medium", text: "Heads up!")
    assert_selector("div[role='alert']", text: /Heads up!\s+Test/)
  end

  def test_renders_without_title_by_default
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_no_selector("span.font-medium")
  end

  def test_renders_icon_by_default
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_selector("svg.w-4.h-4.me-2.shrink-0.mt-0\\.5")
    assert_selector("span.sr-only", text: "Info")
  end

  def test_renders_without_icon
    render_inline(Flowbite::Alert.new(icon: false)) { "Test" }

    assert_no_selector("svg")
    assert_no_selector("span.sr-only")
  end

  def test_does_not_render_a_dismiss_button
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_no_selector("button")
  end

  def test_renders_with_custom_html_options
    render_inline(Flowbite::Alert.new(data: {controller: "alert"}, id: "my-alert")) { "Test" }

    assert_selector("div[id='my-alert'][data-controller='alert']")
  end

  def test_renders_info_style_by_default
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_selector("div.bg-brand-softer.text-fg-brand-strong")
  end

  def test_renders_danger_style
    render_inline(Flowbite::Alert.new(style: :danger)) { "Test" }

    assert_selector("div.bg-danger-soft.text-fg-danger-strong")
    assert_selector("span.sr-only", text: "Danger")
  end

  def test_renders_dark_style
    render_inline(Flowbite::Alert.new(style: :dark)) { "Test" }

    assert_selector("div.bg-neutral-secondary-medium.text-heading")
  end

  def test_renders_success_style
    render_inline(Flowbite::Alert.new(style: :success)) { "Test" }

    assert_selector("div.bg-success-soft.text-fg-success-strong")
  end

  def test_renders_warning_style
    render_inline(Flowbite::Alert.new(style: :warning)) { "Test" }

    assert_selector("div.bg-warning-soft.text-fg-warning")
  end

  def test_raises_on_unknown_style
    assert_raises(Flowbite::Styles::StyleNotFoundError) do
      render_inline(Flowbite::Alert.new(style: :unknown)) { "Test" }
    end
  end

  def test_renders_without_border_by_default
    render_inline(Flowbite::Alert.new) { "Test" }

    assert_no_selector("div.border")
    assert_no_selector("div.border-brand-subtle")
  end

  def test_renders_bordered
    render_inline(Flowbite::Alert.new(bordered: true)) { "Test" }

    assert_selector("div[role='alert'].border.border-brand-subtle.rounded-base")
  end

  def test_renders_bordered_with_style_border_color
    {
      danger: "border-danger-subtle",
      dark: "border-default-medium",
      info: "border-brand-subtle",
      success: "border-success-subtle",
      warning: "border-warning-subtle"
    }.each do |style, border_class|
      render_inline(Flowbite::Alert.new(bordered: true, style: style)) { "Test" }

      assert_selector("div[role='alert'].border.#{border_class}")
    end
  end

  def test_renders_border_accent
    render_inline(Flowbite::Alert.new(border_accent: true, style: :success)) { "Test" }

    assert_selector("div[role='alert'].border-t-4.border-success-subtle")
    assert_no_selector("div.rounded-base")
    assert_no_selector("div[role='alert'].border")
  end

  def test_renders_list_in_block
    render_inline(Flowbite::Alert.new(title: "Ensure that these requirements are met:")) do
      "<ul><li>At least 10 characters</li></ul>".html_safe
    end

    assert_selector("div[role='alert'].flex.items-start")
    assert_selector("svg.w-4.h-4.me-2.shrink-0.mt-0\\.5")
    assert_selector("div[role='alert'] > div > span.font-medium", text: "Ensure that these requirements are met:")
    assert_selector("div[role='alert'] > div > ul > li", text: "At least 10 characters")
  end

  def test_renders_additional_content
    render_inline(Flowbite::Alert.new(bordered: true, title: "This is an info alert")) do |alert|
      alert.with_additional_content { "<button type=\"button\">View more</button>".html_safe }
      "More info."
    end

    assert_selector("div[role='alert'].p-4.text-sm.rounded-base.border.border-brand-subtle")
    assert_no_selector("div[role='alert'].flex")
    assert_selector("div[role='alert'] > div.flex.items-center > svg.w-4.h-4.shrink-0.me-2")
    assert_selector("div[role='alert'] > div.flex.items-center > h3.font-medium", text: "This is an info alert")
    assert_selector("div[role='alert'] > div.mt-2.mb-4", text: "More info.")
    assert_selector("div[role='alert'] > button", text: "View more")
  end

  def test_renders_block_as_message_with_additional_content
    render_inline(Flowbite::Alert.new(title: "Requirements")) do |alert|
      alert.with_additional_content { "<button type=\"button\">View more</button>".html_safe }
      "<ul><li>At least 10 characters</li></ul>".html_safe
    end

    assert_selector("div[role='alert'] > div.mt-2.mb-4 > ul > li", text: "At least 10 characters")
    assert_selector("div[role='alert'] > button", text: "View more")
  end

  def test_renders_container_classes_in_order
    render_inline(Flowbite::Alert.new(class: "custom")) { "Test" }

    assert_selector("div[role='alert'][class='p-4 text-sm flex items-start bg-brand-softer text-fg-brand-strong rounded-base custom']")
  end

  def test_renders_without_title_when_title_is_blank
    render_inline(Flowbite::Alert.new(title: "")) { "Test" }

    assert_no_selector("span.font-medium")
  end

  def test_renders_title_and_message_next_to_icon
    render_inline(Flowbite::Alert.new(title: "Info alert!")) { "Test" }

    assert_selector("div[role='alert'] > svg + span.sr-only + div > span.font-medium.me-1", text: "Info alert!")
    assert_selector("div[role='alert'] > div", text: /Info alert!\s+Test/)
  end

  def test_renders_style_label_for_screen_readers
    render_inline(Flowbite::Alert.new(style: :warning)) { "Test" }

    assert_selector("span.sr-only", text: "Warning")
  end

  def test_classes
    assert_equal ["bg-warning-soft", "text-fg-warning"], Flowbite::Alert.classes(style: :warning)
    assert_equal ["border-warning-subtle"], Flowbite::Alert.classes(state: :border, style: :warning)
  end
end

class Flowbite::Alert::IconTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Alert::Icon.new)

    assert_component_rendered
    assert_selector("svg")
  end

  def test_renders_svg_with_proper_attributes
    render_inline(Flowbite::Alert::Icon.new)

    assert_selector("svg[aria-hidden='true'][fill='none']")
    assert_selector("svg.w-4.h-4.shrink-0")
    assert_selector("svg path[stroke='currentColor'][d='#{Flowbite::Alert::Icon::SVG_PATH}']")
  end

  def test_renders_additional_classes
    render_inline(Flowbite::Alert::Icon.new(class: ["me-2"]))

    assert_selector("svg[class='w-4 h-4 shrink-0 me-2']")
  end
end
