class AddCountToSpots < ActiveRecord::Migration[5.2]
  def change
  	add_column :spots, :visitcount, :integer, default: '0'
  	add_column :spots, :favoritecount, :integer, default: '0'
  	add_column :spots, :reviewcount, :integer, default: '0'
  	add_column :spots, :map_id, :integer
  end
end
