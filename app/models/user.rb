class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームが必須であること
  validates :nickname, presence: true

  # メールアドレスが必須であること
  # メールアドレスが一意性であること
  # メールアドレスは、@を含む必要があること, presence: true
  VALID_EMAIL = /\A\S+@\S+\.\S+\z/.freeze
  validates :email, uniqueness: true, format: { with: VALID_EMAIL }

  # パスワードが必須であること
  # パスワードは、6文字以上での入力が必須であること
  # パスワードは、半角英数字混合での入力が必須であること
  # パスワードは、確認用を含めて2回入力すること
  # パスワードとパスワード（確認用）、値の一致が必須であること, presence: true, length: {minimum: 6}
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates  :password, confirmation: true, format: { with: VALID_PASSWORD }
  validates  :password_confirmation, presence: true

  # ユーザー本名は、名字と名前がそれぞれ必須であること
  # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
  # ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
  # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
  FULL_NAME = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates  :first_name, presence: true, format: { with: FULL_NAME }
  validates  :last_name, presence: true, format: { with: FULL_NAME }

  FULL_NAME_KANA = /\A[ァ-ヶー－]+\z/.freeze
  validates  :first_name_kana, presence: true, format: { with: FULL_NAME_KANA }
  validates  :last_name_kana, presence: true, format: { with: FULL_NAME_KANA }

  # 生年月日が必須であること
  validates  :birthday, presence: true
end
