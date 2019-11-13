require 'rails_helper'

RSpec.describe SeriesSerializer do
  before do
    series = Fabricate(:series)
    Fabricate(:datum, series_id: series.id)
    @serializer = SeriesSerializer.new(series)
    @serialized_response = @serializer.serializable_hash
  end

  it 'has data values attribute' do
    expect(@serializer.attributes).to include(:data_values)
  end

  it 'has data values attribute' do
    expect(@serializer.attributes).to include(:signals)
  end

  it 'has data values attribute' do
    expect(@serializer.attributes).to include(:days)
  end
end