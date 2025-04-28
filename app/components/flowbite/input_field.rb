# frozen_string_literal: true

module Flowbite
  # The input field is an important part of the form element that can be used to
  # create interactive controls to accept data from the user based on multiple
  # input types, such as text, email, number, password, URL, phone number, and
  # more.
  #
  # @see https://flowbite.com/docs/forms/input/
  class InputField < ViewComponent::Base
    # Returns the errors for attribute
    def errors
      @object.errors[@attribute] || []
    end

    def initialize(attribute:, form:, size: :default)
      super
      @attribute = attribute
      @form = form
      @object = form.object
      @size = size
    end

    def input_component
      ::Flowbite::Input::Field
    end

    # Returns the HTML to use for the actual input field element.
    def input
      render(input_component.new(@form, @attribute, size: @size))
    end

    # Returns the HTML to use for the label element
    def label
      render(Flowbite::Input::Label.new(@form, @attribute))
    end
  end
end
