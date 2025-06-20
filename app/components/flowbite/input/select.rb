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
        sm: ["p-2", "text-xs"],
        default: ["p-2.5", "text-sm"],
        lg: ["px-4", "py-3", "text-base"]
      }.freeze


      def initialize(form, attribute, collection: [], input_attributes: {}, size: :default, **html_options)
        super(form, attribute, input_attributes: input_attributes, size: size)

        @collection = collection
        @html_options = html_options
      end

      # Returns the HTML to use for the actual input field element.
      def call
        @form.send(
          input_field_type,
          @attribute,
          @collection,
          options,
          html_options
        )
      end

      # Returns the name of the method used to generate HTML for the input field
      def input_field_type
        :select
      end

      private

      # Returns the html_options argument for the select method
      def html_options
        {
          class: classes
        }.merge(@html_options)
      end

      # Returns the options argument for the select method
      def options
        {}
      end
    end
  end
end
