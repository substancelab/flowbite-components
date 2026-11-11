# frozen_string_literal: true

module Flowbite
  # Resolves which client-side behavior a component renders markup for.
  #
  # By default components render Flowbite's own markup and leave the behavior
  # up to you (+:none+), so you can use whichever JavaScript library you
  # prefer. Opting into a behavior changes the rendered markup:
  #
  # - +:stimulus+ adds data attributes for the Stimulus controllers installed
  #   using +bin/rails generate flowbite_components:behavior+.
  #
  # Opt in per component using the +behavior+ argument, or set a default for
  # all components using +Flowbite::Components.default_behavior+.
  module Behavior
    # Renders Flowbite's own markup without any behavior.
    NONE = :none

    class << self
      # Merges space separated tokens, like Stimulus controllers and actions,
      # into the data attributes in options, keeping any existing tokens and
      # skipping tokens that are already present.
      # Existing tokens given as flat attributes, like +"data-controller"+, or
      # in a String keyed +"data"+ Hash are moved into the +data+ Hash to avoid
      # rendering duplicate attributes.
      #
      # @param options [Hash] HTML options, possibly with a +data+ Hash.
      # @param tokens [Hash] The data attributes to add tokens to.
      # @return [Hash] A copy of options with the tokens added.
      def merge_data_tokens(options, **tokens)
        options = options.dup
        data = (options.delete("data") || {}).merge(options.delete(:data) || {}).symbolize_keys
        tokens.each do |key, value|
          flat = [options.delete(:"data-#{key}"), options.delete("data-#{key}")]
          data[key] = [data[key], *flat, value].flat_map { |list| list.to_s.split }.uniq.join(" ")
        end
        options.merge(data: data)
      end

      # @param behavior [Symbol, String, nil] The requested behavior, or nil to
      #   use Flowbite::Components.default_behavior.
      # @param supported [Array<Symbol>] The behaviors the component supports
      #   besides +:none+.
      # @return [Symbol] The behavior to render markup for. +:none+ when using
      #   the default behavior and the component doesn't support it.
      # @raise [ArgumentError] If behavior is explicitly requested, but isn't
      #   supported by the component.
      def resolve(behavior, supported:)
        if behavior.nil?
          default = Flowbite::Components.default_behavior&.to_sym
          return supported.include?(default) ? default : NONE
        end
        behavior = behavior.to_sym
        return behavior if behavior == NONE || supported.include?(behavior)

        raise ArgumentError,
          "Unsupported behavior #{behavior.inspect}, expected one of " \
          "#{([NONE] + supported).inspect}"
      end
    end
  end
end
