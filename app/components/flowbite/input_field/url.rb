# frozen_string_literal: true

module Flowbite
  class InputField
    class Url < InputField
      protected

      def input_component
        ::Flowbite::Input::Url
      end
    end
  end
end
