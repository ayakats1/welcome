class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :shop_id, null: false
      t.date :created_at_gteq, null: false
      t.date :created_at_lteq_end_of_day, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
