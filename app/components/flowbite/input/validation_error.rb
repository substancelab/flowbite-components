# frozen_string_literal: true

module Flowbite
  module Input
    class ValidationError < ViewComponent::Base
      def call
        tag.p(content, class: "mt-2 text-sm text-red-600 dark:text-red-500 #{@class}")
      end

      def initialize(class: nil)
        @class = binding.local_variable_get(:class)
      end
    end
  end
end
