# frozen_string_literal: true

require 'ostruct'
require 'minitest/autorun'
require './test/lib/fake_job'
require './lib/job_runner'

describe JobRunner do
  include FakeJob

  let(:input) { 'hello' }
  let(:input_formatter) { ->(value) { [value] } }
  let(:output_formatter) { ->(value) { value } }
  let(:void_reporter) { ->(*) {} }

  let(:job_description) do
    OpenStruct.new(
      input: input,
      input_formatter: input_formatter,
      mapper: method(:mapper),
      mapper_output_collector: FakeJob::FakeCollector.new,
      reducer: method(:reducer),
      reducer_output_collector: FakeJob::FakeCollector.new,
      output_formatter: output_formatter,
      reporter: void_reporter
    )
  end

  describe '#call' do
    it 'combines input parsing, mapping, reducing and formatting' do
      assert_equal(
        { 'h' => [1], 'e' => [1], 'l' => [2], 'o' => [1] },
        JobRunner.new(job_description).call
      )
    end
  end
end
