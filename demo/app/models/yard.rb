module Yard
  module_function

  def code_object(class_name)
    ::YARD::Registry.load!(yardoc_path) if ::YARD::Registry.all.empty?
    yard_object = ::YARD::Registry.at(class_name)
    CodeObject.new(yard_object) if yard_object
  end

  def yardoc_path
    Rails.root.join(".yardoc")
  end
end
