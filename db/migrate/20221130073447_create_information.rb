class CreateInformation < ActiveRecord::Migration[6.1]
  def change
    create_table :information do |t|
      t.integer :shop_id, null: false
      t.date :created_at_gteq, null: false
      t.date :created_at_lteq_end_of_day, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
