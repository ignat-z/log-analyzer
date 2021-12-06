# frozen_string_literal: true

require 'test_helper'
require 'reducers/values_sum_reducer'

describe ValuesSumReducer do
  describe '#call' do
    it 'returns summed values' do
      assert_equal(6, ValuesSumReducer.new.call(_, [1, 2, 3]))
    end
  end
end
