require "test_helper"

class SitemapControllerTest < ActionDispatch::IntegrationTest
  test "returns 200" do
    get "/sitemap.xml"
    assert_response :success
  end

  test "returns xml content type" do
    get "/sitemap.xml"
    assert_includes response.content_type, "xml"
  end

  test "includes root url" do
    get "/sitemap.xml"
    assert_includes response.body, root_url
  end

  test "includes doc page urls" do
    get "/sitemap.xml"
    Page.all.each do |page|
      assert_includes response.body, docs_page_url(page.slug)
    end
  end

  test "includes components index url" do
    get "/sitemap.xml"
    assert_includes response.body, docs_component_url("Flowbite")
  end
end
