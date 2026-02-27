# frozen_string_literal: true

module Flowbite
  class Timeline
    # Renders a single item within a Timeline component.
    #
    # @example Basic usage
    #  <%= render(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) do %>
    #    Event description goes here.
    #  <% end %>
    class Item < ViewComponent::Base
      CLASSES = ["mb-10", "ms-4"].freeze

      DOT_CLASSES = [
        "-start-1.5",
        "absolute",
        "bg-neutral-quaternary",
        "border",
        "border-buffer",
        "h-3",
        "mt-1.5",
        "rounded-full",
        "w-3"
      ].freeze

      DATETIME_CLASSES = [
        "font-normal",
        "leading-none",
        "text-body",
        "text-sm"
      ].freeze

      TITLE_CLASSES = [
        "font-semibold",
        "my-2",
        "text-heading",
        "text-lg"
      ].freeze

      BODY_CLASSES = [
        "font-normal",
        "text-base",
        "text-body"
      ].freeze

      attr_reader :options

      # @param class [String, Array<String>] Additional CSS classes.
      # @param datetime [String] The time label displayed for the item.
      # @param title [String] The heading text for the item.
      def initialize(datetime:, title:, class: nil, **options)
        @class = Array.wrap(binding.local_variable_get(:class))
        @datetime = datetime
        @title = title
        @options = options
      end

      private

      def classes
        CLASSES + @class
      end

      def tag_options
        {class: classes}.merge(options)
      end
    end
  end
end
