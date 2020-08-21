class BuysController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :move_to_session
  before_action :move_to_index

  def new
    @buy = Buy.new
  end

  def create
  end

  private

  def set_item
    # @item = Item.find(params[:id])
    @item=Item.find(params[:item_id])
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
