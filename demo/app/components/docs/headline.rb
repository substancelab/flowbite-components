class Docs::Headline < ViewComponent::Base
  def call
    content_tag(tag, content, class: classes)
  end
end
