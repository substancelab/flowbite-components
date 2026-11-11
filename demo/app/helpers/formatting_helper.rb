require "rails_autolink"

module FormattingHelper
  class DocstringRenderer
    include YARD::Templates::Helpers::BaseHelper
    include YARD::Templates::Helpers::HtmlHelper

    Options = Data.define(:markup, :highlight)

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

      output = Kramdown::Document.new(content, input: "GFM", syntax_highlighter: nil).to_html
      view_context.highlight_code_blocks(remove_line_breaks(output))
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
        markup: :markdown,
        highlight: false
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
    highlight_code_blocks(Kramdown::Document.new(content, input: "GFM", syntax_highlighter: nil).to_html).html_safe
  end

  # Renders source as a syntax highlighted code block, formatted like the
  # source panels in Lookbook embeds.
  def highlight_code(source, language:)
    tag.div(
      Lookbook::CodeHighlighter.call(source.strip_heredoc.strip, language: language, line_numbers: true),
      class: "code-block numbered not-format theme-github"
    )
  end

  # Replaces the code blocks in html with syntax highlighted code blocks.
  def highlight_code_blocks(html)
    fragment = Nokogiri::HTML5.fragment(html)
    fragment.css("pre > code").each do |code|
      language = code["class"].to_s[/language-(\S+)/, 1] || "plaintext"
      code.parent.replace(highlight_code(code.text, language: language))
    end
    fragment.to_html
  end
end
