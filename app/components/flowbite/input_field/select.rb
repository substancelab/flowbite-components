# frozen_string_literal: true

module Flowbite
  class InputField
    class Select < InputField
      def initialize(form:, attribute:, collection:, text_method: :to_s, value_method: :to_s)
        super(form: form, attribute: attribute)
        @collection = collection
        @text_method = text_method
        @value_method = value_method
      end

      def input
        render(
          input_component.new(
            @form,
            @attribute,
            @collection,
            @value_method,
            @text_method
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
