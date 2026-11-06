require "test_helper"
require "rails/generators/test_case"
require "generators/flowbite_components/behavior/behavior_generator"

class FlowbiteComponents::Generators::BehaviorGeneratorTest < Rails::Generators::TestCase
  tests FlowbiteComponents::Generators::BehaviorGenerator
  destination File.expand_path("../../../tmp/generators", __dir__)
  setup :prepare_destination

  def test_copies_controller
    run_generator ["toast"]

    assert_file "app/javascript/controllers/flowbite/toast_controller.js" do |content|
      assert_match(/Installed by flowbite-components #{Regexp.escape(Flowbite::Components::VERSION)}/, content)
      assert_match(/export default class extends Controller/, content)
    end
  end

  def test_rejects_unknown_behavior
    assert_raises(Thor::Error) do
      run_generator ["nonexistent"], debug: true
    end

    assert_no_file "app/javascript/controllers/flowbite/nonexistent_controller.js"
  end

  def test_lists_available_behaviors
    assert_includes FlowbiteComponents::Generators::BehaviorGenerator.available_behaviors, "toast"
  end
end
