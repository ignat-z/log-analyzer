# frozen_string_literal: true

require 'minitest/autorun'
require './lib/runner'

describe Runner do
  describe '#call' do
    it 'returns :result' do
      assert_equal :result, Runner.new.call
    end
  end
end
