class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :food_booker_id
      t.string :image_id
      t.string :food_name, null: false
      t.text :food_introduction, null: false
      t.string :restaurant
      t.string :material
      t.text :cooking

      t.timestamps
    end
  end
end
