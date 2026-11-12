# frozen_string_literal: true

module Flowbite
  # Renders a modal dialog.
  #
  # The block given to the modal is used as its body.
  #
  # By default the modal renders Flowbite's markup, hidden, and leaves showing
  # and hiding it up to you, ie by passing data attributes to the modal and
  # its close button.
  #
  # With +behavior: :stimulus+ the modal is shown and hidden like flowbite.js
  # does, using the +flowbite--modal+ and +flowbite--modal-trigger+ Stimulus
  # controllers, which you install using
  #
  #   bin/rails generate flowbite_components:behavior modal
  #
  # Elements outside the modal show, hide, or toggle it using the data
  # attributes from Modal.trigger_options. Elements inside the modal hide it
  # using +data: {action: "flowbite--modal#hide"}+. The modal is also hidden
  # by pressing Escape or clicking outside of it.
  #
  # @example Usage
  #  <%= render(Flowbite::Modal.new(id: "terms", title: "Terms of Service")) do %>
  #    <p>With less than a month to go...</p>
  #  <% end %>
  #
  # @example Using the bundled Stimulus controllers
  #  <%= render(Flowbite::Button.new(**Flowbite::Modal.trigger_options("terms"))) { "Show terms" } %>
  #
  #  <%= render(Flowbite::Modal.new(behavior: :stimulus, id: "terms", title: "Terms of Service")) do |modal| %>
  #    <% modal.with_footer do %>
  #      <%= render(Flowbite::Button.new(data: {action: "flowbite--modal#hide"})) { "I accept" } %>
  #    <% end %>
  #    <p>With less than a month to go...</p>
  #  <% end %>
  #
  # @viewcomponent_slot footer Content rendered at the bottom of the modal,
  #   typically action buttons.
  #
  # @see https://flowbite.com/docs/components/modal/
  # @lookbook_embed ModalPreview
  class Modal < ViewComponent::Base
    renders_one :footer

    # The behaviors supported by this component besides :none.
    BEHAVIORS = [:stimulus].freeze

    SIZES = {
      sm: "max-w-md",
      default: "max-w-2xl",
      lg: "max-w-4xl",
      xl: "max-w-7xl"
    }.freeze

    # The identifier of the Stimulus controller used with behavior: :stimulus.
    STIMULUS_CONTROLLER = "flowbite--modal"

    # The identifier of the Stimulus controller for elements showing, hiding,
    # or toggling the modal from outside.
    STIMULUS_TRIGGER_CONTROLLER = "flowbite--modal-trigger"

    TRIGGER_ACTIONS = [:hide, :show, :toggle].freeze

    class << self
      # Returns HTML options for an element outside the modal that shows,
      # hides, or toggles a modal rendered with behavior: :stimulus when
      # clicked.
      #
      # @example
      #   <%= render(Flowbite::Button.new(**Flowbite::Modal.trigger_options("terms", action: :show))) { "Show terms" } %>
      #
      # @param action [Symbol] What to do with the modal (:hide, :show,
      #   :toggle).
      # @param id [String] The id of the modal.
      # @return [Hash] HTML options with the data attributes for the
      #   +flowbite--modal-trigger+ Stimulus controller.
      def trigger_options(id, action: :toggle)
        unless TRIGGER_ACTIONS.include?(action)
          raise ArgumentError, "Unsupported action #{action.inspect}, expected one of #{TRIGGER_ACTIONS.inspect}"
        end

        {
          data: {
            action: "#{STIMULUS_TRIGGER_CONTROLLER}##{action}",
            controller: STIMULUS_TRIGGER_CONTROLLER,
            "#{STIMULUS_TRIGGER_CONTROLLER}-#{STIMULUS_CONTROLLER}-outlet": Flowbite::Behavior.id_selector(id)
          }
        }
      end
    end

    attr_reader :behavior, :id, :size, :title

    # @param behavior [Symbol, nil] The client-side behavior to render markup
    #   for (:none, :stimulus). Use :stimulus to show and hide the modal using
    #   the Stimulus controllers installed by
    #   +bin/rails generate flowbite_components:behavior modal+. Defaults to
    #   Flowbite::Components.default_behavior. See Flowbite::Behavior.
    # @param class [String, Array<String>] Additional CSS classes for the
    #   modal element.
    # @param close_button [Hash] Configuration for the close button in the
    #   header. The hash can contain:
    #   - `options`: Additional HTML options to pass to the button element,
    #     e.g. `{data: {action: "modal#close"}}`
    # @param id [String] The id of the modal element, used to target it.
    # @param options [Hash] Additional HTML options for the modal element.
    # @param size [Symbol] The maximum width of the modal (:sm, :default, :lg,
    #   :xl).
    # @param title [String] The title shown in the modal header.
    def initialize(id:, title:, behavior: nil, class: nil, close_button: {}, size: :default, **options)
      @behavior = Flowbite::Behavior.resolve(behavior, supported: BEHAVIORS)
      @class = Array.wrap(binding.local_variable_get(:class))
      @close_button = close_button
      @id = id
      @options = options
      @size = size
      @title = title
    end

    # @return [Hash] The HTML options for the close button in the header.
    def close_button_options
      result = {
        class: ["text-body", "bg-transparent", "hover:bg-neutral-tertiary", "hover:text-heading", "rounded-base", "text-sm", "w-9", "h-9", "ms-auto", "inline-flex", "justify-center", "items-center"],
        type: "button"
      }.deep_merge(@close_button[:options] || {})
      return result unless stimulus?

      Flowbite::Behavior.merge_data_tokens(result, action: "#{STIMULUS_CONTROLLER}#hide")
    end

    # @return [Array<String>] The CSS classes for the element limiting the
    #   width of the modal.
    def inner_classes
      ["relative", "p-4", "w-full", SIZES.fetch(size), "max-h-full"]
    end

    # @return [Hash] The HTML options for the modal element.
    def modal_options
      result = {
        aria: {hidden: true, labelledby: title_id},
        class: modal_classes,
        id: id,
        tabindex: -1
      }.deep_merge(@options)
      return result unless stimulus?

      Flowbite::Behavior.merge_data_tokens(result, controller: STIMULUS_CONTROLLER)
    end

    def stimulus?
      behavior == :stimulus
    end

    # @return [String] The id of the title element, labelling the modal.
    def title_id
      "#{id}-label"
    end

    private

    def modal_classes
      ["hidden", "overflow-y-auto", "overflow-x-hidden", "fixed", "top-0", "right-0", "left-0", "z-50", "justify-center", "items-center", "w-full", "md:inset-0", "h-[calc(100%-1rem)]", "max-h-full"] + @class
    end
  end
end
