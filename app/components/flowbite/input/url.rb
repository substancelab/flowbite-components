# frozen_string_literal: true

module Flowbite
  class Input
    class Url < Input
      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :url_field
      end
    end
  end
end
