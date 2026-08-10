# frozen_string_literal: true

class PaginationPreview < Lookbook::Preview
  def example
    render(Flowbite::Pagination.new(previous_url: "?page=2", next_url: "?page=4")) do |pagination|
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 1, url: "?page=1")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 2, url: "?page=2")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 3, url: "?page=3", current: true)) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 4, url: "?page=4")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 10, url: "?page=10")) }
    end
  end

  # @!group Page position
  #
  # The caller decides which pages to show, including where to place gaps,
  # and whether the previous/next links are enabled. These examples always
  # show the first and last page, and a window of pages around the current
  # page.
  #
  # @display classes flex flex-col space-y-4

  def first_page
    render(Flowbite::Pagination.new(next_url: "?page=2")) do |pagination|
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 1, url: "?page=1", current: true)) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 2, url: "?page=2")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 3, url: "?page=3")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 10, url: "?page=10")) }
    end
  end

  def middle_page
    render(Flowbite::Pagination.new(previous_url: "?page=4", next_url: "?page=6")) do |pagination|
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 1, url: "?page=1")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 4, url: "?page=4")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 5, url: "?page=5", current: true)) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 6, url: "?page=6")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 10, url: "?page=10")) }
    end
  end

  def last_page
    render(Flowbite::Pagination.new(previous_url: "?page=9")) do |pagination|
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 1, url: "?page=1")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Gap.new) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 8, url: "?page=8")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 9, url: "?page=9")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 10, url: "?page=10", current: true)) }
    end
  end

  # @!endgroup

  # @!group Custom styling
  #
  # Add custom classes to the pagination list.
  #
  # @display classes flex flex-col space-y-4

  def with_custom_classes
    render(Flowbite::Pagination.new(previous_url: "?page=2", next_url: "?page=4", class: ["mt-4"])) do |pagination|
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 2, url: "?page=2")) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 3, url: "?page=3", current: true)) }
      pagination.with_page { render_to_string(Flowbite::Pagination::Link.new(page: 4, url: "?page=4")) }
    end
  end

  # @!endgroup

  private

  def render_to_string(component)
    ApplicationController.render(component, layout: false)
  end
end
