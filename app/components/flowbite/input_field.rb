# frozen_string_literal: true

module Flowbite
  # A form element for a single field, containing label, input field, error
  # messages, helper text and whatever else is needed for a user friendly input
  # experience.
  #
  # @see https://flowbite.com/docs/forms/input-field/
  #
  # The input field is an important part of the form element that can be used to
  # create interactive controls to accept data from the user based on multiple
  # input types, such as text, email, number, password, URL, phone number, and
  # more.
  #
  # Usually you'd use one of the subclasses of this class which implement the
  # different input types, like `Flowbite::InputField::Text`,
  # `Flowbite::InputField::Email`, etc.
  #
  # Expects 2 arguments:
  #
  # @param attribute [Symbol] The name of the attribute to render in this input
  # field.
  #
  # @param form [ActionView::Helpers::FormBuilder] The form builder object that
  # will be used to generate the input field.
  #
  # Supports additional arguments:
  #
  # @param hint [String] A hint to display below the input field, providing
  # additional context or instructions for the user. This is optional. See
  # https://flowbite.com/docs/forms/input-field/#helper-text
  #
  # @param label [Hash] A hash with options for the label. These are passed to
  # Flowbite::Input::Label, see that for details. Can contain:
  # - `content`: The content of the label. If not provided, the label will
  #   default to the attribute name.
  # - `options`: A hash of additional options to pass to the label component.
  #   This can be used to set the class, for example.
  #
  # @param disabled [Boolean] Whether the input field should be disabled.
  # Defaults to `false`.
  #
  # @param input [Hash] A hash with options for the default input component.
  # These are passed to the input components constructor, so see whatever
  # component is being used for details. Can contain:
  # - `options`: Additional HTML attributes to pass to the input element.
  #
  # @param size [Symbol] The size of the input field. Can be one of `:sm`,
  # `:md`, or `:lg`. Defaults to `:md`.
  #
  # Sample usage
  #
  #     <% form_for @person do |form| %>
  #       <%= render(
  #         Flowbite::InputField::Number.new(
  #           :attribute => :name,
  #           :form => form
  #         )
  #       ) %>
  #     <% end %>
  #
  # To render an input without labels or error messages etc, use
  # `Flowbite::Input::Field` instead.
  class InputField < ViewComponent::Base
    renders_one :hint
    renders_one :input
    renders_one :label

    # Returns the errors for attribute
    def errors
      @object.errors[@attribute] || []
    end

    def initialize(attribute:, form:, disabled: false, hint: nil, input: {}, label: {}, size: :default)
      @attribute = attribute
      @disabled = disabled
      @form = form
      @hint = hint
      @input = input
      @label = label
      @object = form.object
      @size = size
    end

    def input_component
      ::Flowbite::Input::Field
    end

    protected

    # Returns the HTML to use for the hint element if any
    def default_hint
      return unless hint?

      component = Flowbite::Input::Hint.new(
        attribute: @attribute,
        form: @form,
        options: default_hint_options
      ).with_content(default_hint_content)
      render(component)
    end

    def default_hint_content
      return nil unless @hint

      @hint[:content]
    end

    # Returns a Hash with the default attributes to apply to the hint element.
    #
    # The default attributes can be overriden by passing the `hint[options]`
    # argument to the constructor.
    def default_hint_options
      return {} unless @hint

      {
        id: id_for_hint_element
      }.merge(@hint[:options] || {})
    end

    # Returns a Hash with the default attributes to apply to the input element.
    #
    # The default attributes can be overriden by passing the `input[options]`
    # argument to the constructor.
    def default_input_options
      if hint?
        {
          "aria-describedby": id_for_hint_element
        }
      else
        {}
      end
    end

    # Returns the HTML to use for the default input element.
    def default_input
      render(input_component.new(**input_arguments))
    end

    def default_label
      component = Flowbite::Input::Label.new(**default_label_options)
      if default_label_content
        component.with_content(default_label_content)
      else
        component
      end
    end

    def default_label_content
      @label[:content]
    end

    def default_label_options
      label_options = @label.dup
      label_options.delete(:content)

      {
        attribute: @attribute,
        form: @form
      }.merge(label_options)
    end

    # Returns true if the input field is disabled, false otherwise.
    def disabled?
      !!@disabled
    end

    # Returns true if the input field has a hint, false otherwise.
    def hint?
      @hint.present?
    end

    def id_for_hint_element
      "#{@form.object_name}_#{@attribute}_hint"
    end

    # @return [Hash] The keyword arguments for the input component.
    def input_arguments
      {
        attribute: @attribute,
        disabled: @disabled,
        form: @form,
        options: input_options,
        size: @size
      }
    end

    def input_options
      default_input_options.merge(@input[:options] || {})
    end
  end
end
