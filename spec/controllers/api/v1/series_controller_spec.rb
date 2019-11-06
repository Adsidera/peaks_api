require 'rails_helper'

RSpec.describe API::V1::SeriesController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'has status code 200' do
      expect(response.status).to eq 200
    end

    it 'lists all series' do
      expect(response.body).to include(series)
      expect(response.body).not_to be_empty
    end
  end
end