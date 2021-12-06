#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

options_parser = OptionParser.new('Usage: parser.rb [path]')
arguments = options_parser.parse!

if arguments.empty?
  puts 'No path given'
  puts options_parser.banner
  exit
end

puts arguments[0]
