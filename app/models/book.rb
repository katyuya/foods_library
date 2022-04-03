class Book < ApplicationRecord

  belongs_to :food_booker
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :book_tags, dependent: :destroy
  has_many :tag_lists, through: :book_tags, dependent: :destroy
  attachment :image

  validates :image, presence: true
  validates :food_name, presence: true
  validates :food_introduction, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("food_name LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("food_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("food_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("food_name LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end
