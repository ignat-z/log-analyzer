# frozen_string_literal: true

require './test/test_helper'
require 'inputs/file_input'

class FakeInput
  def read(*args)
    args
  end
end

describe FileInput do
  it 'calls read on the passed file klass' do
    assert_equal(
      ['foo'],
      FileInput.new(file_klass: FakeInput.new).call('foo')
    )
  end
end
