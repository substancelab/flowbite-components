Rails.application.configure do
  config.view_component.previews.default_layout = "preview"

  Lookbook.after_initialize do |lookbook|
    Lookbook::PageController.helper(Lookbook::DocHelper)
  end
end
