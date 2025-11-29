# frozen_string_literal: true

module Flowbite
  module Input
    # The indivdual input component for use in forms without labels or error
    # messages.
    #
    # Use this when you want to render an input field on its own without any
    # surrounding elements, ie as a building block in more complex input
    # components.
    #
    # To render a complete input field with labels and error messages, use
    # `Flowbite::InputField` instead.
    class Field < ViewComponent::Base
      SIZES = {
        sm: ["px-2.5", "py-2", "text-sm"],
        default: ["px-3", "py-2.5", "text-sm"],
        lg: ["px-3.5", "py-3", "text-base"]
      }.freeze

      STATES = [
        DEFAULT = :default,
        DISABLED = :disabled,
        ERROR = :error
      ].freeze

      attr_reader :options, :size, :style

      class << self
        def classes(size: :default, state: :default, style: :default)
          style = styles.fetch(style)
          state_classes = style.fetch(state)
          state_classes + sizes.fetch(size)
        end

        # Returns the sizes this Field supports.
        #
        # This is effectively the SIZES constant, but provided as a method to
        # return the constant from the current class, not the superclass.
        #
        # @return [Hash] A hash mapping size names to their corresponding CSS
        # classes.
        def sizes
          const_get(:SIZES)
        end

        # rubocop:disable Layout/LineLength
        def styles
          {
            default: Flowbite::Style.new(
              default: ["bg-neutral-secondary-medium", "border", "border-default-medium", "text-heading", "rounded-base", "focus:ring-brand", "focus:border-brand", "block", "w-full", "shadow-xs", "placeholder:text-body"],
              disabled: ["bg-neutral-secondary-medium", "border", "border-default-medium", "text-fg-disabled", "rounded-base", "focus:ring-brand", "focus:border-brand", "block", "w-full", "shadow-xs", "cursor-not-allowed", "placeholder:text-fg-disabled"],
              error: ["bg-danger-soft", "border", "border-danger-subtle", "text-fg-danger-strong", "rounded-base", "focus:ring-danger", "focus:border-danger", "block", "w-full", "shadow-xs", "placeholder:text-fg-danger-strong"]
            )
          }.freeze
        end
        # rubocop:enable Layout/LineLength
      end

      def initialize(attribute:, form:, class: nil, disabled: false, options: {}, size: :default)
        @attribute = attribute
        @class = Array.wrap(binding.local_variable_get(:class))
        @disabled = disabled
        @form = form
        @options = options || {}
        @object = form.object
        @size = size
      end

      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          **input_options
        )
      end

      # Returns the CSS classes to apply to the input field
      def classes
        self.class.classes(size: size, state: state) + @class
      end

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :text_field
      end

      protected

      # Returns true if the field is disabled
      def disabled?
        !!@disabled
      end

      def errors?
        @object.errors.include?(@attribute.intern)
      end

      private

      # Returns the options argument for the input field
      def input_options
        {
          class: classes,
          disabled: disabled?
        }.merge(options)
      end

      def state
        return DISABLED if disabled?
        return ERROR if errors?

        DEFAULT
      end
    end
  end
end
