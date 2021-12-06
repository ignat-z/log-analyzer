# frozen_string_literal: true

# Emits the key from the passed string and the associated value to reduce
class SplittedStringValueMapper
  def call(record)
    key, value = record.split(' ')
    yield key, value
  end
end
