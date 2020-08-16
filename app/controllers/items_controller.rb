class ItemsController < ApplicationController

  def new
    @item = Item.new
    
  end

  def index
    @items = Item.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :"new"
    end
  end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    end

  private

  def item_params
    params.require(:item).permit(:item_name, :image,
       :item_explain, :category_id,:quality_id, :deliveryfee_id,
       :shipplace_id, :shipday_id, :price).merge(user_id: current_user.id)
  end
end
