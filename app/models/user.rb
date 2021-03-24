class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one    :questionnaire
  belongs_to :gender
  has_many   :books
  has_many   :comments

  with_options presence: true do
    validates :nickname, :birth_day
    validates :password, length: { minimum: 12, maximum: 20 },
              format:  { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers.' }
  end
  # active_hashのデータ
  validates :gender, numericality: { other_than: 0, message: 'must be other than 0' }
end
