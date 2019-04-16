class RemoveIndexFromSpots < ActiveRecord::Migration[5.2]
  def change
  	 remove_index :spots, :user_id
  end
end
