# frozen_string_literal: true

module Flowbite
  module Input
    # https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-label
    class Label < ViewComponent::Base
      STATES = [
        DEFAULT = :default,
        DISABLED = :disabled,
        ERROR = :error
      ].freeze

      class << self
        def classes(state: :default, style: :default)
          style = styles.fetch(style)
          style.fetch(state)
        end

        def styles
          {
            default: Flowbite::Style.new(
              default: ["block", "mb-2.5", "text-sm", "font-medium", "text-heading"],
              disabled: ["block", "mb-2.5", "text-sm", "font-medium", "text-fg-disabled"],
              error: ["block", "mb-2.5", "text-sm", "font-medium", "text-fg-danger-strong"]
            )
          }.freeze
        end
      end

      def call
        if content?
          @form.label(@attribute, content, **options)
        else
          @form.label(@attribute, **options)
        end
      end

      def errors?
        @object.errors.include?(@attribute.intern)
      end

      def initialize(attribute:, form:, class: nil, disabled: false, options: {})
        @attribute = attribute
        @class = Array.wrap(binding.local_variable_get(:class))
        @disabled = disabled
        @form = form
        @object = form.object
        @options = options
      end

      # Returns an array with the CSS classes to apply to the label element
      def classes
        self.class.classes(state: state) + @class
      end

      protected

      def disabled?
        !!@disabled
      end

      # Returns the state of the label.
      #
      # See the STATES constant for valid values.
      #
      # @return [Symbol] the state of the label
      def state
        return DISABLED if disabled?
        return ERROR if errors?

        DEFAULT
      end

      private

      def options
        {
          class: classes
        }.merge(@options)
      end
    end
  end
end
