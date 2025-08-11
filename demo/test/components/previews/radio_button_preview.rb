# frozen_string_literal: true

class RadioButtonPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper

  # Get started with the radio component to let the user choose a single option
  # from multiple options in the form of a circle based on multiple styles and
  # colors
  #
  # The radio component can be used to allow the user to choose a single option
  # from one or more available options coded with the utility classes from
  # Tailwind CSS and available in multiple styles, variants, and colors and
  # support dark mode.
  #
  # Make sure that you have included Flowbite as a plugin inside your Tailwind
  # CSS project to apply all the necessary styles for the radio component.

  # @!group Radio
  #
  # Use the default example of a radio component with the checked and unchecked
  # state.
  def default_radio
    render(Flowbite::InputField::RadioButton.new(attribute: :state, form: form, label: {content: "Default radio"}, value: "visible"))
  end

  def checked_state
    render(Flowbite::InputField::RadioButton.new(attribute: :state, form: form, label: {content: "Checked radio"}, value: "hidden"))
  end

  # @!endgroup

  # @!group Disabled state
  #
  # @display classes w-full

  def disabled_radio_button
    render(Flowbite::InputField::RadioButton.new(attribute: :state, form: form, value: "visible", disabled: true))
  end

  def disabled_checked_radio_button
    person.state = "visible"
    render(Flowbite::InputField::RadioButton.new(attribute: :state, form: form, value: "visible", disabled: true))
  end

  # @!endgroup

  # @!group Helper text
  #
  # Get started with this example if you want to add a secondary helper text for
  # the checkbox component.

  def checkbox_with_helper_text
    render(Flowbite::InputField::RadioButton.new(attribute: :state, form: form, value: "visible", hint: "I agree with the terms and conditions."))
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
      state: "hidden"
    )
  end
end
