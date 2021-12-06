# frozen_string_literal: true

require './lib/jobs/base_job'
require './lib/collectors/set_collector'
require './lib/collectors/single_value_collector'
require './lib/reducers/values_length_reducer'
require './lib/mappers/splitted_string_value_mapper'
require './lib/output_formatters/by_value_formatter'
require './lib/input_formatters/readlines_formatter'
require './lib/inputs/file_input'

# This job calculates the number of unique path views for each path
class PathUniqueViewsJob < BaseJob
  UNIQUE_VISITS_REPORTER = lambda do |result|
    result.each { |path, count| puts "#{path} #{count} unique visits" }
  end

  def initialize(path)
    super()
    @path = path
  end

  def input
    FileInput.new.call(@path)
  end

  def input_formatter
    @input_formatter ||= ReadlinesFormatter.new
  end

  def reporter
    @reporter ||= UNIQUE_VISITS_REPORTER
  end

  def output_formatter
    @output_formatter ||= ByValueFormatter.new(order: :desc)
  end

  def mapper_output_collector
    @mapper_output_collector ||= SetCollector.new
  end

  def reducer_output_collector
    @reducer_output_collector ||= SingleValueCollector.new
  end

  def reducer
    @reducer ||= ValuesLengthReducer.new
  end

  def mapper
    @mapper ||= SplittedStringValueMapper.new
  end
end
