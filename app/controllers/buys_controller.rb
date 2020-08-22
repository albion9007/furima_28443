class BuysController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :move_to_session
  before_action :move_to_index

  def new
    @buy = Buy.new
    @buy = Buy.includes(:item)
    @item = Item.find(params[:item_id])
  end

  def create
    # @buy = Buy.new(price: buy_params[:price])
    @buy = BuyAddress.new(price: buy_params[:price])
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    end
    render 'new'
  end

  private

  def buy_params
    params.permit(:price, :token)
    params.permit(:user_id)
    params.require(:item).permit(:image,:item_explain,
       :deliveryfee_id,:price).merge(user_id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[:price],
      card: buy_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item=Item.find(params[:item_id])
  end

  def item_params
    params.require(:item).permit(:item_name,:image,
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
  end
  
end
