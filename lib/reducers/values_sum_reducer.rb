# frozen_string_literal: true

# Reduces the values of a given key by summing them up.
class ValuesSumReducer
  def call(_key, values)
    values.sum
  end
end
