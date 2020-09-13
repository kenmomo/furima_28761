class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :content, :category_id, :condition_id, :price, :delivery_burden_id, :delivery_area_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end
