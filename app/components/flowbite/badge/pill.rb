# frozen_string_literal: true

module Flowbite
  class Badge
    # Renders a pill-shaped badge with fully rounded corners.
    #
    # @example Basic usage
    #  <%= render(Flowbite::Badge::Pill.new) { "Default" } %>
    #
    # @see https://flowbite.com/docs/components/badge/
    class Pill < Flowbite::Badge
      class << self
        # rubocop:disable Layout/LineLength
        def styles
          Flowbite::Styles.from_hash({
            alternative: {
              default: ["bg-neutral-primary-soft", "hover:bg-neutral-secondary-medium", "rounded-full", "text-heading"]
            },
            brand: {
              default: ["bg-brand-softer", "hover:bg-brand-soft", "rounded-full", "text-fg-brand-strong"]
            },
            danger: {
              default: ["bg-danger-soft", "hover:bg-danger-medium", "rounded-full", "text-fg-danger-strong"]
            },
            gray: {
              default: ["bg-neutral-secondary-medium", "hover:bg-neutral-tertiary-medium", "rounded-full", "text-heading"]
            },
            success: {
              default: ["bg-success-soft", "hover:bg-success-medium", "rounded-full", "text-fg-success-strong"]
            },
            warning: {
              default: ["bg-warning-soft", "hover:bg-warning-medium", "rounded-full", "text-fg-warning"]
            }
          }.freeze)
        end
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
