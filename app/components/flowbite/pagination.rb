# frozen_string_literal: true

module Flowbite
  # Renders pagination controls for navigating between pages of results.
  #
  # This component doesn't depend on any particular pagination library.
  # Instead, it takes the current page, the total number of pages, and a
  # callable that maps a page number to a URL.
  #
  # @example Usage
  #   <%= render(Flowbite::Pagination.new(
  #     current_page: @pagy.page,
  #     total_pages: @pagy.pages,
  #     url_for_page: ->(page) { posts_path(page: page) }
  #   )) %>
  #
  # @see https://flowbite.com/docs/components/pagination/
  # @lookbook_embed PaginationPreview
  class Pagination < ViewComponent::Base
    class << self
      def classes
        ["flex", "-space-x-px", "text-sm"]
      end
    end

    attr_reader :current_page, :options, :total_pages

    # @param class [Array<String>] Additional CSS classes for the list element.
    # @param current_page [Integer] The current page number.
    # @param options [Hash] Additional HTML options for the nav element.
    # @param total_pages [Integer] The total number of pages.
    # @param url_for_page [#call] A callable that takes a page number and
    #   returns the URL for that page.
    def initialize(current_page:, total_pages:, url_for_page:, class: nil, **options)
      @current_page = current_page
      @total_pages = total_pages
      @url_for_page = url_for_page
      @class = Array.wrap(binding.local_variable_get(:class))
      @options = options
    end

    def render?
      total_pages > 1
    end

    private

    def list_classes
      self.class.classes + @class
    end

    def next_page
      current_page + 1 if current_page < total_pages
    end

    def previous_page
      current_page - 1 if current_page > 1
    end

    def url_for(page)
      @url_for_page.call(page)
    end

    # Returns an array of page numbers to display, with +:gap+ markers where
    # numbers are skipped. Always includes the first and last page, and a
    # window of pages around the current page.
    def visible_pages
      pages = [1, total_pages] + ((current_page - 2)..(current_page + 2)).to_a
      pages = pages.select { |page| page.between?(1, total_pages) }.uniq.sort

      result = []
      pages.each_with_index do |page, index|
        result << page
        next_page_number = pages[index + 1]
        result << :gap if next_page_number && next_page_number - page > 1
      end
      result
    end
  end
end
