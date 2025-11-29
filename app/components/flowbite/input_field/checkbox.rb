# frozen_string_literal: true

module Flowbite
  class InputField
    class Checkbox < InputField
      protected

      def default_container_classes
        ["flex"]
      end

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
          "text-xs font-normal text-fg-disabled"
        else
          "text-xs font-normal text-body"
        end
      end

      def input_arguments
        args = super
        args[:unchecked_value] = @input[:unchecked_value] if @input.key?(:unchecked_value)
        args[:value] = @input[:value] if @input.key?(:value)
        args
      end

      def label_classes
        if disabled?
          "font-medium text-fg-disabled"
        else
          "font-medium text-heading"
        end
      end
    end
  end
end
