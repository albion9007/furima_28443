class BuyAddress

  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city,
  :house_num, :apart_name, :tel, :item_id, :token, :user_id


  with_options presence: true do
    validates :city
    validates :house_num
    validates :token
    POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    validates :post_num, format: {with: POSTAL_CODE_REGEX, message: "Input correctly"}
    validates :prefecture_id, numericality: { greater_than: 1, message: "Select" }
    tel_num = /\A[0-9]{,11}\z/
    validates :tel, format: { with: tel_num, message: "can't be blank" }
    validates :tel, format: { with: tel_num, message: "is invalid. Include hyphen(-)" }
  end

  
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id) 
    Address.create(post_num: post_num, prefecture_id: prefecture_id, 
      city: city, house_num: house_num, apart_name: apart_name, tel: tel, buy_id: buy.id)
  end
end