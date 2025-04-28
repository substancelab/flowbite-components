# frozen_string_literal: true

module Flowbite
  module Input
    class Textarea < Field
      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          class: input_field_classes
        )
      end

      protected

      # Returns an array with the CSS classes to apply to the input field
      # element.
      #
      # See https://flowbite.com/docs/forms/textarea/
      def input_field_classes
        [
          "block",
          "p-2.5",
          "w-full",
          "text-sm",
          "text-gray-900",
          "bg-gray-50",
          "rounded-lg",
          "border",
          "border-gray-300",
          "focus:ring-blue-500",
          "focus:border-blue-500",
          "dark:bg-gray-700",
          "dark:border-gray-600",
          "dark:placeholder-gray-400",
          "dark:text-white",
          "dark:focus:ring-blue-500",
          "dark:focus:border-blue-500"
        ]
      end

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :text_area
      end
    end
  end
end
