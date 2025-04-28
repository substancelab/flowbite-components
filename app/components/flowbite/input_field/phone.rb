# frozen_string_literal: true

module Flowbite
  class InputField
    class Phone < InputField
      protected

      def input_component
        ::Flowbite::Input::Phone
      end
    end
  end
end
