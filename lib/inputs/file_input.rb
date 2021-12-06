# frozen_string_literal: true

# Reads file and returns its content
class FileInput
  def initialize(file_klass: File)
    @file_klass = file_klass
  end

  def call(path)
    @file_klass.read(path)
  end
end
