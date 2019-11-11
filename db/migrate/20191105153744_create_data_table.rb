class CreateDataTable < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.float :value
      t.integer :day
    end
  end
end
