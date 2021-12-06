# frozen_string_literal: true

# This module mimics some real job methods
module FakeJob
  def mapper(value)
    value.chars.each do |c|
      yield(c, 1)
    end
  end

  def reducer(_key, values)
    values.sum
  end

  class FakeCollector
    def initialize
      @result = Hash.new { |h, k| h[k] = [] }
    end

    def collect(key, value)
      @result[key] << value
    end

    def queues
      @result
    end
  end
end
