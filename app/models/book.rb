class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  has_one_attached :image
  has_many         :comments, dependent: :destroy

  def self.search(search)
    if search != ""
      Book.where('text LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :image,    presence: { message: 'を添付してください' }
    validates :title,      length: { maximum: 50 }
    validates :catch_copy, length: { maximum: 30 }
    validates :content,    length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id, :genre_id
  end
end
