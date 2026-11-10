# frozen_string_literal: true

require "rails/generators"

module FlowbiteComponents
  module Generators
    # Copies the Stimulus controllers for the given components into the
    # application, where stimulus-rails registers them automatically, ie as
    # +flowbite--toast+.
    #
    # Re-run the generator after upgrading flowbite-components to update the
    # controllers.
    #
    # @example
    #   bin/rails generate flowbite_components:behavior toast
    class BehaviorGenerator < Rails::Generators::Base
      CONTROLLERS_PATH = File.expand_path("../../../../app/javascript/flowbite_components/controllers", __dir__)

      class << self
        # @return [Array<String>] The components with Stimulus controllers.
        #   Controllers prefixed by another component's name, ie
        #   modal_trigger_controller.js, belong to that component.
        def available_behaviors
          names = controller_names
          names.reject { |name| names.any? { |other| name.start_with?("#{other}_") } }.sort
        end

        # @return [Array<String>] The names of the controllers for behavior,
        #   ie ["modal", "modal_trigger"].
        def controllers_for(behavior)
          controller_names.select { |name| name == behavior || name.start_with?("#{behavior}_") }.sort
        end

        private

        def controller_names
          Dir.children(CONTROLLERS_PATH).map { |file| file.delete_suffix("_controller.js") }
        end
      end

      desc "Copies the Stimulus controllers for the given components into " \
        "app/javascript/controllers/flowbite. Available components: " \
        "#{available_behaviors.join(", ")}"

      argument :behaviors, banner: "component component", type: :array

      def copy_controllers
        behaviors.each do |behavior|
          unless self.class.available_behaviors.include?(behavior)
            raise Thor::Error,
              "Unknown behavior #{behavior.inspect}. Available: #{self.class.available_behaviors.join(", ")}"
          end

          self.class.controllers_for(behavior).each do |name|
            create_file(
              "app/javascript/controllers/flowbite/#{name}_controller.js",
              header(behavior) + File.read(File.join(CONTROLLERS_PATH, "#{name}_controller.js"))
            )
          end
        end
      end

      def show_dependencies
        say <<~TEXT

          The flowbite-components Stimulus controllers require stimulus-use
          (https://stimulus-use.dev). Add it to your application using either

            bin/importmap pin stimulus-use

          or

            npm install stimulus-use
        TEXT
      end

      private

      def header(behavior)
        <<~JS
          // Installed by flowbite-components #{Flowbite::Components::VERSION}.
          // Update using bin/rails generate flowbite_components:behavior #{behavior}
        JS
      end
    end
  end
end
