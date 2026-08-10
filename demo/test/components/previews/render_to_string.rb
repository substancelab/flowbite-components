# frozen_string_literal: true

# Shared by Lookbook previews that build slot content by rendering a
# component directly (e.g. a Breadcrumb::Item or Pagination::Link). Calling
# +render+ from inside a slot block doesn't behave like it does in an ERB
# template, so previews need to render the component to a string explicitly.
module RenderToString
  private

  def render_to_string(component)
    ApplicationController.render(component, layout: false)
  end
end
