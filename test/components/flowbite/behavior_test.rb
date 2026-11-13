require "test_helper"

class Flowbite::BehaviorTest < Minitest::Test
  def teardown
    Flowbite::Components.default_behavior = :none
  end

  def test_default_behavior_is_none
    assert_equal :none, Flowbite::Components.default_behavior
  end

  def test_resolve_returns_explicit_behavior
    assert_equal :stimulus, Flowbite::Behavior.resolve(:stimulus, supported: [:stimulus])
  end

  def test_resolve_returns_none_when_explicitly_given
    Flowbite::Components.default_behavior = :stimulus

    assert_equal :none, Flowbite::Behavior.resolve(:none, supported: [:stimulus])
  end

  def test_resolve_raises_on_unsupported_explicit_behavior
    error = assert_raises(ArgumentError) do
      Flowbite::Behavior.resolve(:native, supported: [:stimulus])
    end

    assert_match(/:native/, error.message)
  end

  def test_resolve_uses_default_behavior_when_nil
    Flowbite::Components.default_behavior = :stimulus

    assert_equal :stimulus, Flowbite::Behavior.resolve(nil, supported: [:stimulus])
  end

  def test_resolve_falls_back_to_none_when_default_behavior_is_unsupported
    Flowbite::Components.default_behavior = :native

    assert_equal :none, Flowbite::Behavior.resolve(nil, supported: [:stimulus])
  end

  def test_resolve_accepts_strings
    assert_equal :stimulus, Flowbite::Behavior.resolve("stimulus", supported: [:stimulus])
  end

  def test_resolve_accepts_string_default_behavior
    Flowbite::Components.default_behavior = "stimulus"

    assert_equal :stimulus, Flowbite::Behavior.resolve(nil, supported: [:stimulus])
  end

  def test_trigger_options
    expected = {
      aria: {controls: "info"},
      data: {
        action: "click->flowbite--drawer-trigger#show:prevent",
        controller: "flowbite--drawer-trigger",
        "flowbite--drawer-trigger-flowbite--drawer-outlet": "#info"
      }
    }

    assert_equal expected, Flowbite::Behavior.trigger_options(action: :show, controller: "flowbite--drawer", id: "info")
  end

  def test_trigger_options_escapes_id_in_outlet_selector
    result = Flowbite::Behavior.trigger_options(action: :show, controller: "flowbite--drawer", id: "info.v2")

    assert_equal "info.v2", result[:aria][:controls]
    assert_equal "#info\\.v2", result[:data][:"flowbite--drawer-trigger-flowbite--drawer-outlet"]
  end

  def test_id_selector
    assert_equal "#info", Flowbite::Behavior.id_selector("info")
    assert_equal "#drawer-info_2", Flowbite::Behavior.id_selector("drawer-info_2")
  end

  def test_id_selector_escapes_special_characters
    assert_equal "#info\\.v2", Flowbite::Behavior.id_selector("info.v2")
    assert_equal "#user\\:1", Flowbite::Behavior.id_selector("user:1")
  end

  def test_id_selector_escapes_leading_digits
    assert_equal "#\\31 23", Flowbite::Behavior.id_selector("123")
    assert_equal "#-\\31 ", Flowbite::Behavior.id_selector("-1")
  end

  def test_trigger_options_raises_on_unknown_action
    assert_raises(ArgumentError) do
      Flowbite::Behavior.trigger_options(action: :explode, controller: "flowbite--drawer", id: "info")
    end
  end

  def test_merge_data_tokens_adds_tokens
    result = Flowbite::Behavior.merge_data_tokens({id: "x"}, controller: "flowbite--toast")

    assert_equal({id: "x", data: {controller: "flowbite--toast"}}, result)
  end

  def test_merge_data_tokens_keeps_existing_tokens
    options = {data: {"controller" => "mine", :other => "value"}}

    result = Flowbite::Behavior.merge_data_tokens(options, controller: "flowbite--toast")

    assert_equal({controller: "mine flowbite--toast", other: "value"}, result[:data])
  end

  def test_merge_data_tokens_moves_string_keyed_data_into_data
    options = {"data" => {"controller" => "mine"}, :id => "x"}

    result = Flowbite::Behavior.merge_data_tokens(options, controller: "flowbite--toast")

    assert_equal({id: "x", data: {controller: "mine flowbite--toast"}}, result)
  end

  def test_merge_data_tokens_skips_existing_tokens
    options = {data: {action: "flowbite--toast#dismiss", controller: "mine  flowbite--toast"}}

    result = Flowbite::Behavior.merge_data_tokens(options, action: "flowbite--toast#dismiss", controller: "flowbite--toast")

    assert_equal({action: "flowbite--toast#dismiss", controller: "mine flowbite--toast"}, result[:data])
  end

  def test_merge_data_tokens_moves_flat_tokens_into_data
    options = {"data-controller" => "mine", :"data-action" => "click->mine#go", :id => "x"}

    result = Flowbite::Behavior.merge_data_tokens(options, action: "flowbite--toast#dismiss", controller: "flowbite--toast")

    assert_equal({id: "x", data: {action: "click->mine#go flowbite--toast#dismiss", controller: "mine flowbite--toast"}}, result)
  end
end
