module ApplicationHelper
  # Returns the URL of the OG Kit generated Open Graph image for the page at
  # page_url. OG Kit renders the <template data-og-template> found on that page.
  #
  # OG Kit caches images indefinitely per page URL, so the gem version is added
  # to the page URL to generate fresh images for every release.
  #
  # Returns nil if the OGKIT_API_KEY environment variable isn't set.
  def ogkit_image_url(page_url)
    api_key = ENV["OGKIT_API_KEY"]
    return nil if api_key.blank?

    versioned_page_url = "#{page_url}?v=#{Flowbite::Components::VERSION}"
    "https://ogkit.dev/img/#{api_key}.jpeg?url=#{ERB::Util.url_encode(versioned_page_url)}"
  end
end
