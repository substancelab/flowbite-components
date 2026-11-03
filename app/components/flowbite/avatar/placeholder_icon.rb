# frozen_string_literal: true

module Flowbite
  class Avatar
    # Renders the person icon shown in an avatar without an image or
    # initials.
    #
    # @see https://flowbite.com/docs/components/avatar/
    class PlaceholderIcon < ViewComponent::Base
      # The icon is slightly larger than the avatar and offset to the left,
      # so the person is centered and cropped by the container.
      SIZES = {
        xs: ["w-5.5", "h-5.5", "-left-0.5"],
        sm: ["w-7", "h-7", "-left-0.5"],
        base: ["w-10", "h-10", "-left-1"],
        default: ["w-12", "h-12", "-left-1"],
        lg: ["w-13", "h-13", "-left-1"],
        xl: ["w-17", "h-17", "-left-1.5"],
        "2xl": ["w-19", "h-19", "-left-1.5"]
      }.freeze

      class << self
        def classes(size: :default)
          ["absolute"] + sizes.fetch(size) + ["text-body-subtle"]
        end

        def sizes
          SIZES
        end
      end

      attr_reader :size

      # @param size [Symbol] The size of the avatar the icon is placed in.
      def initialize(size: :default)
        @size = size
      end

      def classes
        self.class.classes(size: size)
      end
    end
  end
end
