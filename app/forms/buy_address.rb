class BuyAddress

  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city,
  :house_num, :apart_name, :tel, :item_id, :token, :user_id


  validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id) 
    Address.create(post_num: post_num, prefecture_id: prefecture_id, 
      city: city, house_num: house_num, apart_name: apart_name, tel: tel, buy_id: buy.id)
    # binding.pry
  end

end

