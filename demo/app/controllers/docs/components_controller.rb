module Docs
  class ComponentsController < ApplicationController
    def show
      @code_object = Yard.code_object(params[:id])
      raise ActiveRecord::RecordNotFound if @code_object.nil?

      @child_classes = @code_object.children.select { |c| c.is_a?(YARD::CodeObjects::ClassObject) }.sort_by(&:name)
      @constructor = @code_object.meths.find { |meth| meth.name == :initialize }
      @constructor_arguments = if @constructor
        @constructor.tags(:param)
      else
        []
      end
      @examples = @code_object.tags(:example)
      @viewcomponent_slots = @code_object.tags(:viewcomponent_slot)

      lookbook_embeds = @code_object.tags(:lookbook_embed)
      @introduction_preview = find_example_preview(lookbook_embeds)
      @previews = find_non_example_previews(lookbook_embeds)

      respond_to do |format|
        format.html
        format.md
      end
    end

    private

    helper_method def all_components
      return @all_components if @all_components

      flowbite = Yard.code_object("Flowbite")
      child_classes = flowbite.children.select { |child|
        child.type == :class && child.inheritance_tree.map(&:path).include?("ViewComponent::Base")
      }

      @all_components = child_classes.sort_by(&:name)
    end

    # Returns the Lookbook preview with a scenario named "example"
    #
    # @return [Lookbook::Preview, nil]
    def find_example_preview(lookbook_embeds)
      return nil if lookbook_embeds.empty?

      preview_class = lookbook_embeds.first.text.strip
      return nil if preview_class.blank?

      preview = Lookbook::Engine.previews.find_by_preview_class(preview_class)
      return nil unless preview

      preview if preview.scenarios.any? { |s| s.name == "example" }
    end

    # @return [Array<Lookbook::Entity>]
    def find_non_example_previews(lookbook_embeds)
      return [] if lookbook_embeds.empty?

      preview_class = lookbook_embeds.first.text.strip
      return [] if preview_class.blank?

      preview_entity = Lookbook::Engine.previews.find_by_preview_class(preview_class)
      return [] unless preview_entity

      scenarios = preview_entity.scenarios
      scenarios.reject { |s| s.name == "example" }
    end

    helper_method def rubydoc_url(code_object)
      name = code_object.path
      slug = name.gsub("::", "/")
      "https://www.rubydoc.info/gems/flowbite-components/#{slug}.html"
    end
  end
end
