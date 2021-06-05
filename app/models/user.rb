class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached       :image
  has_one                :questionnaire
  belongs_to_active_hash :gender
  has_many               :books,    dependent: :destroy
  has_many               :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :birth_day, :email
    validates :password, length: { minimum: 12, maximum: 20 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数混合で入力してください' }
  end

  # ActiveHashのデータ
  validates :gender_id, numericality: { other_than: 0, message: 'を選択してください' }
end
