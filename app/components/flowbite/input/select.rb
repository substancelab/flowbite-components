# frozen_string_literal: true

module Flowbite
  module Input
    # The `Select` component renders a select input field for use in forms.
    #
    # https://flowbite.com/docs/forms/select/
    #
    # Wraps `ActionView::Helpers::FormOptionsHelper#select`: https://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-select
    class Select < Field
      SIZES = {
        sm: ["px-2.5", "py-2", "text-sm"],
        default: ["px-3", "py-2.5", "text-sm"],
        lg: ["px-3.5", "py-3", "text-base"]
      }.freeze

      def initialize(form:, attribute:, class: nil, collection: [], disabled: false, include_blank: false, multiple: false, options: {}, size: :default)
        super(form: form, attribute: attribute, class: binding.local_variable_get(:class), disabled: disabled, options: options, size: size)
        @collection = collection
        @include_blank = include_blank
        @multiple = multiple
      end

      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          @collection,
          select_options,
          html_options
        )
      end

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :select
      end

      private

      def select_options
        {
          include_blank: @include_blank,
          multiple: @multiple
        }
      end

      # Returns the html_options argument for the select method
      def html_options
        {
          class: classes,
          disabled: disabled?
        }.merge(options)
      end
    end
  end
end
