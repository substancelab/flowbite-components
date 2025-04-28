# frozen_string_literal: true

module Flowbite
  class Style
    attr_reader :classes

    delegate :fetch, to: :classes

    def initialize(classes)
      @classes = classes
    end
  end
end
