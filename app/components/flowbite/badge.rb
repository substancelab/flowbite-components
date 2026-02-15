# frozen_string_literal: true

module Flowbite
  # Renders a badge component for displaying labels, counts, or status
  # indicators.
  #
  # @example Basic usage
  #  <%= render(Flowbite::Badge.new) { "Default" } %>
  #
  # @example With border
  #  <%= render(Flowbite::Badge.new(bordered: true, style: :success)) { "Success" } %>
  #
  # @see https://flowbite.com/docs/components/badge/
  # @lookbook_embed BadgePreview
  class Badge < ViewComponent::Base
    SIZES = {
      default: ["text-xs", "font-medium", "px-1.5", "py-0.5"],
      lg: ["text-sm", "font-medium", "px-2", "py-1"]
    }.freeze

    BORDER_CLASSES = {
      alternative: ["border", "border-default"],
      brand: ["border", "border-brand-subtle"],
      danger: ["border", "border-danger-subtle"],
      gray: ["border", "border-default-medium"],
      success: ["border", "border-success-subtle"],
      warning: ["border", "border-warning-subtle"]
    }.freeze

    DOT_CLASSES = {
      alternative: ["h-1.5", "w-1.5", "bg-heading", "me-1", "rounded-full"],
      brand: ["h-1.5", "w-1.5", "bg-fg-brand-strong", "me-1", "rounded-full"],
      danger: ["h-1.5", "w-1.5", "bg-fg-danger-strong", "me-1", "rounded-full"],
      gray: ["h-1.5", "w-1.5", "bg-heading", "me-1", "rounded-full"],
      success: ["h-1.5", "w-1.5", "bg-fg-success-strong", "me-1", "rounded-full"],
      warning: ["h-1.5", "w-1.5", "bg-fg-warning", "me-1", "rounded-full"]
    }.freeze

    class << self
      # rubocop:disable Layout/LineLength
      def styles
        Flowbite::Styles.from_hash({
          alternative: {
            default: ["bg-neutral-primary-soft", "hover:bg-neutral-secondary-medium", "rounded", "text-heading"]
          },
          brand: {
            default: ["bg-brand-softer", "hover:bg-brand-soft", "rounded", "text-fg-brand-strong"]
          },
          danger: {
            default: ["bg-danger-soft", "hover:bg-danger-medium", "rounded", "text-fg-danger-strong"]
          },
          gray: {
            default: ["bg-neutral-secondary-medium", "hover:bg-neutral-tertiary-medium", "rounded", "text-heading"]
          },
          success: {
            default: ["bg-success-soft", "hover:bg-success-medium", "rounded", "text-fg-success-strong"]
          },
          warning: {
            default: ["bg-warning-soft", "hover:bg-warning-medium", "rounded", "text-fg-warning"]
          }
        }.freeze)
      end
      # rubocop:enable Layout/LineLength
    end

    attr_reader :options

    # @param bordered [Boolean] Whether to add a border to the badge.
    # @param class [String, Array<String>] Additional CSS classes.
    # @param dot [Boolean] Whether to show a dot indicator.
    # @param href [String] If provided, renders the badge as a link.
    # @param size [Symbol] The size of the badge (:default or :lg).
    # @param style [Symbol] The color style (:alternative, :brand, :danger,
    #   :gray, :success, :warning).
    def initialize(bordered: false, class: nil, dot: false, href: nil,
      size: :default, style: :brand, **options)
      @bordered = bordered
      @class = Array.wrap(binding.local_variable_get(:class))
      @dot = dot
      @href = href
      @size = size
      @style = style
      @options = options
    end

    def bordered?
      !!@bordered
    end

    def dot?
      !!@dot
    end

    def link?
      @href.present?
    end

    private

    def classes
      result = self.class.styles.fetch(@style).fetch(:default) + size_classes
      result += BORDER_CLASSES.fetch(@style) if bordered?
      result += ["inline-flex", "items-center"] if dot?
      result + @class
    end

    def dot_classes
      DOT_CLASSES.fetch(@style)
    end

    def size_classes
      SIZES.fetch(@size)
    end

    def tag_name
      link? ? :a : :span
    end

    def tag_options
      opts = {class: classes}
      opts[:href] = @href if link?
      opts.merge(options)
    end
  end
end
