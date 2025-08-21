# frozen_string_literal: true

module Flowbite
  class Button
    class Pill < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength, Metrics/MethodLength
        def styles
          {
            alternative: Flowbite::Style.new(
              default: ["text-sm", "font-medium", "text-gray-900", "focus:outline-none", "bg-white", "rounded-full", "border", "border-gray-200", "hover:bg-gray-100", "hover:text-blue-700", "focus:z-10", "focus:ring-4", "focus:ring-gray-100", "dark:focus:ring-gray-700", "dark:bg-gray-800", "dark:text-gray-400", "dark:border-gray-600", "dark:hover:text-white", "dark:hover:bg-gray-700"]
            ),
            dark: Flowbite::Style.new(
              default: ["text-white", "bg-gray-800", "hover:bg-gray-900", "focus:outline-none", "focus:ring-4", "focus:ring-gray-300", "font-medium", "rounded-full", "dark:bg-gray-800", "dark:hover:bg-gray-700", "dark:focus:ring-gray-700", "dark:border-gray-700"]
            ),
            default: Flowbite::Style.new(
              default: ["text-white", "bg-blue-700", "hover:bg-blue-800", "focus:outline-none", "focus:ring-4", "focus:ring-blue-300", "font-medium", "rounded-full", "text-center", "dark:bg-blue-600", "dark:hover:bg-blue-700", "dark:focus:ring-blue-800"]
            ),
            green: Flowbite::Style.new(
              default: ["text-white", "bg-green-700", "hover:bg-green-800", "focus:outline-none", "focus:ring-4", "focus:ring-green-300", "font-medium", "rounded-full", "text-center", "dark:bg-green-600", "dark:hover:bg-green-700", "dark:focus:ring-green-800"]
            ),
            light: Flowbite::Style.new(
              default: ["text-gray-900", "bg-white", "border", "border-gray-300", "focus:outline-none", "hover:bg-gray-100", "focus:ring-4", "focus:ring-gray-100", "font-medium", "rounded-full", "dark:bg-gray-800", "dark:text-white", "dark:border-gray-600", "dark:hover:bg-gray-700", "dark:hover:border-gray-600", "dark:focus:ring-gray-700"]
            ),
            purple: Flowbite::Style.new(
              default: ["text-white", "bg-purple-700", "hover:bg-purple-800", "focus:outline-none", "focus:ring-4", "focus:ring-purple-300", "font-medium", "rounded-full", "text-center", "dark:bg-purple-600", "dark:hover:bg-purple-700", "dark:focus:ring-purple-900"]
            ),
            red: Flowbite::Style.new(
              default: ["text-white", "bg-red-700", "hover:bg-red-800", "focus:outline-none", "focus:ring-4", "focus:ring-red-300", "font-medium", "rounded-full", "text-center", "dark:bg-red-600", "dark:hover:bg-red-700", "dark:focus:ring-red-900"]
            ),
            yellow: Flowbite::Style.new(
              default: ["text-white", "bg-yellow-400", "hover:bg-yellow-500", "focus:outline-none", "focus:ring-4", "focus:ring-yellow-300", "font-medium", "rounded-full", "text-center", "dark:focus:ring-yellow-900"]
            )
          }
        end
        # rubocop:enable Layout/LineLength, Metrics/MethodLength
      end
    end
  end
end
