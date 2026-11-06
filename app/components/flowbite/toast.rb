# frozen_string_literal: true

module Flowbite
  # Renders a toast notification element.
  #
  # By default the toast renders Flowbite's markup and leaves dismissing it
  # up to you, ie by passing data attributes to the close button.
  #
  # With +behavior: :stimulus+ the close button dismisses the toast like
  # flowbite.js does: the toast fades out and is then hidden. This requires
  # the +flowbite--toast+ Stimulus controller, which you install using
  #
  #   bin/rails generate flowbite_components:behavior toast
  #
  # and its dependency, stimulus-use. The controller dispatches a
  # +flowbite--toast:hide+ event when the toast starts hiding. Customize the
  # transition using the +leave-active+, +leave-from+, and +leave-to+
  # Stimulus classes, ie
  # +data: {"flowbite--toast-leave-active-class": "transition-opacity duration-500"}+.
  #
  # @example Usage
  #  <%= render(Flowbite::Toast.new(message: "Something has happened!")) %>
  #
  # @example Passing options to the default button
  #  <%= render(Flowbite::Toast.new(
  #    button: {options: {data: {action: "toast#dismiss"}}},
  #    message: "Something has happened!"
  #  )) %>
  #
  # @example Dismissing using the bundled Stimulus controller
  #  <%= render(Flowbite::Toast.new(
  #    behavior: :stimulus,
  #    message: "Something has happened!"
  #  )) %>
  #
  # @example Using the button slot
  #  <%= render(Flowbite::Toast.new(message: "Something has happened!")) do |toast| %>
  #    <% toast.with_button do %>
  #      <%= render(Flowbite::Toast::CloseButton.new(data: {action: "toast#dismiss"})) %>
  #    <% end %>
  #  <% end %>
  #
  # @viewcomponent_slot [Flowbite::Toast::CloseButton] button The button
  #   rendered at the end of the toast. Defaults to a close button. Use
  #   +with_button+ to set custom content.
  #
  # @see https://flowbite.com/docs/components/toast/
  # @lookbook_embed ToastPreview
  class Toast < ViewComponent::Base
    renders_one :button

    class << self
      def classes
        ["flex", "items-center", "w-full", "max-w-xs", "p-4", "text-body", "bg-neutral-primary-soft", "rounded-base", "shadow-xs", "border", "border-default"]
      end
    end

    # The behaviors supported by this component besides :none.
    BEHAVIORS = [:stimulus].freeze

    # The identifier of the Stimulus controller used with behavior: :stimulus.
    STIMULUS_CONTROLLER = "flowbite--toast"

    attr_reader :behavior, :dismissible, :message, :style

    # @param behavior [Symbol, nil] The client-side behavior to render markup
    #   for (:none, :stimulus). Use :stimulus to dismiss the toast using the
    #   Stimulus controller installed by
    #   +bin/rails generate flowbite_components:behavior toast+. Defaults to
    #   Flowbite::Components.default_behavior. See Flowbite::Behavior.
    # @param button [Hash] Configuration for the default button, rendered
    #   using the Toast::CloseButton component. The hash can contain:
    #   - `options`: Additional HTML options to pass to the button element,
    #     e.g. `{data: {action: "toast#dismiss"}}`
    #   Alternatively, you can use the `button` slot to provide the entire
    #   button element yourself.
    # @param class [Array<String>] Additional CSS classes for the toast container.
    # @param dismissible [Boolean] Whether the toast can be dismissed (default: true).
    # @param message [String] The message to display in the toast.
    # @param options [Hash] Additional HTML options for the toast container.
    # @param style [Symbol] The color style of the toast (:default, :success, :danger, :warning).
    def initialize(message:, behavior: nil, button: {}, dismissible: true, style: :default, class: nil, **options)
      @behavior = Flowbite::Behavior.resolve(behavior, supported: BEHAVIORS)
      @button = button
      @message = message
      @style = style
      @dismissible = dismissible
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    def container_classes
      self.class.classes + @class
    end

    # @return [Hash] The HTML options for the toast container
    def options
      return @options unless stimulus?

      Flowbite::Behavior.merge_data_tokens(@options, controller: STIMULUS_CONTROLLER)
    end

    def stimulus?
      behavior == :stimulus
    end

    protected

    # Returns the HTML to use for the button, unless the button slot is used
    def default_button
      render(Flowbite::Toast::CloseButton.new(**default_button_options))
    end

    # @return [Hash] The options to pass to the default button component
    def default_button_options
      button_options = @button[:options] || {}
      return button_options unless stimulus?

      Flowbite::Behavior.merge_data_tokens(button_options, action: "#{STIMULUS_CONTROLLER}#dismiss")
    end
  end
end
