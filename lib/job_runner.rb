# frozen_string_literal: true

# This class runs the passed parsing job
class JobRunner
  def initialize(job)
    @job = job
  end

  def call
    mapper_inputs.each do |record|
      map_input!(record)
    end

    reducer_inputs.each do |key, values|
      reduce_input!(key, values)
    end

    format_result.tap { |result| @job.reporter.call(result) }
  end

  private

  def format_result
    @job.output_formatter.call(@job.reducer_output_collector.queues)
  end

  def mapper_inputs
    @job.input_formatter.call(@job.input)
  end

  def reducer_inputs
    @job.mapper_output_collector.queues
  end

  def reduce_input!(key, values)
    @job.reducer_output_collector.collect(key, @job.reducer.call(key, values))
  end

  def map_input!(record)
    @job.mapper.call(record) do |key, value|
      @job.mapper_output_collector.collect(key, value)
    end
  end
end
