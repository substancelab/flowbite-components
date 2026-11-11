# frozen_string_literal: true

require "rails/generators"

module FlowbiteComponents
  module Generators
    # Copies the Stimulus controllers for the given components into the
    # application, where stimulus-rails registers them automatically, ie as
    # `flowbite--toast`.
    #
    # Re-run the generator after upgrading flowbite-components to update the
    # controllers.
    #
    # @example
    #   bin/rails generate flowbite_components:behavior toast
    class BehaviorGenerator < Rails::Generators::Base
      CONTROLLERS_PATH = File.expand_path("../../../../app/javascript/flowbite_components/controllers", __dir__)

      class << self
        # @return [Array<String>] The components with a Stimulus controller.
        def available_behaviors
          Dir.children(CONTROLLERS_PATH).map { |file| file.delete_suffix("_controller.js") }.sort
        end
      end

      desc "Copies the Stimulus controllers for the given components into " \
        "app/javascript/controllers/flowbite. Available components: " \
        "#{available_behaviors.join(", ")}"

      argument :behaviors, banner: "component component", type: :array

      def check_behaviors
        unknown = behaviors - self.class.available_behaviors
        return if unknown.empty?

        raise Thor::Error,
          "Unknown behavior #{unknown.map(&:inspect).join(", ")}. Available: #{self.class.available_behaviors.join(", ")}"
      end

      def copy_controllers
        behaviors.each do |behavior|
          create_file(
            "app/javascript/controllers/flowbite/#{behavior}_controller.js",
            header(behavior) + File.read(File.join(CONTROLLERS_PATH, "#{behavior}_controller.js"))
          )
        end
      end

      def show_dependencies
        say <<~TEXT

          The flowbite-components Stimulus controllers require stimulus-use
          (https://stimulus-use.dev). Add it to your application using either

            bin/importmap pin stimulus-use

          or

            npm install stimulus-use

          If your application registers its Stimulus controllers in
          app/javascript/controllers/index.js, ie when using jsbundling-rails,
          update it using

            bin/rails stimulus:manifest:update
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
