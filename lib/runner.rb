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
    job1 = PathViewsJob.new(@path)
    job2 = PathUniqueViewsJob.new(@path)

    JobRunner.new(job1).call
    puts
    JobRunner.new(job2).call
  end
end
