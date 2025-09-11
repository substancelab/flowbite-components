# frozen_string_literal: true

module Flowbite
  class InputField
    class Select < InputField
      def initialize(attribute:, form:, collection: [], disabled: false, hint: nil, input: {}, label: {}, size: :default)
        super(attribute: attribute, disabled: disabled, form: form, hint: hint, input: input, label: label, size: size)
        @collection = collection
      end

      def input
        render(
          input_component.new(
            attribute: @attribute,
            collection: @collection,
            disabled: @disabled,
            form: @form,
            options: input_options,
            size: @size
          )
        )
      end

      private

      def input_component
        ::Flowbite::Input::Select
      end
    end
  end
end
