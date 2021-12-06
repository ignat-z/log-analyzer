# frozen_string_literal: true

require './lib/path_views_job'
require './lib/job_runner'

# This is the main class that does all the work.
class Runner
  def initialize(path)
    @path = path
  end

  def call
    job = PathViewsJob.new(@path)
    JobRunner.new(job).call
  end
end
