# frozen_string_literal: true

require './test/test_helper'
require './lib/reducers/values_length_reducer'

describe ValuesLengthReducer do
  describe '#call' do
    it 'returns the size of the values' do
      assert_equal(3, ValuesLengthReducer.new.call(_, [1, 2, 3]))
    end
  end
end
