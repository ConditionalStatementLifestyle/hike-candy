class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :title
      t.float :rating
      t.string :content
      t.integer :user_id
      t.string :date
      t.string :region

      t.timestamps
    end
  end
end
