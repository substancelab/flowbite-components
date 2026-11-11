# frozen_string_literal: true

class Docs::CodeExample < ViewComponent::Base
  def initialize(source:, language: "erb")
    @source = source
    @language = language
  end

  def call
    helpers.highlight_code(@source, language: @language)
  end
end
