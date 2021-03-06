# frozen_string_literal: true

# Emits the key from the passed string and one as the value to reduce
class SplittedStringEntityMapper
  def call(record)
    key, = record.split(' ')
    yield key, 1
  end
end
