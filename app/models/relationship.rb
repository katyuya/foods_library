class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "FoodBooker"
  belongs_to :followed, class_name: "FoodBooker"

end
