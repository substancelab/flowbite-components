# frozen_string_literal: true

module Flowbite
  # Renders a breadcrumb navigation component.
  #
  # See https://flowbite.com/docs/components/breadcrumb/
  #
  # Breadcrumbs consist of the following components:
  #
  # - {Flowbite::Breadcrumb}: Container for breadcrumb items.
  # - {Flowbite::Breadcrumb::HomeIcon}: Home icon for the first breadcrumb item.
  # - {Flowbite::Breadcrumb::SeparatorIcon}: Separator between breadcrumb items.
  # - {Flowbite::BreadcrumbItem}: An individual breadcrumb item.
  # - {Flowbite::BreadcrumbItem::Current}: An invidual breadcrumb item without a link, usually used for the current page in the breadcrumb trail.
  # - {Flowbite::BreadcrumbItem::First}: An individual breadcrumb item with a home icon on it.
  #
  # @viewcomponent_slot [Flowbite::BreadcrumbItem] items The items of the
  #   breadcrumb trail. Use {Flowbite::BreadcrumbItem::First} for the first
  #   item to get a home icon, and {Flowbite::BreadcrumbItem::Current} for the
  #   last item to render it without a link.
  #
  # @lookbook_embed BreadcrumbPreview
  class Breadcrumb < ViewComponent::Base
    renders_many :items

    def call
      content_tag(:nav, class: "flex", "aria-label": "Breadcrumb") do
        content_tag(:ol, class: "inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse") do
          items.each do |item|
            concat(item)
          end
        end
      end
    end
  end
end
