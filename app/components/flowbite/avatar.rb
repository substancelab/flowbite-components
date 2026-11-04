# frozen_string_literal: true

module Flowbite
  # Renders an avatar representing a user.
  #
  # The avatar shows an image when +src+ is given. Without an image it falls
  # back to the given +initials+, and without initials it renders a
  # placeholder person icon.
  #
  # @example Image
  #  <%= render(Flowbite::Avatar.new(alt: "Jese Leos", src: user.avatar_url)) %>
  #
  # @example Initials with a rounded square shape
  #  <%= render(Flowbite::Avatar.new(initials: "JL", shape: :rounded)) %>
  #
  # @example Placeholder icon with a status dot
  #  <%= render(Flowbite::Avatar.new) do |avatar| %>
  #    <% avatar.with_bottom_dot(label: "Online", style: :success) %>
  #  <% end %>
  #
  # @viewcomponent_slot [Flowbite::Avatar::Dot] bottom_dot A status dot placed
  #   at the bottom of the avatar. Use +with_bottom_dot+ to add one.
  # @viewcomponent_slot [Flowbite::Avatar::Dot] top_dot A status dot placed at
  #   the top of the avatar. Use +with_top_dot+ to add one.
  #
  # @see https://flowbite.com/docs/components/avatar/
  # @lookbook_embed AvatarPreview
  class Avatar < ViewComponent::Base
    renders_one :bottom_dot, ->(**options) { Flowbite::Avatar::Dot.new(position: :bottom, size: size, **options) }
    renders_one :top_dot, ->(**options) { Flowbite::Avatar::Dot.new(position: :top, size: size, **options) }

    BORDERED_CLASSES = ["p-1", "ring-2", "ring-default"].freeze

    INITIALS_CLASSES = ["relative", "inline-flex", "items-center", "justify-center", "overflow-hidden", "bg-neutral-tertiary"].freeze

    PLACEHOLDER_CLASSES = ["relative", "overflow-hidden", "bg-neutral-secondary-medium"].freeze

    SIZES = {
      xs: ["w-4.5", "h-4.5"],
      sm: ["w-6", "h-6"],
      base: ["w-8", "h-8"],
      default: ["w-10", "h-10"],
      lg: ["w-11", "h-11"],
      xl: ["w-14", "h-14"],
      "2xl": ["w-16", "h-16"]
    }.freeze

    class << self
      def classes(bordered: false, shape: :circle, size: :default)
        result = sizes.fetch(size) + shape_classes(shape: shape, size: size)
        result += BORDERED_CLASSES if bordered
        result
      end

      # @return [Array<String>] The classes defining the corners of the
      #   avatar. Small rounded avatars get smaller corners.
      def shape_classes(shape: :circle, size: :default)
        case shape
        when :circle then ["rounded-full"]
        when :rounded then [:xs, :sm].include?(size) ? ["rounded-sm"] : ["rounded-base"]
        else raise ArgumentError, "Unknown shape: #{shape}. Available shapes: circle, rounded"
        end
      end

      def sizes
        SIZES
      end
    end

    attr_reader :alt, :initials, :options, :size, :src

    # @param alt [String] Alternative text for the image. Defaults to an
    #   empty string, marking the image as decorative.
    # @param bordered [Boolean] Whether to add a ring around the avatar.
    # @param class [String, Array<String>] Additional CSS classes for the
    #   avatar element.
    # @param initials [String] Initials to show when there is no image.
    # @param options [Hash] Additional HTML options for the avatar element.
    # @param shape [Symbol] The shape of the avatar (:circle, :rounded).
    # @param size [Symbol] The size of the avatar (:xs, :sm, :base, :default,
    #   :lg, :xl, :"2xl").
    # @param src [String] The URL of the avatar image. When blank, the avatar
    #   falls back to initials or a placeholder icon.
    def initialize(alt: nil, bordered: false, class: nil, initials: nil, shape: :circle, size: :default, src: nil, **options)
      @alt = alt.to_s
      @bordered = bordered
      @class = Array.wrap(binding.local_variable_get(:class))
      @initials = initials
      @shape = shape
      @size = size
      @src = src
      @options = options
    end

    def bordered?
      !!@bordered
    end

    def dot?
      top_dot? || bottom_dot?
    end

    def image?
      @src.present?
    end

    # @return [Array<String>] The classes for the image element.
    def image_classes
      classes + @class
    end

    def initials?
      @initials.present?
    end

    # @return [Array<String>] The classes for the initials container.
    def initials_classes
      INITIALS_CLASSES + classes + @class
    end

    # @return [Array<String>] The classes for the placeholder icon container.
    def placeholder_classes
      PLACEHOLDER_CLASSES + classes + @class
    end

    private

    def classes
      self.class.classes(bordered: bordered?, shape: @shape, size: @size)
    end
  end
end
