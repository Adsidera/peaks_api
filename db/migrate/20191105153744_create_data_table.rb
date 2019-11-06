class CreateDataTable < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.float :value
      t.integer :day
      t.references :series, foreign_key: true
    end
  end
end
