# frozen_string_literal: true

require 'test_helper'
require 'collectors/set_collector'

describe SetCollector do
  describe '#queues' do
    describe 'on initialize' do
      it 'returns empty hash as data' do
        assert_equal({}, SetCollector.new.queues)
      end
    end
  end

  it 'stores passed value in #queues' do
    collector = SetCollector.new
    collector.collect('key', 'value1')
    assert_equal({ 'key' => Set.new(['value1']) }, collector.queues)
  end

  it 'stores only unique values in the set' do
    collector = SetCollector.new
    collector.collect('key', 'value1')
    collector.collect('key', 'value2')
    collector.collect('key', 'value1')
    assert_equal({ 'key' => Set.new(%w[value1 value2]) }, collector.queues)
  end
end
