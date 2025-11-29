# frozen_string_literal: true

module Flowbite
  class InputField
    class RadioButton < InputField
      def initialize(attribute:, form:, value:, class: nil, disabled: false, hint: nil, input: {}, label: {}, options: {})
        super(attribute: attribute, class: binding.local_variable_get(:class), form: form, disabled: disabled, hint: hint, input: input, label: label, options: options)
        @value = value
      end

      protected

      def default_container_classes
        ["flex"]
      end

      def default_input
        args = {
          attribute: @attribute,
          disabled: disabled?,
          form: @form,
          options: default_input_options.merge(@input[:options] || {}),
          value: @value
        }

        input_component.new(**args)
      end

      # Returns options for the default label element. This includes CSS classes
      # since they are specific to RadioButton labels (and Checkbox ones).
      def default_label_options
        super.merge({
          options: {
            class: label_classes,
            for: id_for_input_element
          }
        })
      end

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

      def input_component
        ::Flowbite::Input::RadioButton
      end

      private

      def hint_classes
        if disabled?
          "text-xs font-normal text-fg-disabled"
        else
          "text-xs font-normal text-body"
        end
      end

      def id_for_input_element
        [
          @form.object_name,
          @attribute,
          @value
        ].join("_")
      end

      def id_for_hint_element
        [id_for_input_element, "hint"].join("_")
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
