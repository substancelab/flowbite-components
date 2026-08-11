# frozen_string_literal: true

module Flowbite
  # Renders pagination controls for navigating between pages of results.
  #
  # This component doesn't know about pages, page numbers, or any pagination
  # library. The caller decides which pages to show (including where to
  # place gaps) using the +pages+ slot, and provides the URLs for the
  # previous/next links directly.
  #
  # @example Usage
  #   <%= render(Flowbite::Pagination.new(
  #     previous_url: (posts_path(page: @pagy.page - 1) if @pagy.page > 1),
  #     next_url: (posts_path(page: @pagy.page + 1) if @pagy.page < @pagy.pages)
  #   )) do |pagination| %>
  #     <% (1..@pagy.pages).each do |page| %>
  #       <% pagination.with_page do %>
  #         <%= render(Flowbite::Pagination::Link.new(
  #           page: page,
  #           url: posts_path(page: page),
  #           current: page == @pagy.page
  #         )) %>
  #       <% end %>
  #     <% end %>
  #   <% end %>
  #
  # @viewcomponent_slot [Flowbite::Pagination::Link, Flowbite::Pagination::Gap]
  #   pages The pages to show. Use {Flowbite::Pagination::Link} for page
  #   numbers, and {Flowbite::Pagination::Gap} where numbers are skipped.
  #
  # @see https://flowbite.com/docs/components/pagination/
  # @lookbook_embed PaginationPreview
  class Pagination < ViewComponent::Base
    renders_many :pages

    class << self
      def classes
        ["flex", "-space-x-px", "text-sm"]
      end
    end

    attr_reader :next_url, :options, :previous_url

    # @param class [Array<String>] Additional CSS classes for the list element.
    # @param next_url [String] The URL for the next page. Omit to disable the
    #   next link, e.g. when already on the last page.
    # @param options [Hash] Additional HTML options for the nav element.
    # @param previous_url [String] The URL for the previous page. Omit to
    #   disable the previous link, e.g. when already on the first page.
    def initialize(next_url: nil, previous_url: nil, class: nil, **options)
      @next_url = next_url
      @previous_url = previous_url
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    private

    def list_classes
      self.class.classes + @class
    end
  end
end
