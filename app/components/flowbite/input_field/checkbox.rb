# frozen_string_literal: true

module Flowbite
  class InputField
    class Checkbox < InputField
      protected

      def input_component
        ::Flowbite::Input::Checkbox
      end

      protected

      # Returns the HTML to use for the hint element if any
      def hint
        return unless hint?

        component = Flowbite::Input::Hint.new(
          attribute: @attribute,
          form: @form,
          options: {
            class: hint_classes,
            id: id_for_hint_element
          }
        ).with_content(@hint)
        render(component)
      end

      # Returns the HTML to use for the label element
      def label
        render(
          Flowbite::Input::Label.new(
            attribute: @attribute,
            form: @form,
            options: {
              class: label_classes
            }
          )
        )
      end

      private

      def hint_classes
        if disabled?
          "text-xs font-normal text-gray-400 dark:text-gray-500"
        else
          "text-xs font-normal text-gray-500 dark:text-gray-300"
        end
      end

      def label_classes
        if disabled?
          "font-medium text-gray-400 dark:text-gray-500"
        else
          "font-medium text-gray-900 dark:text-gray-300"
        end
      end
    end
  end
end
