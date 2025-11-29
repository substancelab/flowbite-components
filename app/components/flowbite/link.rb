# frozen_string_literal: true

module Flowbite
  # The link component can be used to set hyperlinks from one page to another or
  # to an external website when clicking on an inline text item, button, or card
  #
  # Use this component to add default styles to an inline link element.
  class Link < ViewComponent::Base
    attr_reader :href, :options

    class << self
      def classes
        ["font-medium", "text-fg-brand", "hover:underline"]
      end
    end

    # Initialize the Link component.
    #
    # @param href What to link to. This can be a String or anything else that
    # `link_to` supports. See `ActionView::Helpers::UrlHelper#link_to` for more
    # details.
    #
    # @param options [Hash] Additional HTML options for the link element
    def initialize(href:, class: nil, **options)
      super()
      @class = Array.wrap(binding.local_variable_get(:class))
      @href = href
      @options = options
    end

    def call
      link_to(content, href, {class: classes}.merge(options))
    end

    private

    def classes
      self.class.classes + @class
    end
  end
end
