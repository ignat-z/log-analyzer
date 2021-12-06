# frozen_string_literal: true

require './test/test_helper'
require 'mappers/splitted_string_entity_mapper'

describe SplittedStringEntityMapper do
  describe '#call' do
    it 'returns the first string token and 1' do
      mapper = SplittedStringEntityMapper.new
      result = mapper.call('this is an example') { |token, count| [token, count] }

      assert_equal(['this', 1], result)
    end
  end
end
