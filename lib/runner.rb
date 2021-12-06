# frozen_string_literal: true

require './lib/jobs/path_views_job'
require './lib/jobs/path_unique_views_job'
require './lib/job_runner'

# This is the main class that does all the work.
class Runner
  def initialize(path)
    @path = path
  end

  def call
    [
      PathViewsJob.new(@path),
      PathUniqueViewsJob.new(@path)
    ].each do |job|
      JobRunner.new(job).call
      puts
    end
  end
end
