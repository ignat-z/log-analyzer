# frozen_string_literal: true

require 'test_helper'
require 'jobs/base_job'

describe BaseJob do
  BaseJob::REQUIRED_METHODS.each do |method_name|
    describe "##{method_name}" do
      it 'raises an error' do
        assert_raises { BaseJob.new.public_send(method_name) }
      end
    end
  end
end
