# frozen_string_literal: true

module Flowbite
  # Renders a breadcrumb navigation component.
  #
  # See https://flowbite.com/docs/components/breadcrumb/
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
