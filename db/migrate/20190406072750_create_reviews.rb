class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, default: "無題"
      t.text :body
      t.references  :spot, foreign_key: true
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
