require "nokogiri"

module Lookbook
  module DocHelper
    class Documentation
      attr_reader :code_object

      def initialize(code_object)
        @code_object = code_object
      end

      def params
        @code_object.tags(:param)
      end
    end

    class YARD
      def code_object(class_name)
        p ["Load from", yardoc_path]
        ::YARD::Registry.load!(yardoc_path) if ::YARD::Registry.all.empty?

        p ["Looking up", class_name]
        code_object = ::YARD::Registry.at(class_name)

        p ["-> Found", code_object]
        code_object
      end

      def yardoc_path
        Rails.root.join("..", ".yardoc")
      end
    end

    def render_doc(class_name)
      yard = YARD.new
      code_object = yard.code_object(class_name)
      Documentation.new(code_object)
    end

    def render_doc_from_html(class_name)
      doc_root = Rails.root.join("public", "doc")
      filename = class_name.gsub("::", "/") + ".html"
      html = File.readlines(doc_root.join(filename)).join

      doc = Nokogiri::HTML5(html)
      links = doc.css("#main .docstring a")
      links.each do |link|
        next if link["href"]&.start_with?("http")

        href = link["href"]
        local_doc_href = if href == ""
          "/doc/#{class_name.gsub("::", "/")}.html"
        else
          "/doc/Flowbite/#{href}"
        end
        link["href"] = local_doc_href
      end
      content = doc.css("#main .code_object").inner_html
      content.html_safe
    end
  end
end
