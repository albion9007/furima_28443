class AddressController < ApplicationController

  def new
    @address = BuyAddress.new
  end

  private

  def address_params
    params.require(:buy_address).permit(:post_num,:prefecture_id,
       :city,:house_num, :apart_name, :tel).merge(user_id, buy_id)
  end


end
