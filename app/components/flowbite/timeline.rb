# frozen_string_literal: true

module Flowbite
  # Renders a vertical timeline component for displaying chronological events.
  #
  # @example Basic usage
  #  <%= render(Flowbite::Timeline.new) do %>
  #    <%= render(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Event title")) do %>
  #      Event description goes here.
  #    <% end %>
  #  <% end %>
  #
  # @see https://flowbite.com/docs/components/timeline/
  # @lookbook_embed TimelinePreview
  class Timeline < ViewComponent::Base
    CLASSES = ["border-s", "border-default", "relative"].freeze

    attr_reader :options

    # @param class [String, Array<String>] Additional CSS classes.
    def initialize(class: nil, **options)
      @class = Array.wrap(binding.local_variable_get(:class))
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
