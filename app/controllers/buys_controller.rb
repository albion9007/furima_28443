class BuysController < ApplicationController


  def new
    @buy = Buy.new
    
  end
  
  def index
    @buy = Buy.includes(:item)
  end
  
  def create
    Buys.create(buy_params)
  end

  def buy_params
    params.require(:buy).permit(:item_name, :image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id)
  end
end
