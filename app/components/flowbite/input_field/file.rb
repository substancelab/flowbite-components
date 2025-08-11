# frozen_string_literal: true

module Flowbite
  class InputField
    class File < InputField
      protected

      def input_component
        ::Flowbite::Input::File
      end
    end
  end
end
