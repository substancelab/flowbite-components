# frozen_string_literal: true

class BreadcrumbPreview < Lookbook::Preview
  # Use breadcrumb navigation to show the current page location and allow users
  # to navigate back through the hierarchy.
  def default
    render(Flowbite::Breadcrumb.new) do |breadcrumb|
      breadcrumb.with_item do
        render_to_string(Flowbite::BreadcrumbItem::First.new(href: "/").with_content("Home"))
      end
      breadcrumb.with_item do
        render_to_string(Flowbite::BreadcrumbItem.new(href: "/projects").with_content("Projects"))
      end
      breadcrumb.with_item do
        render_to_string(Flowbite::BreadcrumbItem::Current.new.with_content("Current Page"))
      end
    end
  end

  private

  def render_to_string(component)
    ApplicationController.render(component, layout: false)
  end
end
