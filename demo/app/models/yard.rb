module Yard
  module_function

  def code_object(class_name)
    # Lookbook also uses the YARD registry when parsing previews, replacing
    # its contents, so make sure the components are loaded
    ::YARD::Registry.load!(yardoc_path) unless ::YARD::Registry.at("Flowbite")
    yard_object = ::YARD::Registry.at(class_name)
    CodeObject.new(yard_object) if yard_object
  end

  def yardoc_path
    Rails.root.join(".yardoc")
  end
end
