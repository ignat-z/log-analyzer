# frozen_string_literal: true

require 'set'

# Collects passed values by adding them to a set associated with a key.
# This collector shines when it's necessary to collect unique values
class SetCollector
  def initialize
    @result = Hash.new { |hash, key| hash[key] = Set.new }
  end

  def collect(key, value)
    @result[key] << value
  end

  def queues
    @result
  end
end
