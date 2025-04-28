# frozen_string_literal: true

module Flowbite
  class Button
    class Outline < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength
        def styles
          {
            default: Flowbite::Style.new(
              default: ["text-blue-700", "hover:text-white", "border", "border-blue-700", "hover:bg-blue-800", "focus:ring-4", "focus:outline-none", "focus:ring-blue-300", "font-medium", "rounded-lg", "text-center", "me-2", "mb-2", "dark:border-blue-500", "dark:text-blue-500", "dark:hover:text-white", "dark:hover:bg-blue-500", "dark:focus:ring-blue-800"]
            ),
            green: Flowbite::Style.new(
              default: ["text-green-700", "hover:text-white", "border", "border-green-700", "hover:bg-green-800", "focus:ring-4", "focus:outline-none", "focus:ring-green-300", "font-medium", "rounded-lg", "text-center", "me-2", "mb-2", "dark:border-green-500", "dark:text-green-500", "dark:hover:text-white", "dark:hover:bg-green-600", "dark:focus:ring-green-800"]
            )
          }
        end
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
