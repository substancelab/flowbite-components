# frozen_string_literal: true

module Flowbite
  module Input
    class Textarea < Field
      class << self
        # rubocop:disable Layout/LineLength
        def styles
          {
            default: Flowbite::Style.new(
              default: ["block", "w-full", "text-heading", "bg-neutral-secondary-medium", "rounded-base", "border", "border-default-medium", "focus:ring-brand", "focus:border-brand", "shadow-xs", "placeholder:text-body"],
              disabled: ["block", "w-full", "bg-neutral-secondary-medium", "rounded-base", "border", "border-default-medium", "text-fg-disabled", "cursor-not-allowed", "shadow-xs", "placeholder:text-fg-disabled"],
              error: ["block", "w-full", "bg-danger-soft", "border", "border-danger-subtle", "text-fg-danger-strong", "placeholder:text-fg-danger-strong", "rounded-base", "focus:ring-danger", "focus:border-danger", "shadow-xs"]
            )
          }.freeze
        end
        # rubocop:enable Layout/LineLength
      end

      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          **input_options
        )
      end

      protected

      # Returns the CSS classes to apply to the input field
      def classes
        self.class.classes(size: size, state: state) + @class
      end

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :text_area
      end
    end
  end
end
