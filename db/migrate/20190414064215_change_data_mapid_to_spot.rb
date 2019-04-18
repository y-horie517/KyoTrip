class ChangeDataMapidToSpot < ActiveRecord::Migration[5.2]
  def change
  	change_column :spot, :map_id, :string
  	add_index :spot, :map_id, unique: true
  	add_index :spot, :map_id, unique: true
  end
end
