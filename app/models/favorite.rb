class Favorite < ApplicationRecord

  belongs_to :food_booker
  belongs_to :book

end
