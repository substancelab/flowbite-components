# frozen_string_literal: true

class InputFieldPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper

  # @!group InputField
  #
  # Use this example as a generic form element which includes multiple input
  # fields types such as text, email, password, number, URL, and phone number
  # and use the grid layout to add multiple columns and rows.
  #
  # @display classes w-full

  def text
    render(Flowbite::InputField::Text.new(attribute: :first_name, form: form))
  end

  def email
    render(Flowbite::InputField::Email.new(attribute: :email, form: form))
  end

  def password
    render(Flowbite::InputField::Password.new(attribute: :password, form: form))
  end

  def number
    render(Flowbite::InputField::Number.new(attribute: :unique_visitors, form: form))
  end

  def tel
    render(Flowbite::InputField::Phone.new(attribute: :phone_number, form: form))
  end

  def url
    render(Flowbite::InputField::Url.new(attribute: :website_url, form: form))
  end

  def text_area
    render(Flowbite::InputField::Textarea.new(attribute: :company, form: form))
  end

  def file
    render(Flowbite::InputField::File.new(attribute: :avatar, form: form))
  end

  def check_box
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form))
  end

  # @!endgroup

  # @!group Sizes
  #
  # Use the following examples to apply a small, default or large size for the input fields.
  #
  # @display classes w-full

  def large_input
    render(Flowbite::InputField::Text.new(attribute: :first_name, form: form, size: :lg))
  end

  def default_input
    render(Flowbite::InputField::Text.new(attribute: :first_name, form: form, size: :default))
  end

  def small_input
    render(Flowbite::InputField::Text.new(attribute: :first_name, form: form, size: :sm))
  end

  # @!endgroup

  # @!group Helper text
  #
  # Use this example to show a helper text below the input field for additional
  # explanation and links.
  #
  # @display classes w-full

  def helper_text
    render(
      Flowbite::InputField::Text.new(
        attribute: :email,
        form: form,
        hint: {content: "We’ll never share your details."}
      )
    )
  end

  # @!endgroup

  # @!group Disabled state
  #
  # @display classes w-full

  def disabled_text
    render(Flowbite::InputField::Text.new(attribute: :first_name, form: form, disabled: true))
  end

  def disabled_email
    render(Flowbite::InputField::Email.new(attribute: :email, form: form, disabled: true))
  end

  def disabled_password
    render(Flowbite::InputField::Password.new(attribute: :password, form: form, disabled: true))
  end

  def disabled_number
    render(Flowbite::InputField::Number.new(attribute: :unique_visitors, form: form, disabled: true))
  end

  def disabled_tel
    render(Flowbite::InputField::Phone.new(attribute: :phone_number, form: form, disabled: true))
  end

  def disabled_url
    render(Flowbite::InputField::Url.new(attribute: :website_url, form: form, disabled: true))
  end

  def disabled_text_area
    render(Flowbite::InputField::Textarea.new(attribute: :company, form: form, disabled: true))
  end

  def disabled_file
    render(Flowbite::InputField::File.new(attribute: :avatar, form: form, disabled: true))
  end

  def disabled_check_box
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  def disabled_checked_check_box
    person.confirmation = true
    render(Flowbite::InputField::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  # @!endgroup

  # @!group Customization options
  #
  # @display classes w-full

  def input_with_default_label
    render(
      Flowbite::InputField::Text.new(
        attribute: :first_name,
        form: form
      )
    )
  end

  def input_with_specified_label_text
    render(
      Flowbite::InputField::Text.new(
        attribute: :first_name,
        form: form,
        label: {content: "Custom label text"}
      )
    )
  end

  def input_with_specified_label_options
    render(
      Flowbite::InputField::Text.new(
        attribute: :first_name,
        form: form,
        label: {options: {class: "custom-label-class"}}
      )
    )
  end

  def input_with_custom_label
    render(
      Flowbite::InputField::Text.new(
        attribute: :first_name,
        form: form
      )
    ) do |input|
      input.with_label do
        "This is a custom label replacing the entire label"
      end
    end
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
