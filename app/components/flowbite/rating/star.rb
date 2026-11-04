# frozen_string_literal: true

module Flowbite
  class Rating
    # Renders a single star of a rating.
    #
    # @param filled [Boolean] Whether the star is filled (default: true).
    # @param size [Symbol] The size of the star (:default, :md, :lg).
    #
    # @see https://flowbite.com/docs/components/rating/
    class Star < ViewComponent::Base
      SIZES = {
        default: ["w-5", "h-5"],
        md: ["w-6", "h-6"],
        lg: ["w-7", "h-7"]
      }.freeze

      class << self
        def classes(size: :default, state: :filled, style: :default)
          sizes.fetch(size) + styles.fetch(style).fetch(state)
        end

        def sizes
          SIZES
        end

        def styles
          Flowbite::Styles.from_hash(
            {
              default: {
                empty: ["text-fg-disabled"],
                filled: ["text-fg-yellow"]
              }
            }.freeze
          )
        end
      end

      attr_reader :size

      def initialize(filled: true, size: :default)
        @filled = filled
        @size = size
      end

      def classes
        self.class.classes(size: size, state: state)
      end

      def filled?
        !!@filled
      end

      def state
        filled? ? :filled : :empty
      end
    end
  end
end
