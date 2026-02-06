# frozen_string_literal: true

class InputPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper

  def example
    render(Flowbite::Input.new(attribute: :first_name, form: form))
  end

  # @!group Types
  #
  # Inputs come in various types such as text, email, password, number, URL, and
  # phone number.
  #
  # @display classes w-full

  def text
    render(Flowbite::Input.new(attribute: :first_name, form: form))
  end

  def email
    render(Flowbite::Input::Email.new(attribute: :email, form: form))
  end

  def password
    render(Flowbite::Input::Password.new(attribute: :password, form: form))
  end

  def number
    render(Flowbite::Input::Number.new(attribute: :unique_visitors, form: form))
  end

  def tel
    render(Flowbite::Input::Phone.new(attribute: :phone_number, form: form))
  end

  def url
    render(Flowbite::Input::Url.new(attribute: :website_url, form: form))
  end

  def text_area
    render(Flowbite::Input::Textarea.new(attribute: :company, form: form))
  end

  def file
    render(Flowbite::Input::File.new(attribute: :avatar, form: form))
  end

  def check_box
    render(Flowbite::Input::Checkbox.new(attribute: :confirmation, form: form))
  end

  # @!endgroup

  # @!group Sizes
  #
  # Use the following examples to apply a small, default or large size for the input fields.
  #
  # @display classes w-full

  def large_input
    render(Flowbite::Input.new(attribute: :first_name, form: form, size: :lg))
  end

  def default_input
    render(Flowbite::Input.new(attribute: :first_name, form: form, size: :default))
  end

  def small_input
    render(Flowbite::Input.new(attribute: :first_name, form: form, size: :sm))
  end

  # @!endgroup

  # @!group Disabled state
  #
  # @display classes w-full

  def disabled_text
    render(Flowbite::Input.new(attribute: :first_name, form: form, disabled: true))
  end

  def disabled_email
    render(Flowbite::Input::Email.new(attribute: :email, form: form, disabled: true))
  end

  def disabled_password
    render(Flowbite::Input::Password.new(attribute: :password, form: form, disabled: true))
  end

  def disabled_number
    render(Flowbite::Input::Number.new(attribute: :unique_visitors, form: form, disabled: true))
  end

  def disabled_tel
    render(Flowbite::Input::Phone.new(attribute: :phone_number, form: form, disabled: true))
  end

  def disabled_url
    render(Flowbite::Input::Url.new(attribute: :website_url, form: form, disabled: true))
  end

  def disabled_text_area
    render(Flowbite::Input::Textarea.new(attribute: :company, form: form, disabled: true))
  end

  def disabled_file
    render(Flowbite::Input::File.new(attribute: :avatar, form: form, disabled: true))
  end

  def disabled_check_box
    render(Flowbite::Input::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  def disabled_checked_check_box
    person.confirmation = true
    render(Flowbite::Input::Checkbox.new(attribute: :confirmation, form: form, disabled: true))
  end

  # @!endgroup

  def input_with_placeholder
    person.first_name = nil
    render(
      Flowbite::Input.new(
        attribute: :first_name,
        form: form,
        options: {placeholder: "Enter your first name"}
      )
    )
  end

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
