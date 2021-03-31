class Questionnaire < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :book_category
  belongs_to_active_hash :book_genre
  belongs_to_active_hash :purchase_place
  belongs_to_active_hash :reading_type

  # active_hashのデータ
  with_options numericality: { other_than: 0, message: 'must be other than 0' } do
    validates :book_category_id, :book_genre_id, :purchase_place_id, :reading_type_id
  end
end
