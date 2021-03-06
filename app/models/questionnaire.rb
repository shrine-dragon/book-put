class Questionnaire < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :category
  belongs_to_active_hash :genre
  belongs_to_active_hash :purchase_place
  belongs_to_active_hash :reading_media

  # ActiveHashのデータ
  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id, :genre_id, :purchase_place_id, :reading_media_id
  end
end
