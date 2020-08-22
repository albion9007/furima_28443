class BuyAddress

  include ActiveModel::Model
  attr_accessor :(:image,:item_explain,:deliveryfee_id,:price).merge(user_id), 
  (:post_num,:prefecture_id,:city,:house_num, :apart_name, :tel).merge(user_id, buy_id)

  with_options presence: true do
    validates :price
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    # 住所の情報を保存
    Address.create(post_num: postal_code, prefecture_id: buy_prefecture, 
      city: city, house_num: addresses, apart_name: building, tel: phone-number, buy_id: buy.id)
    # 購入金額の情報を保存
    Buy.create(price: price, user_id: user.id)
  end

end