module Docs
  class PagesController < ApplicationController
    def index
    end

    def show
      @page = Page.find(params[:slug])
      raise ActiveRecord::RecordNotFound if @page.nil?

      respond_to do |format|
        format.html
        format.md
      end
    end
  end
end
