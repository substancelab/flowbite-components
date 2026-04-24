class SitemapController < ApplicationController
  def index
    @urls = sitemap_urls
    respond_to do |format|
      format.xml { render layout: false }
    end
  end

  private

  def all_components
    flowbite = Yard.code_object("Flowbite")
    return [] unless flowbite

    flowbite.children.select { |child|
      child.type == :class && child.inheritance_tree.map(&:path).include?("ViewComponent::Base")
    }.sort_by(&:name)
  end

  def sitemap_urls
    urls = [root_url]

    Page.all.sort_by { |page| page.order || 0 }.each do |page|
      urls << docs_page_url(page.slug)
    end

    urls << docs_component_url("Flowbite")
    all_components.each do |component|
      urls << docs_component_url(component.path)
    end

    urls
  end
end
