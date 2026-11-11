Rails.application.configure do
  config.view_component.previews.default_layout = "preview"

  config.lookbook.preview_display_options = {
    theme: %w[light dark]
  }

  # The theme of previews embedded in the docs follows the site theme
  config.lookbook.preview_embeds.display_option_controls = false
end
