class BuysController < ApplicationController
  before_action :set_item, only: [:new, :create, :pay_item]
  before_action :move_to_session
  before_action :move_to_index
  
  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save   
      return redirect_to root_path
    end
    render 'new'
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_num, :prefecture_id, :city,
      :house_num, :apart_name, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item=Item.find(params[:item_id])
  end

  def item_params
    params.require(item_id).permit(:item_name,:image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end

    if @item.buy.present?
      redirect_to root_path
    end
  end
end
