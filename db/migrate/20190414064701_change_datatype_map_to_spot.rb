class ChangeDatatypeMapToSpot < ActiveRecord::Migration[5.2]
  def change
  	add_column :spots, :mapid, :string
  	# add_index :spot, :mapid, unique: true
  end
end
