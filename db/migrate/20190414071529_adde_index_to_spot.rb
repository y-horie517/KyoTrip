class AddeIndexToSpot < ActiveRecord::Migration[5.2]
  def change
  	add_index :spots, :mapid, unique: true
  end
end
