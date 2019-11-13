class SeriesSerializer < ActiveModel::Serializer
  include AmsLazyRelationships::Core

  attributes :id, :start_date, :end_date

  lazy_relationship :data

  attribute :data_values do
    if start_date && end_date
      lazy_data.where(day: start_date..end_date).map(&:value)
    else
      lazy_data.map(&:value)
    end
  end

  attribute :days do
    if start_date && end_date
      (start_date.to_i..end_date.to_i).to_a
    else
      (1..50).to_a
    end
  end

  attribute :signals do
    if start_date && end_date
      lazy_data.where(day: start_date..end_date).map { |datum| datum.output_signal(threshold, sensitivity) }
    else
      lazy_data.map { |datum| datum.output_signal(threshold, sensitivity) }
    end
  end

  def start_date
    instance_options[:start]
  end

  def end_date
    instance_options[:end]
  end

  def threshold
    instance_options[:threshold]
  end

  def sensitivity
    instance_options[:sensitivity]
  end
end
