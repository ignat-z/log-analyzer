# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter 'test/'

  add_group 'Collectors', 'lib/collectors'
  add_group 'Input Formatters', 'lib/input_formatters'
  add_group 'Inputs', 'lib/inputs'
  add_group 'Jobs', 'lib/jobs'
  add_group 'Mappers', 'lib/mappers'
  add_group 'Output Formatters', 'lib/output_formatters'
  add_group 'Reducers', 'lib/reducers'
end

require 'minitest/autorun'
require 'minitest/hell'

module Minitest
  class Test
    parallelize_me!
    prove_it!
  end
end
