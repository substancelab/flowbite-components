# frozen_string_literal: true

module Flowbite
  class InputField
    class DateTime < InputField
      protected

      def input_component
        Flowbite::Input::DateTime
      end
    end
  end
end
