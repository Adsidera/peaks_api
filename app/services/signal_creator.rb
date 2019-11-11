class SignalCreator
  attr_reader :data, :threshold, :sensitivity

  def initialize(threshold, sensitivity)
    @threshold = threshold.to_f
    @sensitivity = sensitivity.to_f
  end

  def analyse(data)
    data.map { |value| send_signal(value, threshold, sensitivity) }
  end

  def send_signal(num, threshold, sensitivity)
    alert_margin = threshold - (threshold * (sensitivity / 100))
    if num >= alert_margin
      return 1
    else
      return 0
    end
  end
end
