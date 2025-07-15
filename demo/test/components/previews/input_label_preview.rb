# frozen_string_literal: true

class InputLabelPreview < Lookbook::Preview
  include ActionView::Helpers::FormHelper

  # @!group InputLabel

  # `Flowbite::Input::Label` renders a label for a form input field. It is used
  # by `Flowbite::InputField` components, but you can use the component
  # directly if you need to render a label without an input field.
  #
  # By default the text of the label is the attribute name unless a
  # translation is found. This follows the same logic as
  # `ActionView::Helpers::FormBuilder#label`.
  #
  # You can specify the text of the label by rendering the component with a
  # block or by using `#with_content`.
  #
  # @display classes w-full

  def default
    render(Flowbite::Input::Label.new(attribute: :first_name, form: form))
  end

  def with_content
    render(Flowbite::Input::Label.new(attribute: :first_name, form: form).with_content("This is not the default label"))
  end

  # @!endgroup InputLabel

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
