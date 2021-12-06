# frozen_string_literal: true

require './test/test_helper'
require './lib/collectors/single_value_collector'

describe SingleValueCollector do
  describe '#queues' do
    describe 'on initialize' do
      it 'returns empty hash as data' do
        assert_equal({}, SingleValueCollector.new.queues)
      end
    end
  end

  it 'stores passed value in #queues' do
    collector = SingleValueCollector.new
    collector.collect('key', 'value1')
    assert_equal({ 'key' => 'value1' }, collector.queues)
  end

  it 'overridess passed values with the same key' do
    collector = SingleValueCollector.new
    collector.collect('key', 'value1')
    collector.collect('key', 'value2')
    assert_equal({ 'key' => 'value2' }, collector.queues)
  end
end
