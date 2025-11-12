# frozen_string_literal: true

module Flowbite
  class Link < ViewComponent::Base
    attr_reader :href, :options

    class << self
      def classes
        ["font-medium", "text-blue-600", "dark:text-blue-500", "hover:underline"].join(" ")
      end
    end

    def initialize(href:, **options)
      super()
      @href = href
      @options = options
    end

    def call
      link_to(content, href, {class: self.class.classes}.merge(options))
    end
  end
end
