module MarkdownHelper
  def render_markdown(content)
    Kramdown::Document.new(content, input: "GFM").to_html.html_safe
  end
end
