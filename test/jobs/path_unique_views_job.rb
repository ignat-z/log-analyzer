# frozen_string_literal: true

require 'test_helper'
require 'jobs/path_views_job'

describe PathUniqueViewsJob do
  describe '#input' do
    it 'calls the passed reader' do
      reader = ->(value) { value }
      job = PathUniqueViewsJob.new('/path/to/file')
      assert_equal '/path/to/file', job.input(reader: reader)
    end
  end

  describe 'UNIQUE_VISITS_REPORTER' do
    it 'outputs formatted info' do
      assert_output(%r{/a 90 unique visits}) { PathUniqueViewsJob::UNIQUE_VISITS_REPORTER.call({ '/a' => 90 }) }
    end
  end
end
