Rails.application.configure do
  config.view_component.previews.default_layout = "preview"

  config.lookbook.preview_display_options = {
    theme: %w[light dark]
  }
end
