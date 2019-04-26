class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :body
      t.references  :spot, foreign_key: true
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
