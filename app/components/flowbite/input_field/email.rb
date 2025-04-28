# frozen_string_literal: true

module Flowbite
  class InputField
    class Email < InputField
      protected

      def input_component
        ::Flowbite::Input::Email
      end
    end
  end
end
