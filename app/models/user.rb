class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  # ニックネーム、ユーザー本名の名字と名前・フリガナの名字と名前がそれぞれ必須であること
  with_options presence: true do

    # nicknameには大文字小文字の区別がある事
    validates :nickname, uniqueness: { case_sensitive: true }

    # パスワードは半角英数字混合であること
    # enletters = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/
    # validates :password, format: { with: enletters, message: 'Include both letters and numbers' }

    # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
    kanji = /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name, format: { with: kanji, message: 'Full-width characters' }
    validates :last_name, format: { with: kanji, message: 'Full-width characters' }

    # ユーザー本名のフリガナは全角（カタカナ）で入力させること
    zenkana = /\A[ァ-ン]+\z/
    validates :first_name_kana, format: { with: zenkana, message: 'Full-width katakana characters' }
    validates :last_name_kana, format: { with: zenkana, message: 'Full-width katakana characters' }

    # 生年月日が必須であること
    validates :birth_date
  end

end