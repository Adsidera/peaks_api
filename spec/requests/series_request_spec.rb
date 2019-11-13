require 'rails_helper'

RSpec.describe "Series Request", type: :request do
  before do
    series = Series.create
    @data = (1..50).to_a.each { |day| Fabricate(:datum, series_id: series.id, day: day) }
  end

  context 'without any params' do
    it 'returns add threshold error for no params' do
      get api_v1_series_index_path
      expect(response.body).to match("error")
      expect(response.body).to match("Please add threshold and a sensitivity params")
    end
  end

  context 'with threshold and sensitivity params' do
    before do
      get api_v1_series_index_path, params: { threshold: 10, sensitivity: 50 }
      @parsed_response = JSON.parse(response.body)
      @parsed_first_series = @parsed_response.first[1][0]
    end

    it 'returns a series of 50 data with appended data' do
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(response.body).to include("id")
      expect(response.body).to include("data_values")
      expect(@parsed_first_series["data_values"]).not_to be_empty
      expect(@parsed_first_series["data_values"].size).to eq 50
    end

    it 'returns 50 signals for each datum' do
      expect(@parsed_first_series["signals"]).not_to be_empty
      expect(@parsed_first_series["signals"].size).to eq 50
    end

    it 'returns 50 days' do
      expect(@parsed_first_series["days"]).to eq (1..50).to_a
    end
  end

  context 'with start and date params' do
    before do
      get api_v1_series_index_path, params: { threshold: 10, sensitivity: 50, start: 10, end: 15}
      @parsed_response = JSON.parse(response.body)
      @parsed_first_series = @parsed_response.first[1][0]
    end

    it 'returns data from start to end day' do
      expect(@parsed_first_series["data_values"].size).to eq (10..15).to_a.size
    end

    it 'returns days from start to end day' do
      expect(@parsed_first_series["days"].size).to eq (10..15).to_a.size
    end

    it 'returns signal from start to end day' do
      expect(@parsed_first_series["signals"].size).to eq (10..15).to_a.size
    end
  end
end