class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|

      t.integer :food_booker_id
      t.integer :book_id

      t.text :comment

      t.timestamps
    end
  end
end
