class FoodBooker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower


  attachment :profile_image

  validates :name, presence: true
  validates :introduction,
    length: { maximum: 50 }


  def favorited_by?(book_id)
    favorites.where(book_id: book_id).exists?
  end

  def follow(food_booker_id)
    relationships.create(followed_id: food_booker_id)
  end

  def unfollow(food_booker_id)
    relationships.find_by(followed_id: food_booker_id).destroy
  end

  def following?(food_booker)
    followings.include?(food_booker)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @food_booker = FoodBooker.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @food_booker = FoodBooker.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @food_booker = FoodBooker.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @food_booker = FoodBooker.where("name LIKE?","%#{word}%")
    else
      @food_booker = FoodBooker.all
    end
  end
end
