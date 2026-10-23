# frozen_string_literal: true

module Flowbite
  class Toast
    # Renders the close button of a toast notification.
    #
    # @param options [Hash] Additional HTML options for the button element.
    #   These are merged over the default options.
    class CloseButton < ViewComponent::Base
      class << self
        # Styles from https://flowbite.com/docs/components/toast/#default-toast
        # rubocop:disable Layout/LineLength
        def classes
          ["ms-auto", "flex", "items-center", "justify-center", "text-body", "hover:text-heading", "bg-transparent", "box-border", "border", "border-transparent", "hover:bg-neutral-secondary-medium", "focus:ring-4", "focus:ring-neutral-tertiary", "font-medium", "leading-5", "rounded", "text-sm", "h-8", "w-8", "focus:outline-none"]
        end
        # rubocop:enable Layout/LineLength
      end

      def initialize(**options)
        @options = options || {}
      end

      def button_options
        {
          aria: {label: "Close"},
          class: self.class.classes,
          type: "button"
        }.merge(@options)
      end
    end
  end
end
