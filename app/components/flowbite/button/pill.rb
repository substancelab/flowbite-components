# frozen_string_literal: true

module Flowbite
  class Button
    class Pill < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength, Metrics/MethodLength
        def styles
          Flowbite::Styles.from_hash({
            danger: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            dark: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            default: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            ghost: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            secondary: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            success: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            tertiary: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            },
            warning: {
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            }
          }.freeze)
        end
        # rubocop:enable Layout/LineLength, Metrics/MethodLength
      end
    end
  end
end
