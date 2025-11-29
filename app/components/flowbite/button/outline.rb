# frozen_string_literal: true

module Flowbite
  class Button
    class Outline < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength, Metrics/MethodLength
        def styles
          {
            danger: Flowbite::Style.new(
              default: ["focus:outline-none", "text-danger", "bg-transparent", "box-border", "border", "border-danger", "hover:text-white", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            dark: Flowbite::Style.new(
              default: ["focus:outline-none", "text-dark", "bg-transparent", "box-border", "border", "border-dark", "hover:text-white", "hover:bg-dark-strong", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            default: Flowbite::Style.new(
              default: ["focus:outline-none", "text-brand", "bg-transparent", "box-border", "border", "border-brand", "hover:text-white", "hover:bg-brand-strong", "focus:ring-4", "focus:ring-brand-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            secondary: Flowbite::Style.new(
              default: ["focus:outline-none", "text-body", "bg-transparent", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            success: Flowbite::Style.new(
              default: ["focus:outline-none", "text-success", "bg-transparent", "box-border", "border", "border-success", "hover:text-white", "hover:bg-success-strong", "focus:ring-4", "focus:ring-success-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            tertiary: Flowbite::Style.new(
              default: ["focus:outline-none", "text-body", "bg-transparent", "box-border", "border", "border-default", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary-soft", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            ),
            warning: Flowbite::Style.new(
              default: ["focus:outline-none", "text-warning", "bg-transparent", "box-border", "border", "border-warning", "hover:text-white", "hover:bg-warning-strong", "focus:ring-4", "focus:ring-warning-medium", "shadow-xs", "font-medium", "leading-5", "rounded-base", "text-center", "me-2", "mb-2"]
            )
          }
        end
        # rubocop:enable Layout/LineLength, Metrics/MethodLength
      end
    end
  end
end
