# frozen_string_literal: true

module Flowbite
  # Renders a drawer, a panel sliding in from an edge of the screen.
  #
  # The block given to the drawer is used as its body.
  #
  # By default the drawer renders Flowbite's markup, translated off screen,
  # and leaves showing and hiding it up to you, ie by passing data attributes
  # to the drawer and its close button.
  #
  # With +behavior: :stimulus+ the drawer is shown and hidden like flowbite.js
  # does, using the +flowbite--drawer+ and +flowbite--drawer-trigger+
  # Stimulus controllers, which you install using
  #
  #   bin/rails generate flowbite_components:behavior drawer
  #
  # Elements outside the drawer show, hide, or toggle it using the data
  # attributes from Drawer.trigger_options. Elements inside the drawer hide
  # it using +data: {action: "flowbite--drawer#hide"}+. The drawer is also
  # hidden by pressing Escape or clicking the backdrop.
  #
  # @example Usage
  #  <%= render(Flowbite::Drawer.new(id: "info", title: "Info")) do %>
  #    <p>Supercharge your hiring by taking advantage of our limited-time sale.</p>
  #  <% end %>
  #
  # @example Using the bundled Stimulus controllers
  #  <%= render(Flowbite::Button.new(**Flowbite::Drawer.trigger_options("info"))) { "Show drawer" } %>
  #
  #  <%= render(Flowbite::Drawer.new(behavior: :stimulus, id: "info", placement: :right, title: "Info")) do %>
  #    <p>Supercharge your hiring by taking advantage of our limited-time sale.</p>
  #  <% end %>
  #
  # @see https://flowbite.com/docs/components/drawer/
  # @lookbook_embed DrawerPreview
  class Drawer < ViewComponent::Base
    # The behaviors supported by this component besides :none.
    BEHAVIORS = [:stimulus].freeze

    # The classes hiding the drawer off screen for each placement.
    HIDDEN_CLASSES = {
      bottom: ["translate-y-full"],
      left: ["-translate-x-full"],
      right: ["translate-x-full"],
      top: ["-translate-y-full"]
    }.freeze

    PLACEMENTS = {
      bottom: ["bottom-0", "left-0", "right-0", "w-full", "border-t"],
      left: ["top-0", "left-0", "h-screen", "w-96", "border-e"],
      right: ["top-0", "right-0", "h-screen", "w-96", "border-s"],
      top: ["top-0", "left-0", "right-0", "w-full", "border-b"]
    }.freeze

    # The classes showing the drawer, regardless of placement.
    SHOWN_CLASSES = ["transform-none"].freeze

    # The identifier of the Stimulus controller used with behavior: :stimulus.
    STIMULUS_CONTROLLER = "flowbite--drawer"

    class << self
      # Returns HTML options for an element outside the drawer that shows,
      # hides, or toggles a drawer rendered with behavior: :stimulus when
      # clicked.
      #
      # @example
      #   <%= render(Flowbite::Button.new(**Flowbite::Drawer.trigger_options("info", action: :show))) { "Show drawer" } %>
      #
      # @param action [Symbol] What to do with the drawer (:hide, :show,
      #   :toggle).
      # @param id [String] The id of the drawer.
      # @return [Hash] HTML options with the data attributes for the
      #   +flowbite--drawer-trigger+ Stimulus controller.
      def trigger_options(id, action: :toggle)
        Flowbite::Behavior.trigger_options(action: action, controller: STIMULUS_CONTROLLER, id: id)
      end
    end

    attr_reader :behavior, :id, :placement, :title

    # @param behavior [Symbol, nil] The client-side behavior to render markup
    #   for (:none, :stimulus). Use :stimulus to show and hide the drawer
    #   using the Stimulus controllers installed by
    #   +bin/rails generate flowbite_components:behavior drawer+. Defaults to
    #   Flowbite::Components.default_behavior. See Flowbite::Behavior.
    # @param class [String, Array<String>] Additional CSS classes for the
    #   drawer element.
    # @param close_button [Hash] Configuration for the close button. The hash
    #   can contain:
    #   - `options`: Additional HTML options to pass to the button element,
    #     e.g. `{data: {action: "drawer#close"}}`
    # @param icon [Boolean] Whether to show an info icon before the title
    #   (default: true).
    # @param id [String] The id of the drawer element, used to target it.
    # @param open [Boolean] Whether to render the drawer shown, the way
    #   flowbite.js leaves it after showing it (default: false). With
    #   behavior: :stimulus the controller adds the backdrop and can hide the
    #   drawer again.
    # @param options [Hash] Additional HTML options for the drawer element.
    # @param placement [Symbol] The edge of the screen the drawer slides in
    #   from (:bottom, :left, :right, :top).
    # @param title [String] The title shown in the drawer header.
    def initialize(id:, title:, behavior: nil, class: nil, close_button: {}, icon: true, open: false, placement: :left, **options)
      @behavior = Flowbite::Behavior.resolve(behavior, supported: BEHAVIORS)
      @class = Array.wrap(binding.local_variable_get(:class))
      @close_button = close_button
      @icon = icon
      @id = id
      @open = open
      @options = options
      @placement = placement
      @title = title
    end

    # @return [Hash] The HTML options for the close button.
    def close_button_options
      result = {
        aria: {controls: id},
        class: ["text-body", "bg-transparent", "hover:text-heading", "hover:bg-neutral-tertiary", "rounded-base", "w-9", "h-9", "absolute", "top-2.5", "end-2.5", "flex", "items-center", "justify-center"],
        type: "button"
      }.merge(@close_button[:options] || {})
      return result unless stimulus?

      Flowbite::Behavior.merge_data_tokens(result, action: "#{STIMULUS_CONTROLLER}#hide")
    end

    # @return [Hash] The HTML options for the drawer element.
    def drawer_options
      result = {
        aria: {labelledby: title_id},
        class: drawer_classes,
        id: id,
        tabindex: -1
      }
      if open?
        result[:aria][:modal] = true
        result[:role] = "dialog"
      end
      result.merge!(@options)
      return result unless stimulus?

      result = Flowbite::Behavior.merge_data_tokens(result, controller: STIMULUS_CONTROLLER)
      result[:data][:"#{STIMULUS_CONTROLLER}-placement-value"] ||= placement.to_s
      result
    end

    def icon?
      !!@icon
    end

    def open?
      !!@open
    end

    def stimulus?
      behavior == :stimulus
    end

    # @return [String] The id of the title element, labelling the drawer.
    def title_id
      "#{id}-label"
    end

    private

    def drawer_classes
      ["fixed", "z-40", "p-4", "overflow-y-auto", "transition-transform", "bg-neutral-primary-soft", "border-default"] +
        PLACEMENTS.fetch(placement) +
        (open? ? SHOWN_CLASSES : HIDDEN_CLASSES.fetch(placement)) +
        @class
    end
  end
end
