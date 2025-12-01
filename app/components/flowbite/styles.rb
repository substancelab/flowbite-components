# frozen_string_literal: true

module Flowbite
  class Styles
    class StyleNotFoundError < ::KeyError; end

    class << self
      def from_hash(styles_hash)
        styles = Styles.new
        styles_hash.each do |style_name, states_hash|
          styles.add_style(style_name, states_hash)
        end
        styles
      end
    end

    def add_style(style_name, states_hash)
      @styles[style_name] = Flowbite::Style.new(states_hash)
    end

    def fetch(style_name)
      return @styles.fetch(style_name) if @styles.key?(style_name)

      raise \
        StyleNotFoundError,
        "Style not found: #{style_name}. Available styles: " \
        "#{@styles.keys.sort.join(", ")}"
    end

    def initialize
      @styles = {}
    end
  end
end
