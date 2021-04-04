class Book < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_many         :comments
  belongs_to       :book_category
  belongs_to       :book_genre

  with_options presence: true do
    validates :image, :title
    validates :content, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :book_category_id, :book_genre_id    
  end
end