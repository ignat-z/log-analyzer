# frozen_string_literal: true

# Provides info by splitting the input into lines
class ReadlinesFormatter
  def call(input)
    input.split("\n")
  end
end
