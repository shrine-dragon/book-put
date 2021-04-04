class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached       :image
  has_one                :questionnaire
  belongs_to             :gender
  has_many               :books
  has_many               :comments

  with_options presence: true do
    validates :nickname, length: { maximum: 12 }
    validates :birth_day, :email
    validates :password, length: { minimum: 12, maximum: 20 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数混合で入力してください' }
  end
  # active_hashのデータ
  validates :gender_id, numericality: { other_than: 0, message: 'を入力してください' }
end
