class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
    	t.string :name, null: false
    	t.string :description
    	t.string :address
    	t.text	 :url
    	t.references  :category, foreign_key: true
    	t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
