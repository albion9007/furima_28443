class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def update
    if @item.update(item_params)  # バリデーションをクリアした時
    redirect_to item_path
    else
      render :edit  # バリデーションに弾かれた時
    end
  end
    
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    # binding.pry
    params.require(:item).permit(:item_name, :image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
