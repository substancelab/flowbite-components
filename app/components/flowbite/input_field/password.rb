# frozen_string_literal: true

module Flowbite
  class InputField
    class Password < InputField
      protected

      def input_component
        ::Flowbite::Input::Password
      end
    end
  end
end
