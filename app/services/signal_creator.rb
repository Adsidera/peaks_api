class SignalCreator
  attr_reader :data, :threshold, :sensitivity

  def initialize(threshold, sensitivity)
    @threshold = threshold.to_f
    @sensitivity = sensitivity.to_f
  end

  def send_signal(num)
    if num >= alert_margin
      return 1
    else
      return 0
    end
  end

  def alert_margin
    threshold - (threshold * (sensitivity / 100))
  end
end
