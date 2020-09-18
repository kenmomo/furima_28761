class InformationsController < ApplicationController
  before_action :move_to_index, except: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :correct_user, only: [:create, :index]
  before_action :soldout_item, only: [:create, :index]

  def index 
    @information = InformationAddress.new

  end

  def new
    @information = InformationAddress.new
  end

  def create
    @information = InformationAddress.new(information_params)
    if @information.valid?
      pay_item
      @information.save
      return redirect_to root_path
    else
      render 'index'
    end
  end





 private

 def information_params
  params.permit(:token, :item_id, :postal_code, :prefecture_id, :city_name, :block_number, :buildding_name, :phone_number, :information_id).merge(user_id: current_user.id)
 end

 def set_item
  @item = Item.find(params[:item_id])
 end


def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: information_params[:token],    # カードトークン
    currency:'jpy'                 # 通貨の種類(日本円)
  )
end

def correct_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
end

def soldout_item
  if @item.information.present?
    redirect_to root_path
  end
end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end