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

  describe 'parse_description!' do
    it 'sets the passed values as instance variables' do
      new_job = BaseJob.new
      new_job.parse_description!({ a: 1, b: 2 })
      assert_equal 1, new_job.instance_variable_get(:@a)
      assert_equal 2, new_job.instance_variable_get(:@b)
    end
  end
end
