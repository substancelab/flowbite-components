# frozen_string_literal: true

module Flowbite
  class InputField
    class Textarea < InputField
      protected

      def input_component
        ::Flowbite::Input::Textarea
      end
    end
  end
end
