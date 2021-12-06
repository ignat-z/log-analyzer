# frozen_string_literal: true

require 'test_helper'
require 'input_formatters/readlines_formatter'

describe ReadlinesFormatter do
  describe '#call' do
    it 'returns the lines of the passed string' do
      result = ReadlinesFormatter.new.call("1\n2\n3\n")
      assert_equal(%w[1 2 3], result)
    end
  end
end
