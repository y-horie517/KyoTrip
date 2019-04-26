class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :name, null: false
    	t.string :description
    	t.string :address
    	t.text	 :url
    	t.references  :category, foreign_key: true
    	# t.references  :user, foreign_key: true
      t.integer :user_id
      t.integer :visitcount,  default: '0'
      t.integer :favoritecount, default: '0'
      t.integer :reviewcount, default: '0'

      t.string :mapid, unique: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
