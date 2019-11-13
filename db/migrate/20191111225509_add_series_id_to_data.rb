class AddSeriesIdToData < ActiveRecord::Migration[5.2]
  def up
    add_column :data, :series_id, :integer
    add_index :data, :series_id
  end

  def down
    remove_column :data, :series_id, :integer
    remove_index :data, :series_id
  end
end
