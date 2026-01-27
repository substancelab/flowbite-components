# frozen_string_literal: true

module Flowbite
  # Renders a breadcrumb navigation component.
  #
  # See https://flowbite.com/docs/components/breadcrumb/
  #
  # Breadcrumbs consist of the following components:
  #
  # - {Flowbite::Breadcrumb}: Container for breadcrumb items.
  # - {Flowbite::BreadcrumbItem}: An individual breadcrumb item.
  # - {Flowbite::BreadcrumbItem::First}: An individual breadcrumb item with a home icon on it.
  # - {Flowbite::BreadcrumbSeparator}: Separator between breadcrumb items.
  # - {Flowbite::BreadcrumbItem::Current}: An invidual breadcrumb item without a link, usually used for the current page in the breadcrumb trail.
  #
  # == Slots
  #
  # - +items+ ({Flowbite::BreadcrumbItem}): The items of the breadcrumb trail. {Flowbite::Breadcrumb} does not do any special handling for these items, so if you want to render the first item with a home icon, you need to use {Flowbite::BreadcrumbItem::First} for that item. And if you want to render the last item without a link, you need to use {Flowbite::BreadcrumbItem::Current} for that item.
  #
  # @example Basic usage with BreadcrumbItem components
  #   <%= render Flowbite::Breadcrumb.new do |breadcrumb| %>
  #     <% breadcrumb.with_item do %>
  #       <%= render Flowbite::BreadcrumbItem::First.new(href: "/") { "Home" } %>
  #     <% end %>
  #     <% breadcrumb.with_item do %>
  #       <%= render Flowbite::BreadcrumbItem.new(href: "/projects") { "Projects" } %>
  #     <% end %>
  #     <% breadcrumb.with_item do %>
  #       <%= render Flowbite::BreadcrumbItem::Current.new { "Current Page" } %>
  #     <% end %>
  #   <% end %>
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
