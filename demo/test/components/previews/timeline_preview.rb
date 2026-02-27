# frozen_string_literal: true

class TimelinePreview < Lookbook::Preview
  def example
    render(Flowbite::Timeline.new) do
      safe_join([
        render(Flowbite::Timeline::Item.new(datetime: "February 2022", title: "Application UI code in Tailwind CSS")) {
          "Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and pre-order E-commerce & Marketing pages."
        },
        render(Flowbite::Timeline::Item.new(datetime: "March 2022", title: "Marketing UI design in Figma")) {
          "All of the pages and components are first designed in Figma and we keep a parity between the two versions even as we update the project."
        },
        render(Flowbite::Timeline::Item.new(datetime: "April 2022", title: "E-Commerce UI code in Tailwind CSS")) {
          "Get started with dozens of web components and interactive elements built on top of Tailwind CSS."
        }
      ])
    end
  end
end
