# frozen_string_literal: true

module Flowbite
  class Avatar
    # Renders a status dot indicator positioned on top of an avatar.
    #
    # The dot must be rendered inside a relatively positioned container
    # together with the avatar.
    #
    # @example Usage
    #  <div class="relative">
    #    <%= render(Flowbite::Avatar.new(src: user.avatar_url)) %>
    #    <%= render(Flowbite::Avatar::Dot.new(position: :bottom, style: :success)) %>
    #  </div>
    #
    # @see https://flowbite.com/docs/components/avatar/
    class Dot < ViewComponent::Base
      POSITIONS = {
        bottom: ["bottom-0"],
        top: ["top-0"]
      }.freeze

      # Horizontal offsets placing the dot at the right edge of an avatar of
      # the given size.
      SIZES = {
        xs: ["left-1.5"],
        sm: ["left-3"],
        base: ["left-5"],
        default: ["left-7"],
        lg: ["left-8"],
        xl: ["left-11"],
        "2xl": ["left-13"]
      }.freeze

      class << self
        def classes(position: :top, size: :default, style: :success)
          POSITIONS.fetch(position) + sizes.fetch(size) +
            ["absolute", "w-3.5", "h-3.5"] +
            styles.fetch(style).fetch(:default) +
            ["border-2", "border-buffer", "rounded-full"]
        end

        def sizes
          SIZES
        end

        def styles
          Flowbite::Styles.from_hash(
            {
              danger: {default: ["bg-danger"]},
              success: {default: ["bg-success"]}
            }.freeze
          )
        end
      end

      attr_reader :position, :size, :style

      # @param position [Symbol] Where to place the dot (:bottom, :top).
      # @param size [Symbol] The size of the avatar the dot is placed on.
      # @param style [Symbol] The color of the dot (:danger, :success).
      def initialize(position: :top, size: :default, style: :success)
        @position = position
        @size = size
        @style = style
      end

      def call
        content_tag(:span, nil, class: self.class.classes(position: position, size: size, style: style))
      end
    end
  end
end
