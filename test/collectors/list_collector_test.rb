# frozen_string_literal: true

require './test/test_helper'
require './lib/collectors/list_collector'

describe ListCollector do
  describe '#queues' do
    describe 'on initialize' do
      it 'returns empty hash as data' do
        assert_equal({}, ListCollector.new.queues)
      end
    end
  end

  it 'stores passed value in #queues' do
    collector = ListCollector.new
    collector.collect('key', 'value1')
    assert_equal({ 'key' => %w[value1] }, collector.queues)
  end

  it 'aggregates passed values in a list' do
    collector = ListCollector.new
    collector.collect('key', 'value1')
    collector.collect('key', 'value2')
    assert_equal({ 'key' => %w[value1 value2] }, collector.queues)
  end
end
