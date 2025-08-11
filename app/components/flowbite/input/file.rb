# frozen_string_literal: true

module Flowbite
  module Input
    class File < Field
      SIZES = {
        sm: ["text-xs"],
        default: ["text-sm"],
        lg: ["text-lg"]
      }.freeze

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :file_field
      end

      # rubocop:disable Layout/LineLength
      def self.styles
        {
          default: Flowbite::Style.new(
            default: ["block", "w-full", "text-gray-900", "border", "border-gray-300", "rounded-lg", "cursor-pointer", "bg-gray-50", "focus:outline-none", "dark:text-gray-400", "dark:bg-gray-700", "dark:border-gray-600"],
            disabled: ["block", "w-full", "text-gray-400", "border", "border-gray-300", "rounded-lg", "cursor-not-allowed", "bg-gray-100", "dark:text-gray-500", "dark:bg-gray-600", "dark:border-gray-500"],
            error: ["block", "w-full", "text-red-900", "border", "border-red-500", "rounded-lg", "cursor-pointer", "bg-red-50", "focus:outline-none", "dark:text-red-400", "dark:bg-gray-700", "dark:border-red-500"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end
  end
end
