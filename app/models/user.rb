class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  # ニックネームが必須であること
  validates :nickname, presence:  true


  # パスワードは6文字以上であること
  validates :password, length: { minimum: 6 }
  
  # パスワードは半角英数字混合であること

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: 'Include both letters and numbers' }

  # ユーザー本名が、名字と名前がそれぞれ必須であること
  validates :first_name, presence: true
  validates :last_name, presence: true

  # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }

  # validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }

  # ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true

  # ユーザー本名のフリガナは全角（カタカナ）で入力させること
  validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
  validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }

  # 生年月日が必須であること
  validates :birth_date, presence: true

end