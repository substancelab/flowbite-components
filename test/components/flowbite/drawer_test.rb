require "test_helper"

class Flowbite::DrawerTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_component_rendered
    assert_selector("div#info.fixed.z-40.transition-transform[tabindex='-1'][aria-labelledby='info-label']")
  end

  def test_renders_title_and_body
    render_inline(Flowbite::Drawer.new(id: "info", title: "Drawer heading")) { "Body text" }

    assert_selector("h5#info-label", text: "Drawer heading")
    assert_selector("div#info", text: "Body text")
  end

  def test_renders_icon_by_default
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_selector("h5 svg[aria-hidden='true']")
  end

  def test_renders_without_icon
    render_inline(Flowbite::Drawer.new(icon: false, id: "info", title: "Info")) { "Body" }

    assert_no_selector("h5 svg")
  end

  def test_renders_close_button
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_selector("button[type='button'][aria-controls='info'].absolute", text: "Close menu")
  end

  def test_passes_close_button_options
    render_inline(Flowbite::Drawer.new(close_button: {options: {data: {action: "drawer#close"}}}, id: "info", title: "Info")) { "Body" }

    assert_selector("button[data-action='drawer#close']")
  end

  def test_renders_left_placement_by_default
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_selector("div#info.top-0.left-0.h-screen.w-96.-translate-x-full.border-e")
  end

  def test_renders_right_placement
    render_inline(Flowbite::Drawer.new(id: "info", placement: :right, title: "Info")) { "Body" }

    assert_selector("div#info.top-0.right-0.h-screen.w-96.translate-x-full.border-s")
  end

  def test_renders_top_placement
    render_inline(Flowbite::Drawer.new(id: "info", placement: :top, title: "Info")) { "Body" }

    assert_selector("div#info.top-0.left-0.right-0.w-full.-translate-y-full.border-b")
  end

  def test_renders_bottom_placement
    render_inline(Flowbite::Drawer.new(id: "info", placement: :bottom, title: "Info")) { "Body" }

    assert_selector("div#info.bottom-0.left-0.right-0.w-full.translate-y-full.border-t")
  end

  def test_raises_on_unknown_placement
    assert_raises(KeyError) do
      render_inline(Flowbite::Drawer.new(id: "info", placement: :middle, title: "Info"))
    end
  end

  def test_renders_hidden_by_default
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_selector("div#info.-translate-x-full")
    assert_no_selector("div#info.transform-none")
    assert_no_selector("div#info[role]")
  end

  def test_renders_open
    render_inline(Flowbite::Drawer.new(id: "info", open: true, placement: :right, title: "Info")) { "Body" }

    assert_selector("div#info.transform-none[role='dialog'][aria-modal='true'][aria-labelledby='info-label']")
    assert_no_selector("div#info.translate-x-full")
  end

  def test_renders_open_with_stimulus_behavior
    render_inline(Flowbite::Drawer.new(behavior: :stimulus, id: "info", open: true, title: "Info")) { "Body" }

    assert_selector("div#info.transform-none[data-controller='flowbite--drawer'][role='dialog']")
    assert_no_selector("div#info[inert]")
  end

  def test_renders_with_additional_classes_and_options
    render_inline(Flowbite::Drawer.new(class: ["w-80"], data: {foo: "bar"}, id: "info", title: "Info")) { "Body" }

    assert_selector("div#info.w-80[data-foo='bar']")
  end

  def test_renders_no_behavior_by_default
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_no_selector("[data-controller]")
    assert_no_selector("[data-action]")
  end

  def test_renders_stimulus_behavior
    render_inline(Flowbite::Drawer.new(behavior: :stimulus, id: "info", placement: :right, title: "Info")) { "Body" }

    assert_selector("div#info[data-controller='flowbite--drawer'][data-flowbite--drawer-placement-value='right']")
    assert_selector("button[data-action='flowbite--drawer#hide']", text: "Close menu")
  end

  def test_renders_hidden_stimulus_behavior_inert
    render_inline(Flowbite::Drawer.new(behavior: :stimulus, id: "info", title: "Info")) { "Body" }

    assert_selector("div#info[inert]")
  end

  def test_renders_no_inert_without_behavior
    render_inline(Flowbite::Drawer.new(id: "info", title: "Info")) { "Body" }

    assert_no_selector("div#info[inert]")
  end

  def test_stimulus_behavior_keeps_custom_data_attributes
    render_inline(Flowbite::Drawer.new(
      behavior: :stimulus,
      close_button: {options: {data: {action: "analytics#track"}}},
      data: {controller: "analytics", "flowbite--drawer-backdrop-value": false},
      id: "info",
      title: "Info"
    )) { "Body" }

    assert_selector("div#info[data-controller='analytics flowbite--drawer'][data-flowbite--drawer-backdrop-value='false']")
    assert_selector("button[data-action='analytics#track flowbite--drawer#hide']")
  end

  def test_raises_on_unsupported_behavior
    assert_raises(ArgumentError) do
      render_inline(Flowbite::Drawer.new(behavior: :native, id: "info", title: "Info"))
    end
  end

  def test_trigger_options
    options = Flowbite::Drawer.trigger_options("info", action: :show)

    assert_equal({controls: "info"}, options[:aria])
    assert_equal "flowbite--drawer-trigger#show", options[:data][:action]
    assert_equal "#info", options[:data][:"flowbite--drawer-trigger-flowbite--drawer-outlet"]
  end
end
