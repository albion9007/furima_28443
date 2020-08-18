class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def new
    @item = Item.new
    
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      # @items = @item.includes(:user)
      render "new"    # バリデーションに弾かれた時
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
