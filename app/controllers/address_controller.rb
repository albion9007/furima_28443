class AddressController < ApplicationController

  def new
    @address = BuyAddress.new
  end

  def create
    @address = BuyAddress.new(address_params)
    if @address.valid?
      @address.save
    end
  end

  private

  def address_params
    params.require(:buy_address).permit(:post_num,:prefecture_id,
       :city,:house_num, :apart_name, :tel).merge(user_id, item_id)
  end


end
