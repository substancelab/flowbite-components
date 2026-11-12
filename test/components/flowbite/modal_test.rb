require "test_helper"

class Flowbite::ModalTest < Minitest::Test
  include ViewComponent::TestHelpers

  def test_render_component
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms of Service")) { "Body" }

    assert_component_rendered
    assert_selector("div#terms.hidden.fixed[aria-hidden='true'][tabindex='-1']", visible: :all)
  end

  def test_renders_title_and_body
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms of Service")) { "Body text" }

    assert_selector("h3.text-lg", text: "Terms of Service", visible: :all)
    assert_selector("div.space-y-4", text: "Body text", visible: :all)
  end

  def test_is_labelled_by_its_title
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms of Service")) { "Body" }

    assert_selector("div#terms[aria-labelledby='terms-label']", visible: :all)
    assert_selector("h3#terms-label", text: "Terms of Service", visible: :all)
  end

  def test_renders_close_button
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms")) { "Body" }

    assert_selector("button[type='button']", text: "Close modal", visible: :all)
  end

  def test_passes_close_button_options
    render_inline(Flowbite::Modal.new(close_button: {options: {data: {action: "modal#close"}}}, id: "terms", title: "Terms")) { "Body" }

    assert_selector("button[data-action='modal#close']", visible: :all)
  end

  def test_renders_footer
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms")) do |modal|
      modal.with_footer { "<button id='accept'>Accept</button>".html_safe }
      "Body"
    end

    assert_selector("div.border-t button#accept", visible: :all)
  end

  def test_renders_no_footer_by_default
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms")) { "Body" }

    assert_no_selector("div.border-t", visible: :all)
  end

  def test_renders_default_size
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms")) { "Body" }

    assert_selector("div.max-w-2xl", visible: :all)
  end

  def test_renders_sizes
    {sm: "max-w-md", lg: "max-w-4xl", xl: "max-w-7xl"}.each do |size, css_class|
      render_inline(Flowbite::Modal.new(id: "terms", size: size, title: "Terms")) { "Body" }

      assert_selector("div.#{css_class}", visible: :all)
    end
  end

  def test_renders_with_additional_classes_and_options
    render_inline(Flowbite::Modal.new(class: ["custom-class"], data: {foo: "bar"}, id: "terms", title: "Terms")) { "Body" }

    assert_selector("div#terms.hidden.custom-class[data-foo='bar']", visible: :all)
  end

  def test_renders_no_behavior_by_default
    render_inline(Flowbite::Modal.new(id: "terms", title: "Terms")) { "Body" }

    assert_no_selector("[data-controller]", visible: :all)
    assert_no_selector("[data-action]", visible: :all)
  end

  def test_renders_stimulus_behavior
    render_inline(Flowbite::Modal.new(behavior: :stimulus, id: "terms", title: "Terms")) { "Body" }

    assert_selector("div#terms[data-controller='flowbite--modal']", visible: :all)
    assert_selector("button[data-action='flowbite--modal#hide']", text: "Close modal", visible: :all)
  end

  def test_stimulus_behavior_keeps_custom_data_attributes
    render_inline(Flowbite::Modal.new(
      behavior: :stimulus,
      close_button: {options: {data: {action: "analytics#track"}}},
      data: {controller: "analytics", "flowbite--modal-backdrop-value": "static"},
      id: "terms",
      title: "Terms"
    )) { "Body" }

    assert_selector("div#terms[data-controller='analytics flowbite--modal'][data-flowbite--modal-backdrop-value='static']", visible: :all)
    assert_selector("button[data-action='analytics#track flowbite--modal#hide']", visible: :all)
  end

  def test_raises_on_unsupported_behavior
    assert_raises(ArgumentError) do
      render_inline(Flowbite::Modal.new(behavior: :native, id: "terms", title: "Terms"))
    end
  end

  def test_trigger_options_escapes_id_in_outlet_selector
    options = Flowbite::Modal.trigger_options("terms.v2")

    assert_equal "#terms\\.v2", options[:data][:"flowbite--modal-trigger-flowbite--modal-outlet"]
  end

  def test_trigger_options_toggle_by_default
    expected = {
      data: {
        action: "flowbite--modal-trigger#toggle",
        controller: "flowbite--modal-trigger",
        "flowbite--modal-trigger-flowbite--modal-outlet": "#terms"
      }
    }

    assert_equal expected, Flowbite::Modal.trigger_options("terms")
  end

  def test_trigger_options_with_action
    assert_equal "flowbite--modal-trigger#show", Flowbite::Modal.trigger_options("terms", action: :show)[:data][:action]
  end

  def test_trigger_options_raises_on_unknown_action
    assert_raises(ArgumentError) do
      Flowbite::Modal.trigger_options("terms", action: :explode)
    end
  end
end
