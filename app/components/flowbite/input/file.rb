# frozen_string_literal: true

module Flowbite
  module Input
    class File < Field
      SIZES = {
        sm: ["text-sm"],
        default: ["text-sm"],
        lg: ["text-base"]
      }.freeze

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :file_field
      end

      # rubocop:disable Layout/LineLength
      def self.styles
        {
          default: Flowbite::Style.new(
            default: ["block", "w-full", "text-heading", "border", "border-default-medium", "rounded-base", "cursor-pointer", "bg-neutral-secondary-medium", "focus:outline-none"],
            disabled: ["block", "w-full", "text-fg-disabled", "border", "border-default-medium", "rounded-base", "cursor-not-allowed", "bg-neutral-secondary-medium"],
            error: ["block", "w-full", "text-fg-danger-strong", "border", "border-danger-subtle", "rounded-base", "cursor-pointer", "bg-danger-soft", "focus:outline-none"]
          )
        }.freeze
      end
      # rubocop:enable Layout/LineLength
    end
  end
end
