# frozen_string_literal: true

module Flowbite
  module Input
    # The radio button component can be used to allow the user to choose a
    # single option from one or more available options.
    #
    # https://flowbite.com/docs/forms/radio/
    class RadioButton < Field
      class << self
        # Radio buttons only have their default size.
        def sizes
          {
            default: ["w-4", "h-4"]
          }
        end

        # rubocop:disable Layout/LineLength
        def styles
          {
            default: Flowbite::Style.new(
              default: ["text-blue-600", "bg-gray-100", "border-gray-300", "focus:ring-blue-500", "dark:focus:ring-blue-600", "dark:ring-offset-gray-800", "focus:ring-2", "dark:bg-gray-700", "dark:border-gray-600"],
              disabled: ["text-blue-600", "bg-gray-100", "border-gray-300", "focus:ring-blue-500", "dark:focus:ring-blue-600", "dark:ring-offset-gray-800", "focus:ring-2", "dark:bg-gray-700", "dark:border-gray-600"],
              error: ["text-red-600", "bg-red-50", "border-red-500", "focus:ring-red-500", "dark:focus:ring-red-600", "dark:ring-offset-gray-800", "focus:ring-2", "dark:bg-gray-700", "dark:border-red-500"]
            )
          }.freeze
        end
      end

      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          @value,
          **input_options
        )
      end

      def initialize(attribute:, form:, value:, disabled: false, options: {})
        super(attribute: attribute, disabled: disabled, form: form, options: options)
        @value = value
      end

      def input_field_type
        :radio_button
      end
    end
  end
end
