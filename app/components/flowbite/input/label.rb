# frozen_string_literal: true

module Flowbite
  module Input
    class Label < ViewComponent::Base
      STATES = [
        DEFAULT = :default,
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
              default: ["block", "mb-2", "text-sm", "font-medium", "text-gray-900", "dark:text-white"],
              error: ["block", "mb-2", "text-sm", "font-medium", "text-red-700", "dark:text-red-500"]
            )
          }.freeze
        end
      end

      def call
        @form.label(
          @attribute,
          class: classes
        )
      end

      def errors?
        @object.errors.include?(@attribute.intern)
      end

      def initialize(form, attribute)
        super
        @attribute = attribute
        @form = form
        @object = form.object
      end

      # Returns an array with the CSS classes to apply to the label element
      def classes
        self.class.classes(state: state)
      end

      protected

      # Returns the state of the label.
      #
      # See the STATES constant for valid values.
      #
      # @return [Symbol] the state of the label
      def state
        if errors?
          ERROR
        else
          DEFAULT
        end
      end
    end
  end
end
