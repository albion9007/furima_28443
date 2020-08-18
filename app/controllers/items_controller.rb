class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def new
    @item = Item.new
    
  end

  def index
    @items = Item.order("created_at DESC")

  end
  
  def create
    @user = User.find(params[:current_user_id])
    @item = @user.items.new(item_params)
    if  @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
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
