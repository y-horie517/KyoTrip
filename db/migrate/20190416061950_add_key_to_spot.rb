class AddKeyToSpot < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :spots, :areas
  end
end
