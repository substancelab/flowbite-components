# frozen_string_literal: true

module Flowbite
  # Renders a toast notification element.
  #
  # @example Usage
  #  <%= render(Flowbite::Toast.new(message: "Something has happened!")) %>
  #
  # @see https://flowbite.com/docs/components/toast/
  # @lookbook_embed ToastPreview
  class Toast < ViewComponent::Base
    class << self
      def classes
        ["flex", "items-center", "w-full", "max-w-xs", "p-4", "text-body", "bg-neutral-primary-soft", "rounded-base", "shadow-xs", "border", "border-default"]
      end
    end

    attr_reader :dismissible, :message, :options, :style

    # @param class [Array<String>] Additional CSS classes for the toast container.
    # @param dismissible [Boolean] Whether the toast can be dismissed (default: true).
    # @param message [String] The message to display in the toast.
    # @param options [Hash] Additional HTML options for the toast container.
    # @param style [Symbol] The color style of the toast (:default, :success, :danger, :warning).
    def initialize(message:, dismissible: true, style: :default, class: nil, **options)
      @message = message
      @style = style
      @dismissible = dismissible
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    def container_classes
      self.class.classes + @class
    end
  end
end
