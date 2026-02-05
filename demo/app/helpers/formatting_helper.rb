module FormattingHelper
  class DocstringRenderer
    include YARD::Templates::Helpers::BaseHelper
    include YARD::Templates::Helpers::HtmlHelper

    Options = Data.define(:markup)

    def initialize(content, code_object: nil)
      @content = content
      @code_object = code_object
    end

    # Called by YARD::Templates::Helpers::HtmlHelper#htmlify to render the
    # docstring content. The default implementation simply returns the content
    # as is, but you can override this method to provide custom rendering logic
    # based on the specified markup format.
    def html_markup_markdown(content)
      Kramdown::Document.new(content, input: "GFM").to_html
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

    def remove_forced_line_breaks(text)
      text.gsub(/(\S)\n(\S)/, '\1 \2')
    end
  end

  def render_docstring(content, code_object: nil)
    DocstringRenderer.new(content, code_object: code_object).render.html_safe
  end

  def render_markdown(content)
    Kramdown::Document.new(content, input: "GFM").to_html.html_safe
  end
end
