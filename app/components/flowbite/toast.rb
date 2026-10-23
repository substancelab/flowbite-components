# frozen_string_literal: true

module Flowbite
  # Renders a toast notification element.
  #
  # @example Usage
  #  <%= render(Flowbite::Toast.new(message: "Something has happened!")) %>
  #
  # @example Passing options to the close button
  #  <%= render(Flowbite::Toast.new(
  #    close_button: {options: {data: {action: "toast#dismiss"}}},
  #    message: "Something has happened!"
  #  )) %>
  #
  # @example Using the close_button slot
  #  <%= render(Flowbite::Toast.new(message: "Something has happened!")) do |toast| %>
  #    <% toast.with_close_button do %>
  #      <%= render(Flowbite::Toast::CloseButton.new(data: {action: "toast#dismiss"})) %>
  #    <% end %>
  #  <% end %>
  #
  # @viewcomponent_slot [Flowbite::Toast::CloseButton] close_button The
  #   button that dismisses the toast. Use +with_close_button+ to set custom
  #   content.
  #
  # @see https://flowbite.com/docs/components/toast/
  # @lookbook_embed ToastPreview
  class Toast < ViewComponent::Base
    renders_one :close_button

    class << self
      def classes
        ["flex", "items-center", "w-full", "max-w-xs", "p-4", "text-body", "bg-neutral-primary-soft", "rounded-base", "shadow-xs", "border", "border-default"]
      end
    end

    attr_reader :dismissible, :message, :options, :style

    # @param class [Array<String>] Additional CSS classes for the toast container.
    # @param close_button [Hash] Configuration for the default close button,
    #   rendered using the Toast::CloseButton component. The hash can contain:
    #   - `options`: Additional HTML options to pass to the button element,
    #     e.g. `{data: {action: "toast#dismiss"}}`
    #   Alternatively, you can use the `close_button` slot to provide the
    #   entire button element yourself.
    # @param dismissible [Boolean] Whether the toast can be dismissed (default: true).
    # @param message [String] The message to display in the toast.
    # @param options [Hash] Additional HTML options for the toast container.
    # @param style [Symbol] The color style of the toast (:default, :success, :danger, :warning).
    def initialize(message:, close_button: {}, dismissible: true, style: :default, class: nil, **options)
      @close_button = close_button
      @message = message
      @style = style
      @dismissible = dismissible
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    def container_classes
      self.class.classes + @class
    end

    protected

    # Returns the HTML to use for the close button, unless the close_button
    # slot is used
    def default_close_button
      render(Flowbite::Toast::CloseButton.new(**default_close_button_options))
    end

    # @return [Hash] The options to pass to the default close button component
    def default_close_button_options
      @close_button[:options] || {}
    end
  end
end
