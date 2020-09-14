class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except:[:index]


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

  def show
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        redirect_to action: :edit
      end
    else
      redirect_to action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :content, :category_id, :condition_id, :price, :delivery_burden_id, :delivery_area_id, :delivery_days_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
 
  def set_item
    @item = Item.find(params[:id])
  end
end
