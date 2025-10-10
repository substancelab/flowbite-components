# frozen_string_literal: true

module Flowbite
  class InputField
    class Checkbox < InputField
      protected

      def default_hint_options
        return {} unless @hint

        {
          class: hint_classes,
          id: id_for_hint_element
        }.merge(@hint[:options] || {})
      end

      def default_label_options
        options = super
        options[:options] ||= {}
        options[:options][:class] = options.dig(:options, :class) || label_classes
        options
      end

      def input_component
        ::Flowbite::Input::Checkbox
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
