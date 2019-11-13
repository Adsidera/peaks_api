class Datum < ApplicationRecord
  belongs_to :series

  def output_signal(threshold, sensitivity)
    SignalCreator.new(threshold, sensitivity).send_signal(value)
  end
end
