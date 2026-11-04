require "test_helper"

class Docs::ComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @original_ogkit_api_key = ENV["OGKIT_API_KEY"]
    ENV["OGKIT_API_KEY"] = "test-api-key"
  end

  teardown do
    ENV["OGKIT_API_KEY"] = @original_ogkit_api_key
  end

  test "includes Open Graph image from OG Kit" do
    get docs_component_path("Flowbite::Button")

    page_url = "#{docs_component_url("Flowbite::Button")}?v=#{Flowbite::Components::VERSION}"
    image_url = "https://ogkit.dev/img/test-api-key.jpeg?url=#{ERB::Util.url_encode(page_url)}"
    assert_select "meta[property='og:image'][content=?]", image_url
    assert_select "meta[name='twitter:image'][content=?]", image_url
    assert_select "meta[property='og:image:height'][content='630']"
    assert_select "meta[property='og:image:width'][content='1200']"
  end

  test "omits Open Graph image when OGKIT_API_KEY is not set" do
    ENV.delete("OGKIT_API_KEY")
    get docs_component_path("Flowbite::Button")

    assert_select "meta[property='og:image']", count: 0
    assert_select "meta[name='twitter:image']", count: 0
    assert_select "meta[property='og:image:width']", count: 0
  end

  test "includes Open Graph title and description" do
    get docs_component_path("Flowbite::Button")

    assert_select "meta[property='og:title'][content=?]", "Flowbite::Button"
    assert_select "meta[property='og:description'][content^=?]", "Renders a HTML button element."
  end

  test "renders the example preview in the OG Kit template" do
    get docs_component_path("Flowbite::Button")

    template = Nokogiri::HTML(response.body).at_css("template[data-og-template]")
    assert_includes template.inner_html, "<button"
  end

  test "renders the OG Kit template for components without previews" do
    get docs_component_path("Flowbite")

    assert_select "template[data-og-template]"
  end
end
