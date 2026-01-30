module Docs
  class PagesController < ApplicationController
    def index
      first_page = all_pages.first
      redirect_to(docs_page_path(first_page.slug))
    end

    def show
      @page = Page.find(params[:slug])
      raise ActiveRecord::RecordNotFound if @page.nil?

      @next_page = next_page(@page)
      @previous_page = previous_page(@page)

      respond_to do |format|
        format.html
        format.md
      end
    end

    protected

    helper_method def all_pages
      Page.all.sort_by { |page| page.order || 0 }
    end

    def next_page(current_page)
      all_pages = all_pages()
      current_index = all_pages.index { |page| page.slug == current_page.slug }
      return nil if current_index.nil? || current_index + 1 >= all_pages.length

      all_pages[current_index + 1]
    end

    def previous_page(current_page)
      all_pages = all_pages()
      current_index = all_pages.index { |page| page.slug == current_page.slug }
      return nil if current_index.nil? || current_index - 1 < 0

      all_pages[current_index - 1]
    end
  end
end
