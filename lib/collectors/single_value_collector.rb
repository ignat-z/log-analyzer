# frozen_string_literal: true

# Collects passed value by associating it with a key.
class SingleValueCollector
  def initialize
    @result = {}
  end

  def collect(key, value)
    @result[key] = value
  end

  def queues
    @result
  end
end
