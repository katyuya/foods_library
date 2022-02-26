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
end
