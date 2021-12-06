# frozen_string_literal: true

require './lib/collectors/list_collector'
require './lib/collectors/single_value_collector'
require './lib/reducers/values_sum_reducer'
require './lib/mappers/splitted_string_entity_mapper'
require './lib/output_formatters/by_value_formatter'
require './lib/input_formatters/readlines_formatter'
require './lib/inputs/file_input'

# This job calculates the number of page views for each path
class PageViewsJob
  VISITS_REPORTER = lambda do |result|
    result.each { |path, count| puts "#{path} #{count} visits" }
  end

  def initialize(path)
    @path = path
  end

  def input
    FileInput.new.call(@path)
  end

  def input_formatter
    @input_formatter ||= ReadlinesFormatter.new
  end

  def reporter
    @reporter ||= VISITS_REPORTER
  end

  def output_formatter
    @output_formatter ||= ByValueFormatter.new(order: :desc)
  end

  def mapper_output_collector
    @mapper_output_collector ||= ListCollector.new
  end

  def reducer_output_collector
    @reducer_output_collector ||= SingleValueCollector.new
  end

  def reducer
    @reducer ||= ValuesSumReducer.new
  end

  def mapper
    @mapper ||= SplittedStringEntityMapper.new
  end
end
