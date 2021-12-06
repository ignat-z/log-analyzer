# frozen_string_literal: true

require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names', '-A']
end

task default: %i[test rubocop]
