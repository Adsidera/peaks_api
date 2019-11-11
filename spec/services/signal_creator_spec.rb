require 'rails_helper'

RSpec.describe SignalCreator do
  let(:threshold_param) { rand(5..10).to_s }
  let(:sensitivity_param) { rand(50..100).to_s }
  let(:signal_creator) { SignalCreator.new(threshold_param, sensitivity_param) }

  describe "#initialize" do
    it 'initializes with threshold and sensitivity as floats' do
      expect(signal_creator.threshold).to eq(threshold_param.to_f)
      expect(signal_creator.sensitivity).to eq(sensitivity_param.to_f)
    end
  end

  describe "#send_signal" do
    before do
      @threshold = signal_creator.threshold
      @sensitivity = signal_creator.sensitivity
      @alert_margin = @threshold - (@threshold*(@sensitivity/100))
    end

    context "with data exceeding sensitivity margin" do
      before do
        @num = rand(@alert_margin..@threshold)
        @output_signal = signal_creator.send_signal(@num, @threshold, @sensitivity)
      end

      it "returns 1" do
        expect(@num).to be >= @alert_margin
        expect(@output_signal).to eq 1
      end
    end

    context "with data below sensitivity margin" do
      before do
        @num = rand(0.1..@alert_margin)
        @output_signal = signal_creator.send_signal(@num, @threshold, @sensitivity)
      end

      it "returns 0" do
        expect(@num).to be < @alert_margin
        expect(@output_signal).to eq 0
      end
    end
  end
end