# frozen_string_literal: true

module Flowbite
  class InputField
    class Date < InputField
      protected

      def input_component
        ::Flowbite::Input::Date
      end
    end
  end
end
