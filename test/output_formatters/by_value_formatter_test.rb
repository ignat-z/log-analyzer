# frozen_string_literal: true

require './test/test_helper'
require 'output_formatters/by_value_formatter'

describe ByValueFormatter do
  let(:example_hash) { { b: 2, a: 3, c: 1 } }
  describe '#call' do
    it 'returns the hash results sorted by value' do
      result = ByValueFormatter.new(order: :asc).call(example_hash)
      assert_equal({ c: 1, b: 2, a: 3 }, result)
    end

    it 'supports descending order' do
      result = ByValueFormatter.new(order: :desc).call(example_hash)
      assert_equal({ a: 3, b: 2, c: 1 }, result)
    end
  end

  describe 'initialize' do
    it 'raises an exception for a wrong ordering' do
      assert_raises(ArgumentError) { ByValueFormatter.new(order: :wrong) }
    end
  end
end
