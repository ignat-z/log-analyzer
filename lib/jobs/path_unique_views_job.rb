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

  DESCRIPTION = {
    input_formatter: ReadlinesFormatter.new,
    output_formatter: ByValueFormatter.new(order: :desc),
    mapper_output_collector: SetCollector.new,
    reducer_output_collector: SingleValueCollector.new,
    reducer: ValuesLengthReducer.new,
    mapper: SplittedStringValueMapper.new,
    reporter: UNIQUE_VISITS_REPORTER
  }.freeze

  def initialize(path, description = DESCRIPTION)
    super()
    @path = path
    parse_description!(description)
  end

  attr_reader(*DESCRIPTION.keys)

  def input(reader: FileInput.new)
    reader.call(@path)
  end
end
