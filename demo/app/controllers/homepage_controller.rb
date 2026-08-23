class HomepageController < ApplicationController
  FEATURED_COMPONENTS = [
    {class_name: "Flowbite::Badge", illustration: "badge", name: "Badge"},
    {class_name: "Flowbite::Breadcrumb", illustration: "breadcrumb", name: "Breadcrumb"},
    {class_name: "Flowbite::Button", illustration: "button", name: "Button"},
    {class_name: "Flowbite::Card", illustration: "card", name: "Card"},
    {class_name: "Flowbite::Input", illustration: "input", name: "Input"},
    {class_name: "Flowbite::InputField", illustration: "input_field", name: "Input field"},
    {class_name: "Flowbite::Link", illustration: "link", name: "Link"},
    {class_name: "Flowbite::Pagination", illustration: "pagination", name: "Pagination"},
    {class_name: "Flowbite::Sidebar", illustration: "sidebar", name: "Sidebar"},
    {class_name: "Flowbite::Spinner", illustration: "spinner", name: "Spinner"},
    {class_name: "Flowbite::Toast", illustration: "toast", name: "Toast"}
  ].freeze

  helper_method def featured_components
    FEATURED_COMPONENTS
  end

  def show
  end
end
