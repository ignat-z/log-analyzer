# frozen_string_literal: true

# Reduces the values of a given key by the length of the values
class ValuesLengthReducer
  def call(_key, values)
    values.length
  end
end
