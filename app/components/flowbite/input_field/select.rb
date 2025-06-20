# frozen_string_literal: true

module Flowbite
  class InputField
    class Select < InputField
      def initialize(attribute:, form:, collection: [], hint: nil, input_attributes: {}, size: :default)
        super(attribute: attribute, form: form, hint: hint, input_attributes: input_attributes, size: size)
        @collection = collection
      end

      def input
        render(
          input_component.new(
            @form,
            @attribute,
            collection: @collection,
            input_attributes: @input_attributes,
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
