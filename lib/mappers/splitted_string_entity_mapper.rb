# frozen_string_literal: true

# Emits the key from the passed string and one as the value to reduce
class SplittedStringEntityMapper
  def call(record)
    path, = record.split(' ')
    yield path, 1
  end
end
