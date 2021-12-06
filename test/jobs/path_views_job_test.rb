# frozen_string_literal: true

require 'test_helper'
require 'jobs/path_views_job'

describe PathViewsJob do
  describe '#input' do
    it 'calls the passed reader' do
      reader = ->(value) { value }
      job = PathViewsJob.new('/path/to/file')
      assert_equal '/path/to/file', job.input(reader: reader)
    end
  end

  describe 'VISITS_REPORTER' do
    it 'outputs formatted info' do
      assert_output(%r{/a 90 visits}) { PathViewsJob::VISITS_REPORTER.call({ '/a' => 90 }) }
    end
  end
end
