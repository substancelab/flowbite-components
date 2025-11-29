# frozen_string_literal: true

module Flowbite
  class Button
    class Pill < Flowbite::Button
      class << self
        # rubocop:disable Layout/LineLength, Metrics/MethodLength
        def styles
          {
            danger: Flowbite::Style.new(
              default: ["focus:outline-none", "text-white", "bg-danger", "box-border", "border", "border-transparent", "hover:bg-danger-strong", "focus:ring-4", "focus:ring-danger-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            dark: Flowbite::Style.new(
              default: ["focus:outline-none", "text-white", "bg-dark", "box-border", "border", "border-transparent", "hover:bg-dark-strong", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            default: Flowbite::Style.new(
              default: ["focus:outline-none", "text-white", "bg-brand", "box-border", "border", "border-transparent", "hover:bg-brand-strong", "focus:ring-4", "focus:ring-brand-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            ghost: Flowbite::Style.new(
              default: ["focus:outline-none", "text-heading", "bg-transparent", "box-border", "border", "border-transparent", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            secondary: Flowbite::Style.new(
              default: ["focus:outline-none", "text-body", "bg-neutral-secondary-medium", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            success: Flowbite::Style.new(
              default: ["focus:outline-none", "text-white", "bg-success", "box-border", "border", "border-transparent", "hover:bg-success-strong", "focus:ring-4", "focus:ring-success-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            tertiary: Flowbite::Style.new(
              default: ["focus:outline-none", "text-body", "bg-neutral-primary-soft", "box-border", "border", "border-default", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary-soft", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            ),
            warning: Flowbite::Style.new(
              default: ["focus:outline-none", "text-white", "bg-warning", "box-border", "border", "border-transparent", "hover:bg-warning-strong", "focus:ring-4", "focus:ring-warning-medium", "shadow-xs", "font-medium", "leading-5", "rounded-full", "text-center"]
            )
          }
        end
        # rubocop:enable Layout/LineLength, Metrics/MethodLength
      end
    end
  end
end
