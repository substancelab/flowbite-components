# frozen_string_literal: true

module Flowbite
  # A fully fledged form element for an attribute containing label, input field,
  # error messages, helper text and whatever else is needed for a user-friendly
  # input experience.
  #
  # @see https://flowbite.com/docs/forms/input-field/
  #
  # The input field is an important part of the form element that can be used to
  # create interactive controls to accept data from the user based on multiple
  # input types, such as text, email, number, password, URL, phone number, and
  # more.
  #
  # Usually you'd use one of the subclasses of this class which implement the
  # different input types, like {Flowbite::InputField::Text},
  # {Flowbite::InputField::Email}, etc.
  #
  # To render an input without labels or error messages etc, see
  # {Flowbite::Input::Field} instead and one of its subclasses.
  #
  # @example Basic usage
  #
  #   <% form_for @person do |form| %>
  #     <%= render(
  #       Flowbite::InputField::Number.new(
  #         attribute: :name,
  #         form: form
  #       )
  #     ) %>
  #   <% end %>
  #
  # @example Kitchen sink
  #
  #   <% form_for @person do |form| %>
  #     <%= render(
  #       Flowbite::InputField::Number.new(
  #         attribute: :name,
  #         class: ["mb-4", "w-full"],
  #         disabled: true,
  #         form: form,
  #         hint: {
  #           content: "Please enter your full name.",
  #           options: {id: "name-helper-text"}
  #         },
  #         input: {
  #           options: {placeholder: "All of your names here"}
  #         },
  #         label: {
  #           content: "Full name",
  #           options: {class: ["mb-2", "font-medium"]}
  #         },
  #         options: {data: {controller: "form-field"}},
  #         size: :lg
  #       )
  #     ) %>
  #   <% end %>
  #
  # @viewcomponent_slot [Flowbite::Input::Hint] hint Helper text displayed
  #   below the input field to provide additional context or instructions.
  # @viewcomponent_slot [Flowbite::Input::Field] input The input element itself.
  #   Usually auto-generated based on the input type subclass.
  # @viewcomponent_slot [Flowbite::Input::Label] label The label for the input
  #   field, rendered above the input element.
  class InputField < ViewComponent::Base
    renders_one :hint
    renders_one :input
    renders_one :label

    # Returns the errors for attribute
    #
    # @return [Array<String>] An array of error messages for the attribute.
    def errors
      return [] unless @object

      @object.errors[@attribute] || []
    end

    # @param attribute [Symbol] The name of the attribute to render in this
    #   input field.
    #
    # @param form [ActionView::Helpers::FormBuilder] The form builder object that
    #   will be used to generate the input field.
    #
    # @param class [String, Array<String>] Additional CSS classes to apply to
    #   the input field container, i.e. the outermost element. To add classes to
    #   individual components of the InputField, use the +input+, +label+ and
    #   +hint+ arguments.
    #
    # @param disabled [Boolean] Whether the input field should be disabled.
    #
    # @param hint [Hash] A hint to display below the input field, providing
    #   additional context or instructions for the user. If provided, this Hash
    #   is passed to the {Flowbite::Input::Hint} constructor.
    # @option hint [String] content The content of the hint element.
    # @option hint [Hash] options Additional options to pass to the hint
    #   component. This can be used to set the class, for example.
    #
    # @param input [Hash] A hash with options for the input component.
    #   These are passed to the input component's constructor, see the
    #   documentation for whatever input component is being used.
    #   See {Flowbite::Input::Field}.
    # @option input [Hash] options Additional HTML attributes to pass to
    #   the input element.
    #
    # @param label [Hash] A hash with options for the label element. If
    #   provided, this Hash is passed to the {Flowbite::Input::Label}
    #   constructor.
    # @option label [String] content The content of the label element.
    # @option label [Hash] options Additional options to pass to the label
    #   component. This can be used to set the class, for example.
    #
    # @param options [Hash] Additional HTML attributes to pass to the input
    #   field container element.
    #
    # @param size [Symbol] The size of the input field. Can be one of +:sm+,
    #   +:default+, or +:lg+.
    def initialize(attribute:, form:, class: nil, disabled: false, hint: nil, input: {}, label: {}, options: {}, size: :default)
      @attribute = attribute
      @class = Array.wrap(binding.local_variable_get(:class))
      @disabled = disabled
      @form = form
      @hint = hint
      @input = input
      @label = label
      @object = form.object
      @options = options || {}
      @size = size
    end

    def input_component
      ::Flowbite::Input::Field
    end

    protected

    def classes
      if @options[:class]
        Array.wrap(@options[:class])
      else
        [default_container_classes, @class].flatten.compact
      end
    end

    def container_options
      @options.merge({class: classes.join(" ")})
    end

    def default_container_classes
      []
    end

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
      [
        @form.object_name,
        @attribute,
        "hint"
      ]
        .compact_blank
        .join("_")
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
