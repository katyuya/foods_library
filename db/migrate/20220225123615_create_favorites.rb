class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.integer :food_booker_id
      t.integer :book_id

      t.timestamps
    end
  end
end
