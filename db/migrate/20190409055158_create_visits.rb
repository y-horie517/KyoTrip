class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references  :spot, foreign_key: true
      t.references  :user, foreign_key: true
      t.datetime :date
      t.integer :visitcount
      t.timestamps
    end
  end
end
