# frozen_string_literal: true

module Flowbite
  class Pagination
    # Renders a gap indicator between page numbers in a pagination component.
    #
    # This is automatically used by {Flowbite::Pagination}, but can be used
    # standalone if needed.
    #
    # @example Standalone usage
    #   <%= render Flowbite::Pagination::Gap.new %>
    class Gap < ViewComponent::Base
      class << self
        def classes
          ["flex", "items-center", "justify-center", "text-body", "bg-neutral-secondary-medium", "box-border", "border", "border-default-medium", "hover:bg-neutral-tertiary-medium", "hover:text-heading", "font-medium", "text-sm", "w-9", "h-9", "focus:outline-none"]
        end
      end

      def call
        content_tag(:li, "…", class: self.class.classes)
      end
    end
  end
end
