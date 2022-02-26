class BookTag < ApplicationRecord

  belongs_to :tag_list
  belongs_to :book

end
