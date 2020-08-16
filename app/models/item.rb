class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :shipplace
  belongs_to_active_hash :shipday
  has_one_attached :image



  # 画像は1枚必須であること(ActiveStorageを使用すること)
  # 商品名が必須であること
  # 商品の説明が必須であること
  # カテゴリーの情報が必須であること
  # 商品の状態についての情報が必須であること
  # 配送料の負担についての情報が必須であること
  # 発送元の地域についての情報が必須であること
  # 発送までの日数についての情報が必須であること
  # 価格についての情報が必須であること
  # 価格の範囲が、¥300~¥9,999,999の間であること

  
  
  #空の投稿を保存できないようにする
  # validates :title, :text, :category, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  # validates :category_id, numericality: { other_than: 1 } 
end
