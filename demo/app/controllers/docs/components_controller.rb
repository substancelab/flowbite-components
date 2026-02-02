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
