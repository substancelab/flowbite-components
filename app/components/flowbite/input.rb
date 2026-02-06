# frozen_string_literal: true

module Flowbite
  # The individual input form element used in forms - without labels, error
  # messages, hints, etc.
  #
  # Use this when you want to render an input field on its own without any
  # surrounding elements, i.e. as a building block in more complex input
  # components. To render a complete input field with labels and error messages,
  # use {Flowbite::InputField} instead.
  #
  # By default this renders a text input field. To render other types of input
  # fields, use one of the subclasses, such as {Flowbite::Input::Checkbox} or
  # {Flowbite::Input::Textarea}.
  #
  # @example Usage
  #   <%= render(Flowbite::Input::Email.new(attribute: :email, form: form)) %>
  #
  # @lookbook_embed InputPreview
  class Input < ViewComponent::Base
    SIZES = {
      sm: ["px-2.5", "py-2", "text-sm"],
      default: ["px-3", "py-2.5", "text-sm"],
      lg: ["px-3.5", "py-3", "text-base"]
    }.freeze

    STATES = [
      DEFAULT = :default,
      DISABLED = :disabled,
      ERROR = :error
    ].freeze

    attr_reader :options, :size, :style

    class << self
      # @return [Array<String>] The CSS classes to apply to the input field
      #   given the specified +size+, +state+, and +style+.
      def classes(size: :default, state: :default, style: :default)
        style = styles.fetch(style)
        state_classes = style.fetch(state)
        state_classes + sizes.fetch(size)
      end

      # Returns the sizes this Input supports.
      #
      # This is effectively the {SIZES} constant, but provided as a method to
      # return the constant from the current class, not the superclass.
      #
      # @return [Hash] A hash mapping size names to their corresponding CSS
      #   classes.
      def sizes
        const_get(:SIZES)
      end

      # @return [Flowbite::Styles] The available styles for this input field.
      def styles
        # rubocop:disable Layout/LineLength
        Flowbite::Styles.from_hash(
          {
            default: {
              default: ["bg-neutral-secondary-medium", "border", "border-default-medium", "text-heading", "rounded-base", "focus:ring-brand", "focus:border-brand", "block", "w-full", "shadow-xs", "placeholder:text-body"],
              disabled: ["bg-neutral-secondary-medium", "border", "border-default-medium", "text-fg-disabled", "rounded-base", "focus:ring-brand", "focus:border-brand", "block", "w-full", "shadow-xs", "cursor-not-allowed", "placeholder:text-fg-disabled"],
              error: ["bg-danger-soft", "border", "border-danger-subtle", "text-fg-danger-strong", "rounded-base", "focus:ring-danger", "focus:border-danger", "block", "w-full", "shadow-xs", "placeholder:text-fg-danger-strong"]
            }
          }.freeze
        )
        # rubocop:enable Layout/LineLength
      end
    end

    # @param attribute [Symbol] The attribute on the form's object this input
    #   field is for.
    #
    # @param form [ActionView::Helpers::FormBuilder] The form builder this
    #   input field is part of.
    #
    # @param class [String, Array<String>] Additional CSS classes to apply to
    #   the input field.
    #
    # @param disabled [Boolean] Whether the input field should be disabled.
    #
    # @param options [Hash] Additional HTML attributes to pass to the input
    #   field. For example, you can use this to set placeholder text by
    #   passing +options: {placeholder: "Enter your name"}+
    #
    # @param size [Symbol] The size of the input field. Can be one of +:sm+,
    #   +:default+, or +:lg+.
    def initialize(attribute:, form:, class: nil, disabled: false, options: {}, size: :default)
      @attribute = attribute
      @class = Array.wrap(binding.local_variable_get(:class))
      @disabled = disabled
      @form = form
      @options = options || {}
      @object = form.object
      @size = size
    end

    # Returns the HTML to use for the actual input field element.
    def call
      @form.send(
        input_field_type,
        @attribute,
        **input_options
      )
    end

    # Returns the CSS classes to apply to the input field
    #
    # @return [Array<String>] An array of CSS classes.
    def classes
      self.class.classes(size: size, state: state) + @class
    end

    # Returns the name of the method used to generate HTML for the input field
    #
    # @return [Symbol] The form helper method name to call on +form+.
    def input_field_type
      :text_field
    end

    protected

    # @return [Boolean] Returns true if the field is disabled
    def disabled?
      !!@disabled
    end

    # Returns true if the object has errors. Returns false if there is no
    # object.
    #
    # @return [Boolean] true if there are errors, false otherwise.
    def errors?
      return false unless @object

      @object.errors.include?(@attribute.intern)
    end

    private

    # Returns the options argument for the input field
    def input_options
      {
        class: classes,
        disabled: disabled?
      }.merge(options)
    end

    def state
      return DISABLED if disabled?
      return ERROR if errors?

      DEFAULT
    end
  end
end
