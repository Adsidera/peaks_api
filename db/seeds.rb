require 'csv'

data = CSV.read("data.csv")

data.each_with_index do |data, series_index|
  Series.create
  float_array = data.first.split(";").map { |num| num.to_f }
  float_array.each_with_index do |float, index|
    Datum.create(value: float, day: (index + 1), series_id: (series_index +1) )
  end
end