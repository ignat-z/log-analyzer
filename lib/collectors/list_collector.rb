# frozen_string_literal: true

# Collects passed values by adding them to a list associated with a key.
class ListCollector
  def initialize
    @result = Hash.new { |hash, key| hash[key] = [] }
  end

  def collect(key, value)
    @result[key] << value
  end

  def queues
    @result
  end
end
