# frozen_string_literal: true

module Flowbite
  class InputField
    class Select < InputField
      def initialize(attribute:, form:, collection: [], hint: nil, input_options: {}, size: :default)
        super(attribute: attribute, form: form, hint: hint, input_options: input_options, size: size)
        @collection = collection
      end

      def input
        render(
          input_component.new(
            attribute: @attribute,
            collection: @collection,
            form: @form,
            input_options: @input_options,
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
