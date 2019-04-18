class RemoveFkeyFromSpots < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :spots, :user
  end
end
