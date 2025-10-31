# frozen_string_literal: true

class CheckboxPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper

  # The checkbox component can be used to receive one or more selected options
  # from the user in the form of a square box available in multiple styles,
  # sizes, colors, and variants coded with the utility classes from Tailwind CSS
  # and with support for dark mode.
  #
  # Make sure that you have included Flowbite as a plugin inside your Tailwind
  # CSS project to apply all the necessary styles for the checkbox component.

  # @!group Checkbox
  #
  # Use this default example of a checkbox element in a checked and unchecked
  # state.
  def default_checkbox
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form))
  end

  def checked_state
    person.confirmation = true
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form))
  end

  def with_custom_label
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, label: {content: "I agree with the terms and conditions."}))
  end

  def with_custom_value
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, input: {value: "yes"}, label: {content: "This checkbox submits 'yes' when checked."}))
  end

  # @!endgroup

  # @!group Disabled state
  #
  # @display classes w-full

  def disabled_check_box
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  def disabled_checked_check_box
    person.confirmation = true
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  # @!endgroup

  # @!group Helper text
  #
  # Get started with this example if you want to add a secondary helper text for
  # the checkbox component.

  def checkbox_with_helper_text
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, hint: "I agree with the terms and conditions."))
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
