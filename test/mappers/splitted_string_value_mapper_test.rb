# frozen_string_literal: true

require 'test_helper'
require 'mappers/splitted_string_value_mapper'

describe SplittedStringValueMapper do
  describe '#call' do
    it 'returns the first string token and the associated value' do
      mapper = SplittedStringValueMapper.new
      result = mapper.call('this is an example') { |token, count| [token, count] }

      assert_equal(%w[this is], result)
    end
  end
end
