require "rails_autolink"

module FormattingHelper
  class DocstringRenderer
    include YARD::Templates::Helpers::BaseHelper
    include YARD::Templates::Helpers::HtmlHelper

    Options = Data.define(:markup)

    attr_reader :view_context

    def initialize(content, view_context:, code_object: nil)
      @content = content
      @code_object = code_object
      @view_context = view_context
    end

    # Called by YARD::Templates::Helpers::HtmlHelper#htmlify to render the
    # docstring content. The default implementation simply returns the content
    # as is, but you can override this method to provide custom rendering logic
    # based on the specified markup format.
    def html_markup_markdown(content)
      return "" unless content
      return "" unless content.strip.present?

      output = Kramdown::Document.new(content, input: "GFM").to_html
      remove_line_breaks(output)
    end

    def render
      htmlify(@content)
    end

    private

    def object
      # Required by YARD::Templates::Helpers::HtmlHelper#resolve_links
      @code_object
    end

    def options
      @options ||= Options.new(
        markup: :markdown
      )
    end

    def remove_line_breaks(text)
      text.gsub("<br />", " ")
    end

    def linkify(name, title)
      code_object = Yard.code_object(name)
      if code_object
        view_context.link_to(title || name, view_context.docs_component_path(code_object.path))
      else
        title || name
      end
    end
  end

  def render_docstring(content, code_object: nil)
    html = DocstringRenderer.new(
      content,
      code_object: code_object,
      view_context: self
    ).render.html_safe
    auto_link(html)
  end

  def render_markdown(content)
    Kramdown::Document.new(content, input: "GFM").to_html.html_safe
  end
end
