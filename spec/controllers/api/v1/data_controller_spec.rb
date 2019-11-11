require 'rails_helper'

RSpec.describe API::V1::DataController, type: :controller do
  describe "#index" do
    before do
      (1..50).map { |day| Fabricate(:datum, day: day) }
    end

    it "returns all data and related signals with no params" do
      get :index
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body)["days"]).to eq (1..50).to_a
    end

    it "returns data and related signals with start and end params" do
      get :index, params: { start: "10", end: "20"}
      expect(response.status).to eq 200
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body)["days"]).to eq (10..20).to_a
    end

    it "returns a no result found" do
      Datum.destroy_all
      get :index
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(parsed_response).to include "error"
      expect(parsed_response["error"]).to match "No results found"
    end
  end
end