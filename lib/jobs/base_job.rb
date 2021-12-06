# frozen_string_literal: true

# Base class for jobs
class BaseJob
  def initialize; end

  %w[
    input
    input_formatter
    reporter
    output_formatter
    mapper_output_collector
    reducer_output_collector
    reducer
    mapper
  ].each do |method_name|
    define_method(method_name) do
      raise "You must define #{method_name} method in your job class"
    end
  end
end
