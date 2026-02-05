module FormattingHelper
  class DocstringRenderer
    def initialize(content)
      @content = content
    end

    def render
      return "" if @content.blank?

      content = remove_forced_line_breaks(@content)
      Kramdown::Document.new(content, input: "GFM").to_html.html_safe
    end

    private

    def remove_forced_line_breaks(text)
      text.gsub(/(\S)\n(\S)/, '\1 \2')
    end
  end

  def render_docstring(content)
    DocstringRenderer.new(content).render
  end

  def render_markdown(content)
    Kramdown::Document.new(content, input: "GFM").to_html.html_safe
  end
end
