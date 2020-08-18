class BuysController < ApplicationController
  def create
    Buys.create(buy_params)
  end

  def buy_params
    params.require(:buy).permit(:item_name, :image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id)
  end
end
