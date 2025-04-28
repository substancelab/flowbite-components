# frozen_string_literal: true

module Flowbite
  class InputField
    class Number < InputField
      protected

      def input_component
        ::Flowbite::Input::Number
      end
    end
  end
end
