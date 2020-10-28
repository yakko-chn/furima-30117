class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  VALID_EMAIL = /\A\S+@\S+\.\S+\z/.freeze
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates  :password, confirmation: true, format: { with: VALID_PASSWORD }
  validates  :password_confirmation, presence: true

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/.freeze} , presence: true do
    validates  :first_name
    validates  :last_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/.freeze} , presence: true do
    validates  :first_name_kana
    validates  :last_name_kana
  end
end
