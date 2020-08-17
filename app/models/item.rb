class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :shipplace
  belongs_to_active_hash :shipday

  
  
  with_options presence: true do
    # validates_associated :images
    validates :image
    validates :item_name
    validates :item_explain
    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { greater_than: 1, message: 'Select' }
    validates :quality_id, numericality: { greater_than: 1, message: 'Select' }
    validates :deliveryfee_id, numericality: { greater_than: 1, message: 'Select' }
    validates :shipplace_id, numericality: { greater_than: 1, message: 'Select' }
    validates :shipday_id, numericality: { greater_than: 1, message: 'Select' }
    # 価格が半角で入力されていて範囲が、¥300~¥9,999,999の間でなければ出品出来ない
    # pricenum = /\A[300-9999999]{3,7}\d+\z/
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
    validates :price, numericality: { only_integer:true, message: 'Half-width number' }
  end
end