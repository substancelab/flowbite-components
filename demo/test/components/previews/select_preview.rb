# frozen_string_literal: true

class SelectPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormOptionsHelper

  # Get started with the select component to allow the user to choose from one
  # or more options from a dropdown list based on multiple styles, sizes, and
  # variants
  #
  # The select input component can be used to gather information from users
  # based on multiple options in the form of a dropdown list and by browsing
  # this page you will find multiple options, styles, sizes, and variants built
  # with the utility classes from Tailwind CSS also available in dark mode.
  #
  # @display classes w-full

  def select_input_field
    render(Flowbite::InputField::Select.new(attribute: :company, form: form, collection: ["Option 1", "Option 2", "Option 3"]))
  end

  # @group Sizes
  #
  # @display classes w-full

  def small_select
    render(Flowbite::InputField::Select.new(attribute: :company, form: form, collection: ["Option 1", "Option 2", "Option 3"], size: :sm))
  end

  def default_select
    render(Flowbite::InputField::Select.new(attribute: :company, form: form, collection: ["Option 1", "Option 2", "Option 3"], size: :default))
  end

  def large_select
    render(Flowbite::InputField::Select.new(attribute: :company, form: form, collection: ["Option 1", "Option 2", "Option 3"], size: :lg))
  end

  # @!endgroup

  private

  def form
    @builder ||= begin
      object = person
      object_name = "person"
      options = {}

      builder = ActionView::Base.default_form_builder
      builder.new(object_name, object, self, options)
    end
  end

  def person
    @person ||= Person.new(
      company: "Flowbite",
      email: "john.doe@company.com",
      first_name: "John",
      last_name: "Doe",
      password: "secret1234",
      phone_number: "123-45-678",
      unique_visitors: 1_234,
      website_url: "https://flowbite.com"
    )
  end
end
