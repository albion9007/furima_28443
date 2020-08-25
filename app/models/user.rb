class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    kanji = /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name, format: { with: kanji, message: 'Full-width characters' }
    validates :last_name, format: { with: kanji, message: 'Full-width characters' }
    zenkana = /\A[ァ-ン]+\z/
    validates :first_name_kana, format: { with: zenkana, message: 'Full-width katakana characters' }
    validates :last_name_kana, format: { with: zenkana, message: 'Full-width katakana characters' }
    validates :birth_date
  end



end