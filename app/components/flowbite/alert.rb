# frozen_string_literal: true

module Flowbite
  # Renders an alert element for showing feedback messages to the user.
  #
  # The block given to the alert is used as its message.
  #
  # @example Usage
  #  <%= render(Flowbite::Alert.new) { "Something has happened!" } %>
  #
  # @example With title and style
  #  <%= render(Flowbite::Alert.new(style: :danger, title: "Danger alert!")) do %>
  #    Change a few things up and try submitting again.
  #  <% end %>
  #
  # @example With a list
  #  <%= render(Flowbite::Alert.new(title: "Ensure that these requirements are met:")) do %>
  #    <ul class="mt-2 list-disc list-outside space-y-1 ps-2.5">
  #      <li>At least 10 characters</li>
  #    </ul>
  #  <% end %>
  #
  # @example With additional content
  #  <%= render(Flowbite::Alert.new(bordered: true, title: "This is an info alert")) do |alert| %>
  #    <% alert.with_additional_content do %>
  #      <%= render(Flowbite::Button.new(size: :xs)) { "View more" } %>
  #    <% end %>
  #    More info about this alert.
  #  <% end %>
  #
  # @viewcomponent_slot additional_content Content rendered below the
  #   message, for example action buttons. When given, the title is rendered
  #   as a heading next to the icon and the message below it.
  #
  # @see https://flowbite.com/docs/components/alerts/
  # @lookbook_embed AlertPreview
  class Alert < ViewComponent::Base
    renders_one :additional_content

    class << self
      # @return [Array<String>] The color classes for the given style and state.
      def classes(state: :default, style: :info)
        styles.fetch(style).fetch(state)
      end

      # rubocop:disable Layout/LineLength
      def styles
        Flowbite::Styles.from_hash({
          danger: {
            border: ["border-danger-subtle"],
            default: ["bg-danger-soft", "text-fg-danger-strong"]
          },
          dark: {
            border: ["border-default-medium"],
            default: ["bg-neutral-secondary-medium", "text-heading"]
          },
          info: {
            border: ["border-brand-subtle"],
            default: ["bg-brand-softer", "text-fg-brand-strong"]
          },
          success: {
            border: ["border-success-subtle"],
            default: ["bg-success-soft", "text-fg-success-strong"]
          },
          warning: {
            border: ["border-warning-subtle"],
            default: ["bg-warning-soft", "text-fg-warning"]
          }
        }.freeze)
      end
      # rubocop:enable Layout/LineLength
    end

    attr_reader :options, :style, :title

    # @param border_accent [Boolean] Whether to show a thick top border
    #   accent instead of rounded corners (default: false).
    # @param bordered [Boolean] Whether to add a border in the color of the
    #   style (default: false).
    # @param class [String, Array<String>] Additional CSS classes for the
    #   alert container.
    # @param icon [Boolean] Whether to show an info icon (default: true).
    # @param options [Hash] Additional HTML options for the alert container.
    # @param style [Symbol] The color style of the alert (:danger, :dark,
    #   :info, :success, :warning).
    # @param title [String] An optional bold title shown before the message.
    def initialize(border_accent: false, bordered: false, class: nil,
      icon: true, style: :info, title: nil, **options)
      @border_accent = border_accent
      @bordered = bordered
      @class = Array.wrap(binding.local_variable_get(:class))
      @icon = icon
      @options = options
      @style = style
      @title = title
    end

    def border_accent?
      !!@border_accent
    end

    def bordered?
      !!@bordered
    end

    def container_classes
      result = ["p-4", "text-sm"]
      result += layout_classes
      result += self.class.classes(style: style)
      result += border_classes
      result += ["rounded-base"] unless border_accent?
      result + @class
    end

    # @return [Array<String>] The CSS classes for the icon in the current
    #   layout.
    def icon_classes
      if additional_content?
        ["me-2"]
      else
        ["me-2", "mt-0.5"]
      end
    end

    def icon?
      !!@icon
    end

    # @return [String] The screen reader label describing the alert style.
    def style_label
      style.to_s.capitalize
    end

    def title?
      title.present?
    end

    private

    def border_classes
      if border_accent?
        ["border-t-4"] + self.class.classes(state: :border, style: style)
      elsif bordered?
        ["border"] + self.class.classes(state: :border, style: style)
      else
        []
      end
    end

    def layout_classes
      return [] if additional_content? || !icon?

      ["flex", "items-start"]
    end
  end
end
