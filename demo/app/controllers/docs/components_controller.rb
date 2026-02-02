module Docs
  class ComponentsController < ApplicationController
    class Yard
      def code_object(class_name)
        ::YARD::Registry.load!(yardoc_path) if ::YARD::Registry.all.empty?
        ::YARD::Registry.at(class_name)
      end

      def yardoc_path
        Rails.root.join(".yardoc")
      end
    end

    def show
      @code_object = Yard.new.code_object(params[:id])
      raise ActiveRecord::RecordNotFound if @code_object.nil?

      @child_classes = @code_object.children.select { |c| c.is_a?(YARD::CodeObjects::ClassObject) }.sort_by(&:name)
      @constructor = @code_object.meths.find { |meth| meth.name == :initialize }
      @constructor_arguments = if @constructor
        @constructor.tags(:param)
      else
        []
      end
      @examples = @code_object.tags(:example)
      @lookbook_embeds = @code_object.tags(:lookbook_embed)
      @viewcomponent_slots = @code_object.tags(:viewcomponent_slot)

      respond_to do |format|
        format.html
        format.md
      end
    end

    private

    helper_method def all_components
      flowbite = Yard.new.code_object("Flowbite")
      child_classes = flowbite.children.select { |child|
        child.type == :class && child.inheritance_tree.map(&:path).include?("ViewComponent::Base")
      }
      child_classes.sort_by(&:name)
    end

    helper_method def rubydoc_url(code_object)
      name = code_object.path
      slug = name.gsub("::", "/")
      "https://www.rubydoc.info/gems/flowbite-components/#{slug}.html"
    end
  end
end
