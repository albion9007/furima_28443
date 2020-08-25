class AddressController < ApplicationController

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(address_params)
    if @buy_address.valid?
      @buy_address.save
    end
  end

  private

  def address_params
    params.require(:buy_address).permit(:post_num,:prefecture_id,
       :city,:house_num, :apart_name, :tel).merge(user_id, item_id)
  end


end
