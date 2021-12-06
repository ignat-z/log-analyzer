# frozen_string_literal: true

# Sorts passed hash by value accordin to the passed order
class ByValueFormatter
  SUPPORTED_ORDERS = %w[asc desc].freeze

  def initialize(order:)
    raise ArgumentError, 'Only asc and desc orders allowed' unless SUPPORTED_ORDERS.include?(order.to_s)

    @order = order
  end

  def call(data)
    data.sort_by { |(_k, value)| @order == :asc ? value : -value }.to_h
  end
end
