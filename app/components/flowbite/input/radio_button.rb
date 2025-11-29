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
              default: ["text-brand", "bg-neutral-secondary-medium", "border-default-medium", "focus:ring-brand", "focus:ring-2"],
              disabled: ["text-brand", "bg-neutral-secondary-medium", "border-default-medium", "focus:ring-brand", "focus:ring-2", "cursor-not-allowed"],
              error: ["text-danger", "bg-danger-soft", "border-danger-subtle", "focus:ring-danger", "focus:ring-2"]
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

      def initialize(attribute:, form:, value:, class: nil, disabled: false, options: {})
        super(attribute: attribute, class: binding.local_variable_get(:class), disabled: disabled, form: form, options: options)
        @value = value
      end

      def input_field_type
        :radio_button
      end
    end
  end
end
