# frozen_string_literal: true

module Flowbite
  class Button
    class Outline < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength, Metrics/MethodLength
        def styles
          Flowbite::Styles.from_hash({
            danger: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            dark: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            default: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            secondary: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            success: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            tertiary: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            },
            warning: {
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            }
          }.freeze)
        end
        # rubocop:enable Layout/LineLength, Metrics/MethodLength
      end
    end
  end
end
