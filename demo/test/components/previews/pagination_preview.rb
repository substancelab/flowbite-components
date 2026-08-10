# frozen_string_literal: true

class PaginationPreview < Lookbook::Preview
  def example
    render(Flowbite::Pagination.new(current_page: 3, total_pages: 10, url_for_page: url_for_page))
  end

  # @!group Page position
  #
  # The pagination component always shows the first and last page, and skips
  # ahead with a gap indicator when there are more pages than fit around the
  # current page.
  #
  # @display classes flex flex-col space-y-4

  def first_page
    render(Flowbite::Pagination.new(current_page: 1, total_pages: 10, url_for_page: url_for_page))
  end

  def middle_page
    render(Flowbite::Pagination.new(current_page: 5, total_pages: 10, url_for_page: url_for_page))
  end

  def last_page
    render(Flowbite::Pagination.new(current_page: 10, total_pages: 10, url_for_page: url_for_page))
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the pagination list.
  #
  # @display classes flex flex-col space-y-4

  def with_custom_classes
    render(Flowbite::Pagination.new(current_page: 3, total_pages: 10, url_for_page: url_for_page, class: ["mt-4"]))
  end

  # @!endgroup

  private

  def url_for_page
    ->(page) { "?page=#{page}" }
  end
end
