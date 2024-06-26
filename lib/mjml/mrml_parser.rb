# frozen_string_literal: true

module Mjml
  class MrmlParser
    attr_reader :input

    # Create new parser
    #
    # @param input [String] The string to transform in html
    def initialize(input)
      @input = input
    end

    # Render mjml template
    #
    # @return [String]
    def render
      MRML.to_html(input)
    rescue NameError
      Mjml.logger.fatal('MRML is not installed. Please add `gem "mrml"` to your Gemfile.')
      raise
    rescue StandardError
      raise if Mjml.raise_render_exception

      ''
    end
  end
end
